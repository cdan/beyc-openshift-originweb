'use strict';

/**
 * @ngdoc function
 * @name openshiftConsole.controller:PersistentVolumeClaimController
 * @description
 * # StorageController
 * Controller of the openshiftConsole
 */
angular.module('openshiftConsole')
  .controller('PersistentVolumeClaimController', function ($scope, $routeParams, DataService, ProjectsService, $filter) {
    $scope.projectName = $routeParams.project;
    $scope.pvc = null;
    $scope.alerts = {};
    $scope.renderOptions = $scope.renderOptions || {};
    $scope.renderOptions.hideFilterWidget = true;
    $scope.breadcrumbs = [
      {
        title: "Persistent Volume Claims",
        link: "project/" + $routeParams.project + "/browse/storage"
      },
      {
        title: $routeParams.pvc
      }
    ];

    var watches = [];

    var pvcResolved = function(pvc, action) {
      $scope.pvc = pvc;
      $scope.loaded = true;
      if (action === "DELETED") {
        $scope.alerts["deleted"] = {
          type: "warning",
          message: "持久卷声明已经被删除."
        };
      }
    };

    ProjectsService
    .get($routeParams.project)
    .then(_.spread(function(project, context) {
      $scope.project = project;
      DataService
        .get("persistentvolumeclaims", $routeParams.pvc, context)
        .then(function(pvc) {
          pvcResolved(pvc);
          watches.push(DataService.watchObject("persistentvolumeclaims", $routeParams.pvc, context, pvcResolved));
        }, function(e) {
          $scope.loaded = true;
          $scope.alerts["load"] = {
            type: "error",
            message: "持久的卷声明详情不能被加载.",
            details: "Reason: " + $filter('getErrorDetails')(e)
          };
        });

      $scope.$on('$destroy', function(){
        DataService.unwatchAll(watches);
      });

    }));
});
