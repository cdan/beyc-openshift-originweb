'use strict';

/**
 * @ngdoc function
 * @name openshiftConsole.controller:ImageController
 * @description
 * Controller of the openshiftConsole
 */
angular.module('openshiftConsole')
  .controller('ImageStreamController', function ($scope, $routeParams, DataService, ProjectsService, $filter, ImageStreamsService) {
    $scope.projectName = $routeParams.project;
    $scope.imageStream = null;
    $scope.tags = [];
    $scope.tagShowOlder = {};
    $scope.alerts = {};
    $scope.renderOptions = $scope.renderOptions || {};
    $scope.renderOptions.hideFilterWidget = true;
    $scope.breadcrumbs = [
      {
        title: "Image Streams",
        link: "project/" + $routeParams.project + "/browse/images"
      },
      {
        title: $routeParams.imagestream
      }
    ];
    $scope.emptyMessage = "Loading...";

    var watches = [];

    ProjectsService
      .get($routeParams.project)
      .then(_.spread(function(project, context) {
        $scope.project = project;
        DataService.get("imagestreams", $routeParams.imagestream, context).then(
          // success
          function(imageStream) {
            $scope.loaded = true;
            $scope.imageStream = imageStream;
            $scope.emptyMessage = "No tags to show";

            // If we found the item successfully, watch for changes on it
            watches.push(DataService.watchObject("imagestreams", $routeParams.imagestream, context, function(imageStream, action) {
              if (action === "DELETED") {
                $scope.alerts["deleted"] = {
                  type: "warning",
                  message:  "镜像流已经被删除."
                };
              }
              $scope.imageStream = imageStream;
              $scope.tags = _.toArray(ImageStreamsService.tagsByName($scope.imageStream));
            }));
          },
          // failure
          function(e) {
            $scope.loaded = true;
            $scope.alerts["load"] = {
              type: "error",
              message: "镜像流详情不能被加载.",
              details: "Reason: " + $filter('getErrorDetails')(e)
            };
          });

        $scope.$on('$destroy', function(){
          DataService.unwatchAll(watches);
        });

      }));
  });
