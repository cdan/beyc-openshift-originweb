'use strict';

angular.module("openshiftConsole")
  .factory("SecurityCheckService", function(APIService, $filter, Constants) {
    var humanizeKind = $filter('humanizeKind');
    var getSecurityAlerts = function(resources, project) {
      var alerts = [];
      var clusterScopedResources = [];
      var roleBindingResources = [];
      var roleResources = [];
      var notWhitelistedResources = [];
      _.each(resources, function(resource) {
        if (!_.get(resource, "kind")) {
          // This isn't a valid API object
          return;
        }
        var rgv = APIService.objectToResourceGroupVersion(resource);
        var apiInfo = APIService.apiInfo(rgv);
        if (!apiInfo.namespaced) {
          clusterScopedResources.push(resource);
        }
        else if (rgv.resource === "rolebindings" && (rgv.group === '' || rgv.group === "rbac.authorization.k8s.io")) {
          // If role in the rolebinding is one of the "safe" ones ignore it (view or image puller), otherwise warn
          var roleRef = _.get(resource, 'roleRef.name');
          if (roleRef !== 'view' && roleRef !== 'system:image-puller') {
            roleBindingResources.push(resource);
          }
        }
        else if (rgv.resource === "roles" && (rgv.group === '' || rgv.group === "rbac.authorization.k8s.io")) {
          roleResources.push(resource);
        }
        else if (!_.find(Constants.SECURITY_CHECK_WHITELIST, {resource: rgv.resource, group: rgv.group})) {
          notWhitelistedResources.push(resource);
        }
      });
      if (clusterScopedResources.length) {
        var clusterStrs = _.uniq(_.map(clusterScopedResources, function(resource) {
          return humanizeKind(resource.kind);
        }));
        alerts.push({
          type: 'warning',
          message:"工程外创建资源，可能影响集群中所有用户.",
          details: "Typically only cluster administrators can create these resources. The cluster-level resources being created are: " + clusterStrs.join(", ")
        });
      }
      if (roleBindingResources.length) {
        var roleBindingStrs = [];
        _.each(roleBindingResources, function(resource){
          _.each(resource.subjects, function(subject) {
            var str = humanizeKind(subject.kind) + " ";
            if (subject.kind === 'ServiceAccount') {
              str += (subject.namespace || project) + "/";
            }
            str += subject.name;
            roleBindingStrs.push(str);
          });
        });
        roleBindingStrs = _.uniq(roleBindingStrs);
        alerts.push({
          type: 'warning',
          message: "给你的功能授予权限.",
          details: "Permissions are being granted to: " + roleBindingStrs.join(", ")
        });
      }
      if (roleResources.length) {
        alerts.push({
          type: 'info',
          message: "和工程创建额外的关系角色.",
          details: "Admins will be able to grant these custom roles to users, groups, and service accounts."
        });
      }
      if (notWhitelistedResources.length) {
        var notWhitelistStrs = _.uniq(_.map(notWhitelistedResources, function(resource) {
          return humanizeKind(resource.kind);
        }));
        alerts.push({
          type: 'warning',
          message: "将会创建资源可能有安全或者功能行为牵连.",
          details: "确保你理解他们之前创建。被创建的资源: " + notWhitelistStrs.join(", ")
        });
      }
      return alerts;
    };

    return {
      // Gets security alerts relevant to a set of resources
      // Returns: Array of alerts
      getSecurityAlerts: getSecurityAlerts
    };
  });
