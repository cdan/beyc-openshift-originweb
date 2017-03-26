"use strict";

angular.module("openshiftConsole")

  .directive("createSecret",
             function($filter,
                      AuthorizationService,
                      DataService,
                      DNS1123_SUBDOMAIN_VALIDATION) {
    return {
      restrict: 'E',
      scope: {
        type: '=',
        serviceAccountToLink: '=?',
        namespace: '=',
        postCreateAction: '&',
        cancel: '&'
      },
      templateUrl: 'views/directives/create-secret.html',
      link: function($scope) {
        $scope.alerts = {};
        $scope.nameValidation = DNS1123_SUBDOMAIN_VALIDATION;

        $scope.secretAuthTypeMap = {
          image: {
            label: "Image Secret",
            authTypes: [
              {
                id: "kubernetes.io/dockercfg",
                label: "Image Registry Credentials"
              },
              {
                id: "kubernetes.io/dockerconfigjson",
                label: "Configuration File"
              }
            ]
          },
          source: {
            label: "Source Secret",
            authTypes: [
              {
                id: "kubernetes.io/basic-auth",
                label: "Basic Authentication"
              },
              {
                id: "kubernetes.io/ssh-auth",
                label: "SSH Key"
              }
            ]
          }
        };

        $scope.secretTypes = _.keys($scope.secretAuthTypeMap);
        // newSecret format:
        //   - type:                       image || source
        //   - authType:                   image  = [kubernetes.io/dockercfg, "kubernetes.io/dockerconfigjson"]
        //                                 source = ["kubernetes.io/basic-auth, "kubernetes.io/ssh-auth"]
        //   - data:                       based on the authentication type
        //   - pickedServiceAccountToLink  based on the view in which the directive is used.
        //                                  - if in BC the 'builder' SA if picked automatically
        //                                  - if in DC the 'deployer' SA if picked automatically
        //                                  - else the user will have to pick the SA and type of linking
        if ($scope.type) {
          $scope.newSecret = {
            type: $scope.type,
            authType: $scope.secretAuthTypeMap[$scope.type].authTypes[0].id,
            data: {},
            linkSecret: !_.isEmpty($scope.serviceAccountToLink),
            pickedServiceAccountToLink: $scope.serviceAccountToLink || "",
          };
        } else {
          $scope.newSecret = {
            type: "source",
            authType: "kubernetes.io/basic-auth",
            data: {},
            linkSecret: false,
            pickedServiceAccountToLink: "",
          };
        }

        $scope.add = {
          gitconfig: false,
          cacert: false
        };

        // List SA only if $scope.serviceAccountToLink is not defined so user has to pick one.
        if (AuthorizationService.canI('serviceaccounts', 'list') && AuthorizationService.canI('serviceaccounts', 'update')) {
          DataService.list("serviceaccounts", $scope, function(result) {
            $scope.serviceAccounts = result.by('metadata.name');
            $scope.serviceAccountsNames = _.keys($scope.serviceAccounts);
          });
        }

        var constructSecretObject = function(data, authType) {
          var secret = {
            apiVersion: "v1",
            kind: "Secret",
            metadata: {
              name: $scope.newSecret.data.secretName
            },
            type: authType,
            data: {}
          };

          switch (authType) {
            case "kubernetes.io/basic-auth":
              // If the password/token is not entered either .gitconfig or ca.crt has to be provided
              if (data.passwordToken) {
                secret.data = {password: window.btoa(data.passwordToken)};
              } else {
                secret.type = "Opaque";
              }
              if (data.username) {
                secret.data.username = window.btoa(data.username);
              }
              if (data.gitconfig) {
                secret.data[".gitconfig"] = window.btoa(data.gitconfig);
              }
              if (data.cacert) {
                secret.data["ca.crt"] = window.btoa(data.cacert);
              }
              break;
            case "kubernetes.io/ssh-auth":
              secret.data = {'ssh-privatekey': window.btoa(data.privateKey)};
              if (data.gitconfig) {
                secret.data[".gitconfig"] = window.btoa(data.gitconfig);
              }
              break;
            case "kubernetes.io/dockerconfigjson":
              var encodedConfig = window.btoa(data.dockerConfig);
              if (JSON.parse(data.dockerConfig).auths) {
                secret.data[".dockerconfigjson"] = encodedConfig;
              } else {
                secret.type = "kubernetes.io/dockercfg";
                secret.data[".dockercfg"] = encodedConfig;
              }
              break;
            case "kubernetes.io/dockercfg":
              var auth = window.btoa(data.dockerUsername + ":" + data.dockerPassword);
              var configData = {};
              configData[data.dockerServer] = {
                username: data.dockerUsername,
                password: data.dockerPassword,
                email: data.dockerMail,
                auth: auth
              };
              secret.data[".dockercfg"] = window.btoa(JSON.stringify(configData));
              break;
          }
          return secret;
        };

        var linkSecretToServiceAccount = function(secret, alerts) {
          var updatedSA = angular.copy($scope.serviceAccounts[$scope.newSecret.pickedServiceAccountToLink]);
          switch ($scope.newSecret.type) {
          case 'source':
            updatedSA.secrets.push({name: secret.metadata.name});
            break;
          case 'image':
            updatedSA.imagePullSecrets.push({name: secret.metadata.name});
            break;
          }
          // Don't show any error related to linking to SA when linking is done automatically
          var options = $scope.serviceAccountToLink ? {errorNotification: false} : {};
          DataService.update('serviceaccounts', $scope.newSecret.pickedServiceAccountToLink, updatedSA, $scope, options).then(function(sa) {
            alerts.push({
              name: 'create',
              data: {
                type: "success",
                message: "机密 " + secret.metadata.name + "已被创建并且链接到服务账户 " + sa.metadata.name + "."
              }
            });
            $scope.postCreateAction({newSecret: secret, creationAlert: alerts});
          }, function(result){
            alerts.push({
              name: 'createAndLink',
              data: {
                type: "error",
                message: "机密链接到服务账户 " + $scope.newSecret.pickedServiceAccountToLink + "时出现错误.",
                details: $filter('getErrorDetails')(result)
              }
            });
            $scope.postCreateAction({newSecret: secret, creationAlert: alerts});
          });
        };

        var updateEditorMode = _.debounce(function(){
          try {
            JSON.parse($scope.newSecret.data.dockerConfig);
            $scope.invalidConfigFormat = false;
          } catch (e) {
            $scope.invalidConfigFormat = true;
          }
        }, 300, {
          'leading': true
        });

        $scope.aceChanged = updateEditorMode;

        $scope.create = function() {
          $scope.alerts = {};
          var newSecret = constructSecretObject($scope.newSecret.data, $scope.newSecret.authType);
          DataService.create('secrets', null, newSecret, $scope).then(function(secret) { // Success
            var alert = [{
              name: 'create',
              data: {
                type: "success",
                message: "机密 " + newSecret.metadata.name + " was 创建."
              }
            }];
            // In order to link:
            // - the SA has to be defined
            // - defined SA has to be present in the obtained SA list
            // - user can update SA
            // Else the linking will be skipped
            if ($scope.newSecret.linkSecret && $scope.serviceAccountsNames.contains($scope.newSecret.pickedServiceAccountToLink) && AuthorizationService.canI('serviceaccounts', 'update')) {
              linkSecretToServiceAccount(secret, alert);
            } else {
              $scope.postCreateAction({newSecret: secret, creationAlert: alert});
            }
          }, function(result) { // Failure
            var data = result.data || {};
            if (data.reason === 'AlreadyExists') {
              $scope.nameTaken = true;
              return;
            }
            $scope.alerts["create"] = {
              type: "error",
              message: "创建机密时出现问题.",
              details: $filter('getErrorDetails')(result)
            };
          });
        };
      },
    };
  });
