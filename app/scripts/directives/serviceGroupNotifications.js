'use strict';

angular.module('openshiftConsole')
  .directive('serviceGroupNotifications', function($filter, APIService, DeploymentsService, Navigate) {
    return {
      restrict: 'E',
      // Inherit scope from OverviewController. This directive is only used for the overview.
      // We want to do all of the grouping of resources once in the overview controller watch callbacks.
      scope: true,
      templateUrl: 'views/directives/service-group-notifications.html',
      link: function($scope) {
        var alertHiddenKey = function(alertID) {
          var namespace = _.get($scope, 'service.metadata.namespace');
          return 'hide/alert/' + namespace + '/' + alertID;
        };

        var isAlertHidden = function(alertID) {
          var key = alertHiddenKey(alertID);
          return localStorage.getItem(key) === 'true';
        };

        var hideAlert = function(alertID) {
          var key = alertHiddenKey(alertID);
          localStorage.setItem(key, 'true');
        };

        var annotation = $filter('annotation');
        var deploymentStatus = $filter('deploymentStatus');
        var hasHealthChecks = $filter('hasHealthChecks');
        var alerts = $scope.alerts = {};
        var svcs = [];
        var canI = $filter('canI');
        var addHealthCheckWarnings = function(/* deployment or deployment config */ object) {
          var id = "health_checks_" + object.metadata.uid;
          if (!hasHealthChecks(object.spec.template)) {
            if (isAlertHidden(id)) {
              return;
            }
            alerts[id] = {
              type: "info",
              message: object.metadata.name + " 没有健康检查,确保您的应用程序运行正确吗？.",
              onClose: function() {
                hideAlert(id);
              }
            };
            var resourceGroupVersion = APIService.objectToResourceGroupVersion(object);
            if (canI(resourceGroupVersion, "update")) {
              alerts[id].links = [{
                                    href: Navigate.healthCheckURL(object.metadata.namespace, object.kind, object.metadata.name, resourceGroupVersion.group),
                                    label: "Add Health Checks"
                                  }];
            }
          }
          else {
            delete alerts[id];
          }
        };

        var startDeployment = function(deploymentConfig) {
          DeploymentsService.startLatestDeployment(deploymentConfig, {
            namespace: deploymentConfig.metadata.namespace
          }, $scope);
        };

        var addDeploymentStatusAlerts = function(deploymentConfig) {
          var dcName = _.get(deploymentConfig, 'metadata.name');

          // Show messages about cancelled or failed deployments.
          var mostRecentRC = _.get($scope, ['mostRecentReplicationControllerByDC', dcName]);
          if (!mostRecentRC) {
            return;
          }

          var logLink;
          var status = deploymentStatus(mostRecentRC);
          var version = annotation(mostRecentRC, 'deploymentVersion');
          var displayName = version ? (dcName + ' #' + version) : mostRecentRC.metadata.name;
          var rcLink = Navigate.resourceURL(mostRecentRC);
          switch (status) {
          case 'Cancelled':
            alerts[mostRecentRC.metadata.uid + '-cancelled'] = {
              type: 'info',
              message: '部署 ' + displayName + '已被取消.',
              links: [{
                href: rcLink,
                label: 'View Deployment'
              }, {
                label: 'Start New Deployment',
                onClick: function() {
                  startDeployment(deploymentConfig);
                  // Hide alert.
                  return true;
                }
              }]
            };
            break;
          case 'Failed':
            logLink = URI(rcLink).addSearch({ tab: "logs" }).toString();
            alerts[mostRecentRC.metadata.uid + '-failed'] = {
              type: 'error',
              message: '部署 ' + displayName + ' 失败.',
              reason: annotation(mostRecentRC, 'openshift.io/deployment.status-reason'),
              links: [{
                href: logLink,
                label: 'View Log'
              }, {
                // Show all events since the event might not be on the replication controller itself.
                href: 'project/' + mostRecentRC.metadata.namespace + '/browse/events',
                label: 'View Events'
              }]
            };
            break;
          }
        };

        var setDCNotifications = function() {
          _.each(svcs, function(svc) {
            var svcName = _.get(svc, "metadata.name", '');

            // Add health check warnings for k8s deployments.
            var deployments = _.get($scope, ['deploymentsByService', svcName]);
            _.each(deployments, addHealthCheckWarnings);

            // Add notifications for deployment configs.
            var deploymentConfigs = _.get($scope, ['deploymentConfigsByService', svcName]);
            _.each(deploymentConfigs, function(deploymentConfig) {
              addHealthCheckWarnings(deploymentConfig);
              addDeploymentStatusAlerts(deploymentConfig);
            });
          });
        };

        var getPods = function(object) {
          var uid = _.get(object, 'metadata.uid');
          return _.get($scope, ['podsByOwnerUID', uid], {});
        };

        var addPodWarnings = $filter('groupedPodWarnings');
        var setDeploymentNotifications = function() {
          var groupedPodWarnings = {};
          // clear out pod warning alerts
          _.each(alerts, function(alert, alertId) {
            if (alertId.indexOf("pod_warning") >= 0) {
              delete alert[alertId];
            }
          });

          _.each(svcs, function(svc) {
            // Get notifications for deployments in this service group
            var svcName = _.get(svc, "metadata.name", '');
            var replicationControllers = _.get($scope, ['replicationControllersByService', svcName]);
            _.each(replicationControllers, function(replicationController) {
              var pods = getPods(replicationController);
              addPodWarnings(pods, groupedPodWarnings);
            });

            var replicaSets = _.get($scope, ['replicaSetsByService', svcName]);
            _.each(replicaSets, function(replicaSet) {
              var pods = getPods(replicaSet);
              addPodWarnings(pods, groupedPodWarnings);
            });

            var statefulSets = _.get($scope, ['statefulSetsByService', svcName]);
            _.each(statefulSets, function(statefulSet) {
              var pods = getPods(statefulSet);
              addPodWarnings(pods, groupedPodWarnings);
            });
          });

          _.each(groupedPodWarnings, function(podWarnings, groupID) {
            var warning = _.head(podWarnings);
            if (!warning) {
              return;
            }

            var alertID = "pod_warning" + groupID;
            var alert = {
              type: warning.severity || 'warning',
              message: warning.message
            };

            // Handle certain warnings specially.
            switch (warning.reason) {
            case "NonZeroExit":
              // Add a View Log link for crashing containers.
              var podLink = Navigate.resourceURL(warning.pod, "Pod", $scope.service.metadata.namespace);
              var logLink = URI(podLink).addSearch({ tab: "logs", container: warning.container }).toString();
              alert.links = [{
                href: logLink,
                label: "View Log"
              }];
              break;

            case "NonZeroExitTerminatingPod":
              // Allow users to permanently dismiss the non-zero exit code message for terminating pods.
              if (isAlertHidden(alertID)) {
                return;
              }

              alert.links = [{
                href: "",
                label: "Don't Show Me Again",
                onClick: function() {
                  // Hide the alert on future page loads.
                  hideAlert(alertID);

                  // Return true close the existing alert.
                  return true;
                }
              }];
              break;
            }

            alerts[alertID] = alert;
          });
        };

        $scope.showAlert = function(alert) {
          if (!$scope.collapse) {
            return true;
          }

          // Hide info alerts when collapsed.
          return alert.type !== 'info';
        };

        // TODO worried about how this will perform
        $scope.$watchGroup(['service', 'childServices'], function() {
          svcs = ($scope.childServices || []).concat([$scope.service]);
          setDCNotifications();
          setDeploymentNotifications();
        });
        $scope.$watchGroup(['deploymentConfigsByService', 'deploymentsByService'], setDCNotifications);
        $scope.$watchGroup(['podsByOwnerUid', 'replicationControllersByService', 'replicaSetsByService', 'statefulSetsByService'], setDeploymentNotifications);
      }
    };
  });
