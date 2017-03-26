'use strict';

/**
 * @ngdoc function
 * @name openshiftConsole.controller:CreateFromURLController
 * @description
 * Controller of the openshiftConsole
 */
angular.module('openshiftConsole')
  .controller('CreateFromURLController', function ($scope, $routeParams, $location, $filter, AuthService, DataService, AlertMessageService, Navigate, ProjectsService ) {
    AuthService.withUser();

    AlertMessageService.getAlerts().forEach(function(alert) {
      $scope.alerts[alert.name] = alert.data;
    });
    AlertMessageService.clearAlerts();

    $scope.alerts = {};
    $scope.selected = {};

    var alertInvalidImageStream = function(imageStream) {
      $scope.alerts.invalidImageStream = {
        type: "error",
        message: "请求的镜像流 \"" + imageStream + "\" 不能被加载."
      };
    };

    var alertInvalidImageTag = function(imageTag) {
      $scope.alerts.invalidImageTag = {
        type: "error",
        message: "请求的镜像流标签 \"" + imageTag + "\" 不能被加载."
      };
    };

    var alertInvalidName = function(name) {
      $scope.alerts.invalidImageStream = {
        type: "error",
        message: "应用名称 \"" + name + "\" 校验未通过.  应用名字是由字母数字(a-z和数字0-9)组成的一个混合的长度为24位的字符串，且字符创中的第一个字符是(a-z)中的一个，且"-"允许在这个字符串中除了第一个和最后一个的任何位置"
      };
    };

    var alertInvalidNamespace = function(namespace) {
      $scope.alerts.invalidNamespace = {
        type: "error",
        message:"命名空间 \"" + namespace + "\" 的资源不允许使用."
      };
    };

    var alertInvalidTemplate = function(template) {
      $scope.alerts.invalidTemplate = {
        type: "error",
        message:  "模版 \"" + template + "\" 不能被加载."
      };
    };

    var alertResourceRequired = function() {
      $scope.alerts.resourceRequired = {
        type: "error",
        message: "镜像或模版正在被访问."
      };
    };

    var showInvalidResource = function() {
      $scope.alerts.invalidResource = {
        type: "error",
        message: "镜像流和模版不匹配."
      };
    };

    var getTemplateParamsMap = function () {
      try {
        return $routeParams.templateParamsMap && JSON.parse($routeParams.templateParamsMap) || {};
      }
      catch (e) {
        $scope.alerts.invalidTemplateParams = {
          type: "error",
          message: "参数模版JSON格式不正确. " + e
        };
      }
    };

    var namespaceWhitelist = window.OPENSHIFT_CONSTANTS.CREATE_FROM_URL_WHITELIST;
    var whiteListedCreateDetailsKeys = ['namespace', 'name', 'imageStream', 'imageTag', 'sourceURI', 'sourceRef', 'contextDir', 'template', 'templateParamsMap'];
    var createDetails = _.pick($routeParams, function(value, key) {
      // routeParams without a value (e.g., ?name&) return true, which results in "true" displaying in the UI
      return _.contains(whiteListedCreateDetailsKeys, key) && _.isString(value);
    });
    // if no namespace is specified, set it to 'openshift'
    createDetails.namespace = createDetails.namespace || 'openshift';

    var validateName = function (name) {
      return name.length < 25 && /^[a-z]([-a-z0-9]*[a-z0-9])?$/.test(name);
    };

    var getResources = function() {
      if (createDetails.imageStream) {
        DataService
          .get("imagestreams", createDetails.imageStream, {namespace: createDetails.namespace}, {
            errorNotification: false
          })
          .then(function(imageStream) {
            $scope.imageStream = imageStream;
            DataService
              .get("imagestreamtags", imageStream.metadata.name + ":" + createDetails.imageTag, {namespace: createDetails.namespace}, {
                  errorNotification: false
              })
              .then(function(imageStreamTag){
                $scope.imageStreamTag = imageStreamTag;
                $scope.validationPassed = true;
                $scope.resource = imageStreamTag;
                createDetails.displayName = $filter('displayName')(imageStreamTag);
              }, function(){
                alertInvalidImageTag(createDetails.imageTag);
              });
          }, function() {
            alertInvalidImageStream(createDetails.imageStream);
          });
      }
      if (createDetails.template) {
        DataService
          .get("templates", createDetails.template, {namespace: createDetails.namespace}, {
            errorNotification: false
          })
          .then(function(template) {
            $scope.template = template;
            if(getTemplateParamsMap()) {
              $scope.validationPassed = true;
              $scope.resource = template;
            }
          }, function() {
            alertInvalidTemplate(createDetails.template);
          });
      }
    };

    if (!(_.includes(namespaceWhitelist, createDetails.namespace))) {
      alertInvalidNamespace(createDetails.namespace);
    } else {
      if (createDetails.imageStream && createDetails.template) {
        showInvalidResource();
      } else if (!(createDetails.imageStream) && !(createDetails.template)) {
        alertResourceRequired();
      } else if (createDetails.name && !(validateName(createDetails.name))) {
        alertInvalidName(createDetails.name);
      } else {
        getResources();
      }
    }

    angular.extend($scope, {
      createDetails: createDetails,
      createWithProject: function(projectName) {
        projectName = projectName || $scope.selected.project.metadata.name;
        var url = $routeParams.imageStream ?
                    Navigate.createFromImageURL($scope.imageStream, createDetails.imageTag, projectName, createDetails) :
                    Navigate.createFromTemplateURL($scope.template, projectName, createDetails);
        $location.url(url);
      }
    });

    $scope.projects = {};
    $scope.canCreateProject = undefined;

    DataService
      .list("projects", $scope)
      .then(function(items) {
        $scope.loaded = true;
        $scope.projects = $filter('orderByDisplayName')(items.by("metadata.name"));
        $scope.noProjects = (_.isEmpty($scope.projects));
      });


    // Test if the user can submit project requests. Handle error notifications
    // ourselves because 403 responses are expected.
    ProjectsService
      .canCreate()
      .then(function() {
        $scope.canCreateProject = true;
      }, function() {
        $scope.canCreateProject = false;
      });

  });
