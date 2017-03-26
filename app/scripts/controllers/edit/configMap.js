'use strict';

/**
 * @ngdoc function
 * @name openshiftConsole.controller:EditConfigMapController
 * @description
 * # EditConfigMapController
 * Controller of the openshiftConsole
 */
angular.module('openshiftConsole')
  .controller('EditConfigMapController',
              function ($filter,
                        $routeParams,
                        $scope,
                        $window,
                        DataService,
                        BreadcrumbsService,
                        Navigate,
                        ProjectsService) {
    var watches = [];
    $scope.alerts = {};
    $scope.forms = {};
    $scope.projectName = $routeParams.project;

    $scope.breadcrumbs = BreadcrumbsService.getBreadcrumbs({
      name: $routeParams.configMap,
      kind: 'ConfigMap',
      namespace: $routeParams.project,
      includeProject: true,
      subpage: 'Edit Config Map'
    });

    var getVersion = function(resource) {
      return _.get(resource, 'metadata.resourceVersion');
    };

    ProjectsService
      .get($routeParams.project)
      .then(_.spread(function(project, context) {
        DataService
          .get("configmaps", $routeParams.configMap, context)
          .then(function(configMap) {
            $scope.loaded = true;
            $scope.breadcrumbs = BreadcrumbsService.getBreadcrumbs({
              name: $routeParams.configMap,
              object: configMap,
              includeProject: true,
              project: project,
              subpage: 'Edit Config Map'
            });
            $scope.configMap = configMap;
            watches.push(DataService.watchObject("configmaps", $routeParams.configMap, context, function(newValue, action) {
              $scope.resourceChanged = getVersion(newValue) !== getVersion($scope.configMap);
              $scope.resourceDeleted = action === "DELETED";
            }));
          }, function(e) {
            $scope.loaded = true;
            $scope.alerts["load"] = {
              type: "error",
              message:"配置图详情不能被加载.",
              details: $filter('getErrorDetails')(e)
            };
          });

        $scope.updateConfigMap = function() {
          if ($scope.forms.editConfigMapForm.$valid) {
            $scope.disableInputs = true;

            DataService.update('configmaps', $scope.configMap.metadata.name, $scope.configMap, context)
              .then(function() { // Success
                // Return to the previous page
                $window.history.back();
              }, function(result) { // Failure
                $scope.disableInputs = false;
                $scope.alerts['create-config-map'] = {
                  type: "error",
                  message: "配置图更新时出现错误.",
                  details: $filter('getErrorDetails')(result)
                };
              });
          }
        };

        $scope.$on('$destroy', function(){
          DataService.unwatchAll(watches);
        });
    }));
  });
