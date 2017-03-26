'use strict';

/**
 * @ngdoc function
 * @name openshiftConsole.controller:RouteController
 * @description
 * Controller of the openshiftConsole
 */
angular.module('openshiftConsole')
  .controller('RouteController',
              function($scope,
                       $filter,
                       $routeParams,
                       AlertMessageService,
                       DataService,
                       ProjectsService,
                       RoutesService) {
    $scope.projectName = $routeParams.project;
    $scope.route = null;
    $scope.alerts = {};
    $scope.renderOptions = $scope.renderOptions || {};
    $scope.renderOptions.hideFilterWidget = true;
    $scope.breadcrumbs = [
      {
        title: "Routes",
        link: "project/" + $routeParams.project + "/browse/routes"
      },
      {
        title: $routeParams.route
      }
    ];

    AlertMessageService.getAlerts().forEach(function(alert) {
      $scope.alerts[alert.name] = alert.data;
    });

    AlertMessageService.clearAlerts();

    var watches = [];

    var isCustomHost;
    var routeResolved = function(route, action) {
      $scope.loaded = true;
      $scope.route = route;
      isCustomHost = RoutesService.isCustomHost(route);
      if (action === "DELETED") {
        $scope.alerts["deleted"] = {
          type: "warning",
          message: "路由已经被删除."
        };
      }
    };

    // Use an alert key that has the route UID, route host, and router
    // hostname. This will handle cases where the route is admitted by
    // multiple routers and we have more than one alert.
    var routerHostnameAlertKey = function(ingress) {
      var uid = _.get($scope, 'route.metadata.uid');
      return 'router-host-' + uid + '-' + ingress.host + '-' + ingress.routerCanonicalHostname;
    };

    // Show the alert for admitted routes that have a custom host if
    // routerCanonicalHostname is set.
    $scope.showRouterHostnameAlert = function(ingress, admittedCondition) {
      if (!isCustomHost) {
        return false;
      }

      if (!ingress || !ingress.host || !ingress.routerCanonicalHostname) {
        return false;
      }

      if (!admittedCondition || admittedCondition.status !== 'True') {
        return false;
      }

      var alertKey = routerHostnameAlertKey(ingress);
      return !AlertMessageService.isAlertPermanentlyHidden(alertKey, $scope.projectName);
    };

    $scope.hideRouterHostnameAlert = function(ingress) {
      var alertKey = routerHostnameAlertKey(ingress);
      AlertMessageService.permanentlyHideAlert(alertKey, $scope.projectName);
    };

    ProjectsService
      .get($routeParams.project)
      .then(_.spread(function(project, context) {
        $scope.project = project;

        DataService
          .get("routes", $routeParams.route, context)
          .then(function(route) {
            routeResolved(route);
            watches.push(DataService.watchObject("routes", $routeParams.route, context, routeResolved));
          }, function(e) {
            $scope.loaded = true;
            $scope.alerts["load"] = {
              type: "error",
              message: "路由详情不能被加载.",
              details: "Reason: " + $filter('getErrorDetails')(e)
            };
          });

        // Watch services to display route warnings.
        watches.push(DataService.watch("services", context, function(services) {
          $scope.services = services.by("metadata.name");
        }));

        $scope.$on('$destroy', function(){
          DataService.unwatchAll(watches);
        });

      }));
  });
