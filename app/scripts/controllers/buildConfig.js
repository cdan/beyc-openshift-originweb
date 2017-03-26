'use strict';

/**
 * @ngdoc function
 * @name openshiftConsole.controller:BuildConfigController
 * @description
 * Controller of the openshiftConsole
 */
angular.module('openshiftConsole')
  .controller('BuildConfigController', function ($scope,
                                                 $filter,
                                                 $routeParams,
                                                 AlertMessageService,
                                                 APIService,
                                                 BuildsService,
                                                 ImagesService,
                                                 DataService,
                                                 LabelFilter,
                                                 ModalsService,
                                                 ProjectsService,
                                                 keyValueEditorUtils) {
    $scope.projectName = $routeParams.project;
    $scope.buildConfigName = $routeParams.buildconfig;
    $scope.buildConfig = null;
    $scope.labelSuggestions = {};
    $scope.alerts = {};
    $scope.breadcrumbs = [];
    $scope.forms = {};
    $scope.expand = {imageEnv: false};

    if ($routeParams.isPipeline) {
      $scope.breadcrumbs.push({
        title: "Pipelines",
        link: "project/" + $routeParams.project + "/browse/pipelines"
      });
    } else {
      $scope.breadcrumbs.push({
        title: "Builds",
        link: "project/" + $routeParams.project + "/browse/builds"
      });
    }
    $scope.breadcrumbs.push({
      title: $routeParams.buildconfig
    });

    $scope.emptyMessage = "Loading...";

    AlertMessageService.getAlerts().forEach(function(alert) {
      $scope.alerts[alert.name] = alert.data;
    });
    AlertMessageService.clearAlerts();

    $scope.aceLoaded = function(editor) {
      var session = editor.getSession();
      session.setOption('tabSize', 2);
      session.setOption('useSoftTabs', true);
      editor.$blockScrolling = Infinity;
    };

    var buildConfigForBuild = $filter('buildConfigForBuild');
    var buildStrategy = $filter('buildStrategy');
    var watches = [];

    var requestContext;

    // copy buildConfig and ensure it has env so that we can edit env vars using key-value-editor
    var copyBuildConfigAndEnsureEnv = function(buildConfig) {
      $scope.updatedBuildConfig = angular.copy(buildConfig);
      $scope.envVars = buildStrategy($scope.updatedBuildConfig).env || [];
    };

    $scope.saveEnvVars = function() {
      $scope.envVars = _.filter($scope.envVars, 'name');
      buildStrategy($scope.updatedBuildConfig).env = keyValueEditorUtils.compactEntries(angular.copy($scope.envVars));
      DataService
        .update("buildconfigs", $routeParams.buildconfig, $scope.updatedBuildConfig, requestContext)
        .then(function success(){
          // TODO:  de-duplicate success and error messages.
          // as it stands, multiple messages appear based on how edit
          // is made.
          $scope.alerts['saveBCEnvVarsSuccess'] = {
            type: "success",
            // TODO:  improve success alert
            message: $scope.buildConfigName + " 被更新."
          };
          $scope.forms.bcEnvVars.$setPristine();
        }, function error(e){
          $scope.alerts['saveBCEnvVarsError'] = {
            type: "error",
            message: $scope.buildConfigName + " 不能更新.",
            details: "原因: " + $filter('getErrorDetails')(e)
          };
        });
    };

    $scope.clearEnvVarUpdates = function() {
      copyBuildConfigAndEnsureEnv($scope.buildConfig);
      $scope.forms.bcEnvVars.$setPristine();
    };

    var lastLoadedBuildFromImageKey;

    var buildConfigResolved = function(buildConfig, action) {
      $scope.loaded = true;
      $scope.buildConfig = buildConfig;
      $scope.buildConfigPaused = BuildsService.isPaused($scope.buildConfig);
      if ($scope.buildConfig.spec.source.images) {
        $scope.imageSources = $scope.buildConfig.spec.source.images;
        $scope.imageSourcesPaths = [];
        $scope.imageSources.forEach(function(imageSource) {
          $scope.imageSourcesPaths.push($filter('destinationSourcePair')(imageSource.paths));
        });
      }
      var buildFrom = _.get(buildStrategy(buildConfig), 'from', {});
      // We don't want to reload the image every time the BC updates, only load again if the from changes
      var buildFromImageKey = buildFrom.kind + "/" + buildFrom.name + "/" + (buildFrom.namespace || $scope.projectName);
      if (lastLoadedBuildFromImageKey !== buildFromImageKey) {
        if (_.includes(["ImageStreamTag", "ImageStreamImage"], buildFrom.kind)) {
          lastLoadedBuildFromImageKey = buildFromImageKey;
          DataService.get(APIService.kindToResource(buildFrom.kind), buildFrom.name, {namespace: buildFrom.namespace || $scope.projectName}, {errorNotification: false}).then(function(imageStreamImage){
            $scope.BCEnvVarsFromImage = ImagesService.getEnvironment(imageStreamImage);
          }, function() {
            // We may not be able to fetch the image info as the end user, don't reveal any errors
            $scope.BCEnvVarsFromImage = [];
          });
        }
        else {
          $scope.BCEnvVarsFromImage = [];
        }
      }
      copyBuildConfigAndEnsureEnv(buildConfig);
      if (action === "DELETED") {
        $scope.alerts["deleted"] = {
          type: "warning",
          message: "构建的配置信息已被删除."
        };
        $scope.buildConfigDeleted = true;
      }
      if (!$scope.forms.bcEnvVars || $scope.forms.bcEnvVars.$pristine) {
        copyBuildConfigAndEnsureEnv(buildConfig);
      } else {
        $scope.alerts["background_update"] = {
          type: "warning",
          message: "构建的配置已经被更新在界面中。保存你的修改可能会有冲突或者数据的丢失.",
          links: [
            {
              label: 'Reload Environment Variables',
              onClick: function() {
                $scope.clearEnvVarUpdates();
                return true;
              }
            }
          ]
        };
      }

      $scope.paused = BuildsService.isPaused($scope.buildConfig);
    };

    ProjectsService
      .get($routeParams.project)
      .then(_.spread(function(project, context) {
        $scope.project = project;
        requestContext = context;
        DataService
          .get("buildconfigs", $routeParams.buildconfig, context)
          .then(function(buildConfig) {
            buildConfigResolved(buildConfig);
            // If we found the item successfully, watch for changes on it
            watches.push(DataService.watchObject("buildconfigs", $routeParams.buildconfig, context, buildConfigResolved));
          },
          // failure
          function(e) {
            $scope.loaded = true;
            $scope.alerts["load"] = {
              type: "error",
              message: e.status === 404 ? "构建的配置信息无法找到, 可能已被删除." : "构建的配置详细信息不能被加载.",
              details: e.status === 404 ? "剩余的构建历史记录都将被显示." : "原因: " + $filter('getErrorDetails')(e)
            };
          }
        );

      watches.push(DataService.watch("builds", context, function(builds, action, build) {
        $scope.emptyMessage = "No builds to show";
        if (!action) {
          $scope.unfilteredBuilds = BuildsService.validatedBuildsForBuildConfig($routeParams.buildconfig, builds.by('metadata.name'));
        } else {
          var buildConfigName = buildConfigForBuild(build);
          if (buildConfigName === $routeParams.buildconfig) {
            var buildName = build.metadata.name;
            switch (action) {
              case 'ADDED':
              case 'MODIFIED':
                $scope.unfilteredBuilds[buildName] = build;
                break;
              case 'DELETED':
                delete $scope.unfilteredBuilds[buildName];
                break;
            }
          }
        }

        $scope.builds = LabelFilter.getLabelSelector().select($scope.unfilteredBuilds);
        updateFilterWarning();
        LabelFilter.addLabelSuggestionsFromResources($scope.unfilteredBuilds, $scope.labelSuggestions);
        LabelFilter.setLabelSuggestions($scope.labelSuggestions);

        // Sort now to avoid sorting on every digest loop.
        $scope.orderedBuilds = BuildsService.sortBuilds($scope.builds, true);
        $scope.latestBuild = $scope.orderedBuilds.length ? $scope.orderedBuilds[0] : null;
      },
      // params object for filtering
      {
        // http is passed to underlying $http calls
        http: {
          params: {
            // because build config names can be > 63 chars but label values can't
            // and we can't do a fieldSelector on annotations.  Plus old builds dont have the annotation.
            labelSelector: $filter('labelName')('buildConfig') + '=' + _.trunc($scope.buildConfigName, {length: 63, omission: ''})
          }
        }
      }));

        function updateFilterWarning() {
          if (!LabelFilter.getLabelSelector().isEmpty() && $.isEmptyObject($scope.builds) && !$.isEmptyObject($scope.unfilteredBuilds)) {
            $scope.alerts["builds"] = {
              type: "warning",
              details: "The active filters are hiding all builds."
            };
          }
          else {
            delete $scope.alerts["builds"];
          }
        }

        LabelFilter.onActiveFiltersChanged(function(labelSelector) {
          // trigger a digest loop
          $scope.$apply(function() {
            $scope.builds = labelSelector.select($scope.unfilteredBuilds);
            $scope.orderedBuilds = BuildsService.sortBuilds($scope.builds, true);
            $scope.latestBuild = $scope.orderedBuilds.length ? $scope.orderedBuilds[0] : null;
            updateFilterWarning();
          });
        });

        $scope.startBuild = function() {
          BuildsService
            .startBuild($scope.buildConfig.metadata.name, context)
            .then(function resolve(build) {
              // TODO: common alerts service to eliminate duplication
              $scope.alerts["create"] = {
                type: "success",
                message: "构建 " + build.metadata.name + " 已经开始."
              };
            }, function reject(result) {
              // TODO: common alerts service to eliminate duplication
              $scope.alerts["create"] = {
                type: "error",
                message: "构建起始出现错误.",
                details: $filter('getErrorDetails')(result)
              };
            });
        };

        $scope.showJenkinsfileExamples = function() {
          ModalsService.showJenkinsfileExamples();
        };

        $scope.$on('$destroy', function(){
          DataService.unwatchAll(watches);
        });

    }));
  });
