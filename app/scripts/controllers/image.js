'use strict';

/**
 * @ngdoc function
 * @name openshiftConsole.controller:ImageController
 * @description
 * Controller of the openshiftConsole
 */
angular.module('openshiftConsole')
  .controller('ImageController', function ($scope,
                                           $routeParams,
                                           DataService,
                                           ProjectsService,
                                           $filter,
                                           ImageStreamsService,
                                           imageLayers) {
    $scope.projectName = $routeParams.project;
    $scope.imageStream = null;
    $scope.image = null;
    $scope.layers = null;
    $scope.tagsByName = {};
    $scope.alerts = {};
    $scope.renderOptions = $scope.renderOptions || {};
    $scope.renderOptions.hideFilterWidget = true;

    $scope.breadcrumbs = [
      {
        title: "Image Streams",
        link: "project/" + $routeParams.project + "/browse/images"
      },
      {
        title: $routeParams.imagestream,
        link: "project/" + $routeParams.project + "/browse/images/" + $routeParams.imagestream
      },
      {
        title: ":" + $routeParams.tag
      }
    ];

    var watches = [];

    var fetchImageStreamTag = _.debounce(function(tagData, context) {
      var name = $routeParams.imagestream + ":" + $routeParams.tag;
      DataService.get("imagestreamtags", name, context).then(
        // success
        function(imageStreamTag) {
          $scope.loaded = true;
          $scope.image = imageStreamTag.image;
          $scope.layers = imageLayers($scope.image);
        },
        // failure
        function(e) {
          $scope.loaded = true;
          $scope.alerts["load"] = {
            type: "error",
            message: "镜像详情不能被加载.",
            details: "Reason: " + $filter('getErrorDetails')(e)
          };
        }
      );
    }, 200);

    function populateWithImageStream(imageStream, context) {
      var tagsByName = ImageStreamsService.tagsByName(imageStream);

      $scope.imageStream = imageStream;
      $scope.tagsByName = tagsByName;
      $scope.tagName = $routeParams.tag;

      var tagData = tagsByName[$routeParams.tag];
      if (!tagData) {
        $scope.alerts["load"] = {
          type: "error",
          message: "镜像流中没有找到镜像标签.",
        };
        return;
      }

      delete $scope.alerts["load"];
      fetchImageStreamTag(tagData, context);
    }

    var imageStreamResolved = function(imageStream, context, action) {
      populateWithImageStream(imageStream, context);
      if (action === "DELETED") {
        $scope.alerts["deleted"] = {
          type: "warning",
          message: "镜像流已经被删除."
        };
      }
    };

    ProjectsService
      .get($routeParams.project)
      .then(_.spread(function(project, context) {
        $scope.project = project;
        DataService
          .get("imagestreams", $routeParams.imagestream, context)
          .then(function(imageStream) {
            imageStreamResolved(imageStream, context);
            watches.push(DataService.watchObject("imagestreams", $routeParams.imagestream, context, function(imageStream, action) {
              imageStreamResolved(imageStream, context, action);
            }));
          }, function(e) {
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
