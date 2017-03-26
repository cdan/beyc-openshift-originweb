============= ./404.html =================
9:        text-shadow: none;
14:        text-shadow: none;
23:        -webkit-text-size-adjust: 100%;
24:        -ms-text-size-adjust: 100%;
46:        text-align: center;
============= ./images/logo-origin.svg =================
23:		<g id="text6218">
46:		<g id="text6222">
============= ./index.html =================
32:    <link rel="stylesheet" type="text/css" href="styles/main.css">
34:    <link rel="stylesheet" type="text/css" href="styles/extensions.css">
35:    <style type="text/css">
58:              <h2 class="text-center" id="temporary-loading-message" style="display: none;">Loading...</h2>
============= ./scripts/app.js =================
491:      $('.duration[data-timestamp]').text(function(i, existing) {
============= ./scripts/controllers/addConfigVolume.js =================
95:      .then(_.spread(function(project, context) {
116:        DataService.get(resourceGroupVersion, $routeParams.name, context, { errorNotification: false }).then(
131:        DataService.list("configmaps", context, null, { errorNotification: false }).then(function(configMapData) {
142:        DataService.list("secrets", context, null, { errorNotification: false }).then(function(secretData) {
233:          DataService.update(resourceGroupVersion, resource.metadata.name, $scope.targetObject, context).then(
============= ./scripts/controllers/attachPVC.js =================
74:      .then(_.spread(function(project, context) {
113:          DataService.get(resourceGroupVersion, $routeParams.name, context).then(
130:          DataService.list("persistentvolumeclaims", context).then(function(pvcs) {
178:            DataService.update(resourceGroupVersion, resource.metadata.name, $scope.attach.resource, context).then(
============= ./scripts/controllers/build.js =================
117:      .then(_.spread(function(project, context) {
122:        // context into the log-viewer directive.
123:        $scope.projectContext = context;
126:          .get("builds", $routeParams.build, context)
129:            watches.push(DataService.watchObject("builds", $routeParams.build, context, buildResolved));
130:            watches.push(DataService.watchObject("buildconfigs", $routeParams.buildconfig, context, buildConfigResolved));
139:            .cancelBuild($scope.build, $scope.buildConfigName, context)
184:              .cloneBuild(name, context)
============= ./scripts/controllers/buildConfig.js =================
64:    var requestContext;
76:        .update("buildconfigs", $routeParams.buildconfig, $scope.updatedBuildConfig, requestContext)
162:      .then(_.spread(function(project, context) {
164:        requestContext = context;
166:          .get("buildconfigs", $routeParams.buildconfig, context)
170:            watches.push(DataService.watchObject("buildconfigs", $routeParams.buildconfig, context, buildConfigResolved));
183:      watches.push(DataService.watch("builds", context, function(builds, action, build) {
248:            .startBuild($scope.buildConfig.metadata.name, context)
============= ./scripts/controllers/builds.js =================
33:      .then(_.spread(function(project, context) {
38:        watches.push(DataService.watch("builds", context, function(builds) {
48:        watches.push(DataService.watch("buildconfigs", context, function(buildConfigs) {
============= ./scripts/controllers/configMap.js =================
49:      .then(_.spread(function(project, context) {
51:          .get("configmaps", $routeParams.configMap, context, { errorNotification: false })
54:            watches.push(DataService.watchObject("configmaps", $routeParams.configMap, context, configMapResolved));
============= ./scripts/controllers/configMaps.js =================
58:      .then(_.spread(function(project, context) {
61:        watches.push(DataService.watch('configmaps', context, function(configMapData) {
============= ./scripts/controllers/create.js =================
47:      .then(_.spread(function(project, context) {
49:        $scope.context = context;
69:          DataService.list("imagestreams", context).then(function(resp) {
73:          DataService.list("templates", context).then(function(resp) {
============= ./scripts/controllers/create/browseCategory.js =================
96:      .then(_.spread(function(project, context) {
98:        $scope.context = context;
118:          DataService.list("imagestreams", context).then(function(resp) {
122:          DataService.list("templates", context).then(function(resp) {
============= ./scripts/controllers/create/createFromImage.js =================
80:      .then(_.spread(function(project, context) {
102:            contextDir: $routeParams.contextDir
147:            scope.buildConfig.contextDir = annotations.sampleContextDir || "";
148:            if (annotations.sampleRef || annotations.sampleContextDir) {
168:           DataService.list("configmaps", context, null, { errorNotification: false }).then(function(configMapData) {
179:           DataService.list("secrets", context, null, { errorNotification: false }).then(function(secretData) {
233:        DataService.list("limitranges", context).then(function(resp) {
252:        DataService.list("resourcequotas", context).then(function(resp) {
258:        DataService.list("appliedclusterresourcequotas", context).then(function(clusterQuotaData) {
283:            DataService.batch(generatedResources, context)
393:          var checkQuotaPromise = QuotaService.getLatestQuotaAlerts(generatedResources, context);
============= ./scripts/controllers/create/nextSteps.js =================
49:      .then(_.spread(function(project, context) {
53:        watches.push(DataService.watch("buildconfigs", context, function(buildconfigs) {
============= ./scripts/controllers/createConfigMap.js =================
40:      .then(_.spread(function(project, context) {
63:            DataService.create('configmaps', null, $scope.configMap, context)
============= ./scripts/controllers/createFromURL.js =================
83:    var whiteListedCreateDetailsKeys = ['namespace', 'name', 'imageStream', 'imageTag', 'sourceURI', 'sourceRef', 'contextDir', 'template', 'templateParamsMap'];
============= ./scripts/controllers/createPersistentVolumeClaim.js =================
43:      .then(_.spread(function(project, context) {
57:            DataService.create('persistentvolumeclaims', null, claim, context)
============= ./scripts/controllers/createRoute.js =================
51:      .then(_.spread(function(project, context) {
63:        DataService.list("services", context).then(function(services) {
102:            DataService.create('routes', null, route, context)
============= ./scripts/controllers/createSecret.js =================
51:      .then(_.spread(function(project, context) {
53:        $scope.context = context;
============= ./scripts/controllers/deployment.js =================
102:      .then(_.spread(function(project, context) {
104:        $scope.projectContext = context;
119:        }, $routeParams.deployment, context).then(
131:              }, $routeParams.deployment, $scope.updatedDeployment, context);
162:            }, $routeParams.deployment, context, function(deployment, action) {
186:              ImageStreamResolver.fetchReferencedImageStreamImages([deployment.spec.template], $scope.imagesByDockerReference, imageStreamImageRefByDockerReference, context);
194:            }, context, function(replicaSetData) {
217:        DataService.list("limitranges", context).then(function(response) {
226:        DataService.list("configmaps", context, null, { errorNotification: false }).then(function(configMapData) {
237:        DataService.list("secrets", context, null, { errorNotification: false }).then(function(secretData) {
248:        watches.push(DataService.watch("imagestreams", context, function(imageStreamData) {
253:            ImageStreamResolver.fetchReferencedImageStreamImages([$scope.deployment.spec.template], $scope.imagesByDockerReference, imageStreamImageRefByDockerReference, context);
261:        }, context, function(hpa) {
267:        watches.push(DataService.watch("builds", context, function(builds) {
287:          DeploymentsService.setPaused($scope.deployment, paused, context).then(
337:              .removeVolume($scope.deployment, volume, context)
============= ./scripts/controllers/deploymentConfig.js =================
114:      .then(_.spread(function(project, context) {
116:        $scope.projectContext = context;
128:        DataService.get("deploymentconfigs", $routeParams.deploymentconfig, context).then(
141:                                                  context);
169:            watches.push(DataService.watchObject("deploymentconfigs", $routeParams.deploymentconfig, context, function(deploymentConfig, action) {
190:              ImageStreamResolver.fetchReferencedImageStreamImages([deploymentConfig.spec.template], $scope.imagesByDockerReference, imageStreamImageRefByDockerReference, context);
204:        watches.push(DataService.watch("replicationcontrollers", context, function(deployments, action, deployment) {
261:        DataService.list("limitranges", context).then(function(resp) {
266:        DataService.list("configmaps", context, null, { errorNotification: false }).then(function(configMapData) {
277:        DataService.list("secrets", context, null, { errorNotification: false }).then(function(secretData) {
288:        watches.push(DataService.watch("imagestreams", context, function(imageStreamData) {
293:            ImageStreamResolver.fetchReferencedImageStreamImages([$scope.deploymentConfig.spec.template], $scope.imagesByDockerReference, imageStreamImageRefByDockerReference, context);
298:        watches.push(DataService.watch("builds", context, function(builds) {
306:        }, context, function(hpa) {
355:            DeploymentsService.startLatestDeployment($scope.deploymentConfig, context, $scope);
373:          DeploymentsService.setPaused($scope.deploymentConfig, paused, context).then(
430:              .removeVolume($scope.deploymentConfig, volume, context)
============= ./scripts/controllers/deployments.js =================
63:      .then(_.spread(function(project, context) {
66:        watches.push(DataService.watch("replicationcontrollers", context, function(replicationControllers, action, replicationController) {
117:        }, context, function(replicaSetsData) {
123:        watches.push(DataService.watch("deploymentconfigs", context, function(deploymentConfigs) {
141:        }, context, function(deploymentData) {
============= ./scripts/controllers/edit/autoscaler.js =================
79:      .then(_.spread(function(project, context) {
116:          }, null, hpa, context)
140:          }, hpa.metadata.name, hpa, context)
155:        DataService.get(resourceGroup, $routeParams.name, context).then(function(resource) {
209:            DataService.list("limitranges", context).then(function(resp) {
============= ./scripts/controllers/edit/buildConfig.js =================
103:      "contextDir": false,
218:      .then(_.spread(function(project, context) {
220:        $scope.context = context;
230:        DataService.get("buildconfigs", $routeParams.buildconfig, context).then(
247:            DataService.list("secrets", context).then(function(secrets) {
313:            watches.push(DataService.watchObject("buildconfigs", $routeParams.buildconfig, context, function(buildConfig, action) {
564:      DataService.update("buildconfigs", $scope.updatedBuildConfig.metadata.name, $scope.updatedBuildConfig, $scope.context).then(
============= ./scripts/controllers/edit/configMap.js =================
39:      .then(_.spread(function(project, context) {
41:          .get("configmaps", $routeParams.configMap, context)
52:            watches.push(DataService.watchObject("configmaps", $routeParams.configMap, context, function(newValue, action) {
69:            DataService.update('configmaps', $scope.configMap.metadata.name, $scope.configMap, context)
============= ./scripts/controllers/edit/deploymentConfig.js =================
85:      .then(_.spread(function(project, context) {
87:        $scope.context = context;
95:        DataService.get("deploymentconfigs", $routeParams.deploymentconfig, context).then(
159:            DataService.list("configmaps", context, null, { errorNotification: false }).then(function(configMapData) {
171:            DataService.list("secrets", context, null, { errorNotification: false }).then(function(secretData) {
190:            watches.push(DataService.watchObject("deploymentconfigs", $routeParams.deploymentconfig, context, function(deploymentConfig, action) {
352:      DataService.update("deploymentconfigs", $scope.updatedDeploymentConfig.metadata.name, $scope.updatedDeploymentConfig, $scope.context).then(
============= ./scripts/controllers/edit/healthChecks.js =================
70:      .then(_.spread(function(project, context) {
82:        DataService.get(resourceGroupVersion, $scope.name, context).then(
113:                                 context).then(
============= ./scripts/controllers/edit/route.js =================
46:      .then(_.spread(function(project, context) {
59:        DataService.get("routes", $scope.routeName, context).then(
77:            DataService.list("services", context).then(function(resp) {
163:            DataService.update('routes', $scope.routeName, updated, context)
============= ./scripts/controllers/edit/yaml.js =================
69:      .then(_.spread(function(project, context) {
81:        DataService.get(resourceGroupVersion, $scope.name, context).then(
187:            watches.push(DataService.watchObject(resourceGroupVersion, $scope.name, context, function(newValue, action) {
============= ./scripts/controllers/events.js =================
29:      .then(_.spread(function(project, context) {
31:        $scope.projectContext = context;
============= ./scripts/controllers/image.js =================
42:    var fetchImageStreamTag = _.debounce(function(tagData, context) {
44:      DataService.get("imagestreamtags", name, context).then(
63:    function populateWithImageStream(imageStream, context) {
80:      fetchImageStreamTag(tagData, context);
83:    var imageStreamResolved = function(imageStream, context, action) {
84:      populateWithImageStream(imageStream, context);
95:      .then(_.spread(function(project, context) {
98:          .get("imagestreams", $routeParams.imagestream, context)
100:            imageStreamResolved(imageStream, context);
101:            watches.push(DataService.watchObject("imagestreams", $routeParams.imagestream, context, function(imageStream, action) {
102:              imageStreamResolved(imageStream, context, action);
============= ./scripts/controllers/images.js =================
31:      .then(_.spread(function(project, context) {
33:        watches.push(DataService.watch("imagestreams", context, function(imageStreams) {
============= ./scripts/controllers/imagestream.js =================
33:      .then(_.spread(function(project, context) {
35:        DataService.get("imagestreams", $routeParams.imagestream, context).then(
43:            watches.push(DataService.watchObject("imagestreams", $routeParams.imagestream, context, function(imageStream, action) {
============= ./scripts/controllers/membership.js =================
21:      var requestContext;
93:          .list('rolebindings', requestContext, null , {
116:          .create(role, newSubject, projectName, requestContext)
135:          .addSubject(rb, newSubject, projectName, requestContext)
264:        .then(_.spread(function(project, context) {
265:          requestContext = context;
267:          refreshServiceAccountsList(requestContext);
292:                  .removeSubject(subjectName, roleName, $scope.roleBindings, requestContext)
356:            .listAllRoles(requestContext, {
============= ./scripts/controllers/modals/confirmModal.js =================
17:    // content: modalConfig.details (plain text ONLY, no user imput)
============= ./scripts/controllers/monitoring.js =================
91:      text: ''
289:      .then(_.spread(function(project, context) {
291:        $scope.projectContext = context;
293:        DataService.watch("pods", context, function(pods) {
307:        }, context, function(statefulSets) {
316:        DataService.watch("replicationcontrollers", context, function(replicationControllers) {
325:        DataService.watch("builds", context, function(builds) {
334:        DataService.watch({ group: "extensions", resource: "replicasets" }, context, function(replicaSets) {
363:        $scope.$watch('filters.text', _.debounce(function() {
364:          $scope.filterKeywords = filterKeywords = KeywordService.generateKeywords($scope.filters.text);
============= ./scripts/controllers/newOverview.js =================
1031:  }, _.debounce(function(text, previous) {
1032:    if (text === previous) {
1035:    state.filterKeywords = KeywordService.generateKeywords(text);
1065:  ProjectsService.get($routeParams.project).then(_.spread(function(project, context) {
1068:    state.context = context;
1078:                                                           context);
1081:    watches.push(DataService.watch("pods", context, function(podsData) {
1093:    watches.push(DataService.watch("replicationcontrollers", context, function(rcData) {
1105:    watches.push(DataService.watch("deploymentconfigs", context, function(dcData) {
1124:    }, context, function(replicaSetData) {
1139:    }, context, function(deploymentData) {
1149:    watches.push(DataService.watch("builds", context, function(buildData) {
1158:    }, context, function(statefulSetData) {
1169:    watches.push(DataService.watch("services", context, function(serviceData) {
1175:    watches.push(DataService.watch("routes", context, function(routesData) {
1181:    watches.push(DataService.watch("buildConfigs", context, function(buildConfigData) {
1193:    }, context, function(hpaData) {
1199:    watches.push(DataService.watch("imagestreams", context, function(imageStreamData) {
1208:    watches.push(DataService.watch('resourcequotas', context, function(quotaData) {
1213:    watches.push(DataService.watch('appliedclusterresourcequotas', context, function(clusterQuotaData) {
1220:    DataService.list("limitranges", context, function(response) {
============= ./scripts/controllers/newfromtemplate.js =================
97:      .then(_.spread(function(project, context) {
252:            DataService.batch(processedResources, context).then(
334:          DataService.create("processedtemplates", null, $scope.template, context).then(
340:              QuotaService.getLatestQuotaAlerts(processedResources, context).then(showWarningsOrCreate);
============= ./scripts/controllers/otherResources.js =================
82:      .then(_.spread(function(project, context) {
96:        $scope.context = context;
132:        }, $scope.context).then(function(resources) {
============= ./scripts/controllers/overview.js =================
605:      .then(_.spread(function(project, context) {
607:        $scope.projectContext = context;
609:        watches.push(DataService.watch("pods", context, function(podsData) {
616:        watches.push(DataService.watch("services", context, function(serviceData) {
630:        watches.push(DataService.watch("builds", context, function(buildData) {
637:        watches.push(DataService.watch("buildConfigs", context, function(buildConfigData) {
643:        watches.push(DataService.watch("routes", context, function(routesData) {
652:        watches.push(DataService.watch("replicationcontrollers", context, function(rcData) {
663:        watches.push(DataService.watch("deploymentconfigs", context, function(dcData) {
674:        }, context, function(replicaSetData) {
686:        }, context, function(statefulSetData) {
697:        }, context, function(deploymentData) {
708:        }, context, function(hpaData) {
714:        watches.push(DataService.watch('resourcequotas', context, function(quotaData) {
719:        watches.push(DataService.watch('appliedclusterresourcequotas', context, function(clusterQuotaData) {
726:        DataService.list("limitranges", context, function(response) {
============= ./scripts/controllers/persistentVolumeClaim.js =================
42:    .then(_.spread(function(project, context) {
45:        .get("persistentvolumeclaims", $routeParams.pvc, context)
48:          watches.push(DataService.watchObject("persistentvolumeclaims", $routeParams.pvc, context, pvcResolved));
============= ./scripts/controllers/pipelines.js =================
35:      .then(_.spread(function(project, context) {
105:        watches.push(DataService.watch("builds", context, function(buildsData) {
112:        watches.push(DataService.watch("buildconfigs", context, function(buildConfigData) {
131:            .startBuild(buildConfigName, context)
============= ./scripts/controllers/pod.js =================
55:    var requestContext = null;
105:      .text(_.repeat('x', 10))
256:      .then(_.spread(function(project, context) {
257:        requestContext = context;
261:        // context into the log-viewer directive.
262:        $scope.projectContext = context;
264:          .get("pods", $routeParams.pod, context)
271:            ImageStreamResolver.fetchReferencedImageStreamImages(pods, $scope.imagesByDockerReference, $scope.imageStreamImageRefByDockerReference, requestContext);
272:            watches.push(DataService.watchObject("pods", $routeParams.pod, context, function(pod, action) {
291:        watches.push(DataService.watch("imagestreams", context, function(imageStreams) {
294:          ImageStreamResolver.fetchReferencedImageStreamImages($scope.pods, $scope.imagesByDockerReference, $scope.imageStreamImageRefByDockerReference, context);
298:        watches.push(DataService.watch("builds", context, function(builds) {
317:            DataService.delete("pods", debugPod.metadata.name, context, {
360:          DataService.create("pods", null, debugPod, context).then(
375:                                                      context,
============= ./scripts/controllers/pods.js =================
33:      .then(_.spread(function(project, context) {
35:        watches.push(DataService.watch("pods", context, function(pods) {
============= ./scripts/controllers/projects.js =================
31:      text: ''
118:    $scope.$watch('search.text', _.debounce(function(searchText) {
============= ./scripts/controllers/quota.js =================
101:      .then(_.spread(function(project, context) {
104:        DataService.list("resourcequotas", context).then(function(resp) {
110:        DataService.list("appliedclusterresourcequotas", context).then(function(resp) {
123:        DataService.list("limitranges", context).then(function(resp) {
============= ./scripts/controllers/replicaSet.js =================
132:                                          $scope.projectContext);
174:      .then(_.spread(function(project, context) {
178:        // context into the log-viewer directive.
179:        $scope.projectContext = context;
182:        DataService.list("configmaps", context, null, { errorNotification: false }).then(function(resp) {
193:        DataService.list("secrets", context, null, { errorNotification: false }).then(function(resp) {
222:          watches.push(DataService.watch($scope.resource, context, function(deployments) {
272:          DataService.get("deploymentconfigs", dcName, context, {
309:          }, context).then(function(resp) {
329:            }, $scope.deployment.metadata.name, context, function(deployment, action) {
362:            }, context, function(replicaSets) {
406:                                                               context);
409:        DataService.get($scope.resource, $routeParams.replicaSet, context)
427:            watches.push(DataService.watchObject($scope.resource, $routeParams.replicaSet, context, function(replicaSet, action) {
462:            watches.push(DataService.watch("pods", context, function(podData) {
481:        watches.push(DataService.watch($scope.resource, context, function(replicaSets, action, replicaSet) {
522:        watches.push(DataService.watch("imagestreams", context, function(imageStreamData) {
529:        watches.push(DataService.watch("builds", context, function(builds) {
537:        }, context, function(data) {
545:        DataService.list("limitranges", context).then(function(resp) {
560:          DeploymentsService.retryFailedDeployment(replicaSet, context, $scope);
564:          DeploymentsService.rollbackToDeployment(replicaSet, changeScaleSettings, changeStrategy, changeTriggers, context, $scope);
568:          DeploymentsService.cancelRunningDeployment(replicaSet, context, $scope);
636:              .removeVolume($scope.replicaSet, volume, context)
============= ./scripts/controllers/route.js =================
88:      .then(_.spread(function(project, context) {
92:          .get("routes", $routeParams.route, context)
95:            watches.push(DataService.watchObject("routes", $routeParams.route, context, routeResolved));
106:        watches.push(DataService.watch("services", context, function(services) {
============= ./scripts/controllers/routes.js =================
29:      .then(_.spread(function(project, context) {
31:        watches.push(DataService.watch("routes", context, function(routes) {
41:        watches.push(DataService.watch("services", context, function(services) {
============= ./scripts/controllers/secret.js =================
38:      .then(_.spread(function(project, context) {
40:        $scope.context = context;
42:        DataService.get("secrets", $scope.secretName, context, { errorNotification: false }).then(
============= ./scripts/controllers/secrets.js =================
24:      .then(_.spread(function(project, context) {
26:        $scope.context = context;
28:        DataService.list("secrets", context).then(function(secrets) {
============= ./scripts/controllers/service.js =================
95:      .then(_.spread(function(project, context) {
97:        $scope.projectContext = context;
99:          .get("services", $routeParams.service, context)
102:            watches.push(DataService.watchObject("services", $routeParams.service, context, serviceResolved));
113:        watches.push(DataService.watch("services", context, function(services) {
117:        watches.push(DataService.watch("pods", context, function(pods) {
122:        watches.push(DataService.watch("endpoints", context, function(endpoints) {
138:        watches.push(DataService.watch("routes", context, function(routes) {
============= ./scripts/controllers/services.js =================
32:      .then(_.spread(function(project, context) {
34:         watches.push(DataService.watch("services", context, function(services) {
============= ./scripts/controllers/setLimits.js =================
75:      .then(_.spread(function(project, context) {
90:        DataService.get(resourceGroupVersion, $scope.name, context).then(
103:              DataService.update(resourceGroupVersion, $scope.name, object, context).then(
132:        DataService.list("limitranges", context).then(function(resp) {
============= ./scripts/controllers/statefulSet.js =================
38:    var projectContext;
59:      .then(_.spread(function(project, context) {
60:        projectContext = context;
63:          .get(resourceGroupVersion, $scope.statefulSetName, context)
69:              projectContext: context,
78:            watches.push(DataService.watchObject(resourceGroupVersion, $scope.statefulSetName, context, function(statefulSet) {
92:            watches.push(DataService.watch('pods', context, function(podData) {
============= ./scripts/controllers/statefulSets.js =================
18:      .then(_.spread(function(project, context) {
25:        }, context, function(statefulSets) {
38:        watches.push(DataService.watch('pods', context, function(podData) {
============= ./scripts/controllers/storage.js =================
29:      .then(_.spread(function(project, context) {
31:         watches.push(DataService.watch("persistentvolumeclaims", context, function(pvcs) {
============= ./scripts/controllers/topology.js =================
115:      .then(_.spread(function(project, context) {
118:        watches.push(DataService.watch("pods", context, function(pods) {
123:          ImageStreamResolver.fetchReferencedImageStreamImages($scope.pods, $scope.imagesByDockerReference, $scope.imageStreamImageRefByDockerReference, context);
128:        watches.push(DataService.watch("services", context, function(services) {
160:        watches.push(DataService.watch("routes", context, function(routes) {
229:        }, context, function(horizontalPodAutoscalers) {
441:        watches.push(DataService.watch("replicationcontrollers", context, function(deployments, action, deployment) {
467:        watches.push(DataService.watch("imagestreams", context, function(imageStreams) {
470:          ImageStreamResolver.fetchReferencedImageStreamImages($scope.pods, $scope.imagesByDockerReference, $scope.imageStreamImageRefByDockerReference, context);
476:        watches.push(DataService.watch("deploymentconfigs", context, function(deploymentConfigs) {
506:        watches.push(DataService.watch("builds", context, function(builds) {
518:        DataService.list("limitranges", context, function(response) {
============= ./scripts/directives/alerts.js =================
16:        //   label:    the link text
============= ./scripts/directives/buildTrendsChart.js =================
61:                text: 'Build Number',
75:                text: 'Duration',
123:                text: "No Completed Builds"
============= ./scripts/directives/deployImage.js =================
21:        context: '=',
54:        var context = {namespace: $scope.project};
57:        DataService.list("configmaps", context, null, { errorNotification: false }).then(function(configMapData) {
68:        DataService.list("secrets", context, null, { errorNotification: false }).then(function(secretData) {
129:          ImagesService.findImage($scope.imageName, $scope.context)
222:              DataService.batch(generatedResources, $scope.context).then(function(result) {
299:            var checkQuotaPromise = QuotaService.getLatestQuotaAlerts(generatedResources, $scope.context);
============= ./scripts/directives/events.js =================
10:        projectContext: "="
15:          text: ''
53:          $scope.filterExpressions = filterExpressions = KeywordService.generateKeywords(_.get($scope, 'filter.text'));
70:        $scope.$watch('filter.text', _.debounce(function() {
131:        watches.push(DataService.watch("events", $scope.projectContext, function(events) {
============= ./scripts/directives/eventsBadge.js =================
8:        projectContext: "=",
15:        watches.push(DataService.watch("events", $scope.projectContext, function(eventData) {
============= ./scripts/directives/eventsSidebar.js =================
8:        projectContext: "=",
14:        watches.push(DataService.watch("events", $scope.projectContext, function(eventData) {
============= ./scripts/directives/fromFile.js =================
174:              QuotaService.getLatestQuotaAlerts($scope.createResources, $scope.context).then(showWarningsOrCreate);
241:            QuotaService.getLatestQuotaAlerts($scope.createResources, $scope.context).then(showWarningsOrCreate);
293:          return DataService.get(resourceGroupVersion, item.metadata.name, $scope.context, {errorNotification: false}).then(
375:            DataService.batch($scope.createResources, $scope.context, "create").then(
426:            DataService.batch($scope.updateResources, $scope.context, "update").then(
============= ./scripts/directives/keyValueEditor.js =================
34:            //   keyValidatorError: ''                 // text if key does not validate
35:            //   keyValidatorErrorTooltip: ''          // additional text if key does not validate
37:            //   valueValidatorError: ''               // text if value does not validate
39:            //   valueIconTooltip: ''                  // text for tooltip
40:            //   valueAlt: ''                          // alternative text value if valueFrom is present or complicated
42:            //   valueValidatorErrorTooltip: ''        // additional text if value does not validate
71:            addRowLink: '@',                          // creates a link to "add row" and sets its text label
72:            addRowWithSelectorsLink: '@',             // creates a link to "add row with selectors" and sets its text label
73:            showHeader: '=?',                         // show placeholder text as headers
299:                // check valueFrom attribs and set an alt text for display if present
============= ./scripts/directives/labels.js =================
62:        // Optional help text to show with the label controls
============= ./scripts/directives/logViewer.js =================
39:          '<td class="log-line-text"></td>' +
41:      var buildLogLineNode = function(lineNumber, text) {
50:        var escaped = ansi_up.escape_for_html(text);
68:          context: '=',
352:                  streamer = DataService.createStream(logSubresource, name, $scope.context, options);
355:                  var addLine = function(text) {
358:                    buffer.appendChild(buildLogLineNode(lastLineNumber, text));
441:                var projectName = _.get($scope.context, 'project.metadata.name');
459:                $scope.$watchGroup(['context.project.metadata.name', 'options.container', 'name'], function() {
464:                                        namespace: $scope.context.project.metadata.name,
465:                                        namespaceUid: $scope.context.project.metadata.uid,
557:            var text = $($elem).find('.log-line-text').text();
559:            var blob = new Blob([text], { type: "text/plain;charset=utf-8" });
============= ./scripts/directives/miniLog.js =================
16:    context: '<'
81:    streamer = DataService.createStream(logSubresource, name, miniLog.context, options);
============= ./scripts/directives/nav.js =================
105:                      .text($filter("uniqueDisplayName")(item, sortedProjects));
============= ./scripts/directives/oscAutoscaling.js =================
44:          // text. Don't convert this value since the field will prompt for
============= ./scripts/directives/oscGitLink.js =================
10:      contextDir: "="
16:      $scope.$watchGroup(['uri', 'ref', 'contextDir'], function() {
17:        $scope.gitLink = githubLink($scope.uri, $scope.ref, $scope.contextDir);
============= ./scripts/directives/oscKeyValues.js =================
135:        // checks if the key,value inputs have any text value.
============= ./scripts/directives/oscRouting.js =================
285:        // (optional). Changes the labels and help text.
============= ./scripts/directives/overview/builds.js =================
12:    context: '<',
============= ./scripts/directives/overview/dc.js =================
132:            DeploymentsService.cancelRunningDeployment(replicationController, $scope.projectContext, $scope);
============= ./scripts/directives/podDonut.js =================
151:          // Add to scope for sr-only text.
============= ./scripts/directives/quotaUsageChart.js =================
83:            //     <td class="value" style="text-align: left;">34% of 1 GiB</td>
102:                .text(d[0].name)
114:              $('<td class="value" style="text-align: left;"></td>')
115:                .text(value)
============= ./scripts/directives/resources.js =================
169:        // Alternative header text to display in the 'Name' column.
195:        // Alternative header text to display in the 'Name' column.
============= ./scripts/directives/truncate.js =================
4:  // Truncates text to a length, adding a tooltip and an ellipsis if truncated.
5:  // Different than `text-overflow: ellipsis` because it allows for multiline text.
18:      templateUrl: 'views/directives/truncate-long-text.html',
============= ./scripts/filters/resources.js =================
11:    return function(projects, text) {
12:      if (!text) {
17:      text = text.toLowerCase();
19:        if (_.includes(project.metadata.name, text)) {
24:        if (displayName && _.includes(displayName.toLowerCase(), text)) {
800:      // Link to the Jenkins console that follows the log instead of the raw log text.
852:          contextDir = _.get(buildConfig, 'spec.source.contextDir');
853:      if (contextDir) {
854:        jenkinsfilePath = URI.joinPaths(contextDir, jenkinsfilePath).path();
============= ./scripts/filters/util.js =================
230:    return function(link, ref, contextDir) {
235:        if (contextDir && contextDir.charAt(0) === "/") {
236:          contextDir = contextDir.substring(1);
240:        if (contextDir) {
242:          contextDir = encodeURIComponent(contextDir);
244:          contextDir = contextDir.replace("%2F", "/");
245:          link += "/tree/" + (encodeURIComponent(ref || "master")) + "/" + contextDir;
575:  // Usage: <span ng-bind-html="text | linkify : '_blank'"></span>
583:    return function(text, target, alreadyEscaped) {
584:      return HTMLService.linkify(text, target, alreadyEscaped);
============= ./scripts/services/applicationGenerator.js =================
369:      // Add contextDir only if specified.
370:      if (input.buildConfig.contextDir) {
371:        bc.spec.source.contextDir = input.buildConfig.contextDir;
============= ./scripts/services/builds.js =================
11:    var startBuild = function(buildConfigName, context) {
19:      return DataService.create("buildconfigs/instantiate", buildConfigName, req, context);
22:    var cancelBuild = function(build, buildConfigName, context) {
25:      return DataService.update("builds", canceledBuild.metadata.name, canceledBuild, context);
28:    var cloneBuild = function(buildName, context) {
36:      return DataService.create("builds/clone", buildName, req, context);
============= ./scripts/services/charts.js =================
7:        var donutChartTitle = d3.select(element).select('text.c3-chart-arcs-title');
17:          .text(titleBig)
25:            .text(titleSmall)
============= ./scripts/services/deployments.js =================
8:    DeploymentsService.prototype.startLatestDeployment = function(deploymentConfig, context, $scope) {
23:      DataService.update("deploymentconfigs", deploymentConfig.metadata.name, req, context).then(
44:    DeploymentsService.prototype.retryFailedDeployment = function(deployment, context, $scope) {
51:      DataService.list("pods", context, function(list) {
84:      DataService.update("replicationcontrollers", deploymentName, req, context).then(
105:    DeploymentsService.prototype.rollbackToDeployment = function(deployment, changeScaleSettings, changeStrategy, changeTriggers, context, $scope) {
126:      DataService.create("deploymentconfigrollbacks", null, req, context).then(
129:          DataService.update("deploymentconfigs", deploymentConfigName, newDeploymentConfig, context).then(
161:    DeploymentsService.prototype.cancelRunningDeployment = function(deployment, context, $scope) {
175:      DataService.update("replicationcontrollers", deploymentName, req, context).then(
479:    DeploymentsService.prototype.setPaused = function(/* deployment or deployment config */ object, paused, context) {
483:      return DataService.update(resourceGroupVersion, object.metadata.name, request, context);
============= ./scripts/services/environment.js =================
13:      // text for any value from entries.
============= ./scripts/services/html.js =================
29:      // text:            The text to linkify. Assumes `text` is NOT HTML-escaped unless
32:      // alreadyEscaped:  `true` if the text has already been HTML escaped
36:      linkify: function(text, target, alreadyEscaped) {
37:        if (!text) {
38:          return text;
43:          text = _.escape(text);
47:        return text.replace(/https?:\/\/[A-Za-z0-9._%+-]+\S*[^\s.;,(){}<>"\u201d\u2019]/gm, function(str) {
============= ./scripts/services/imageStreamResolver.js =================
11:  // context - the context to be passed to any server requests, in general this is the $scope of the calling controller
13:  ImageStreamResolver.prototype.fetchReferencedImageStreamImages = function(pods, imagesByDockerReference, imageStreamImageRefByDockerReference, context) {
35:        var imageStreamImagePromise = DataService.get("imagestreamimages", imageStreamImageRef, context);
40:            image.imageStreamNamespace = context.project.metadata.name;
============= ./scripts/services/images.js =================
16:    var findImage = function(name, projectContext) {
22:          namespace: projectContext.namespace
39:                                projectContext).then(function(response) {
============= ./scripts/services/keyValueEditorUtils.js =================
170:              // if setting value, this will set the cursor at the end of the text in the value
============= ./scripts/services/membership/roleBindings.js =================
63:    var create = function(role, subject, namespace, context) {
67:      return DataService.create('rolebindings', null, binding, context);
70:    var addSubject = function(rb, subject, namespace, context) {
86:      return DataService.update('rolebindings', binding.metadata.name, binding, context);
90:    var removeSubject = function(subjectName, role, roleBindings, context) {
99:                  DataService.update('rolebindings', binding.metadata.name, binding, context) :
100:                  DataService.delete('rolebindings', binding.metadata.name, context)
110:    var list = function(context, fn, opts) {
112:              .list('rolebindings', context, function(resp) {
============= ./scripts/services/membership/roles.js =================
7:    var listAllRoles = function(context) {
10:          .list('roles', context, null),
============= ./scripts/services/quota.js =================
229:    var getLatestQuotaAlerts = function(resources, context) {
233:      promises.push(DataService.list("resourcequotas", context).then(function(quotaData) {
238:      promises.push(DataService.list("appliedclusterresourcequotas", context).then(function(clusterQuotaData) {
============= ./scripts/services/storage.js =================
55:      removeVolume: function(object, volume, context) {
67:        return DataService.update(resource, copy.metadata.name, copy, context);
============= ./styles/_buttons.less =================
13:      text-align: right;
41:    text-decoration: none;
============= ./styles/_cards.less =================
19:  text-transform: uppercase;
63:    text-overflow: ellipsis;
============= ./styles/_components.less =================
61:      text-transform: uppercase;
66:        text-transform: none;
99:            text-align: right;
112:          text-transform: none;
165:    text-transform: uppercase;
196:  // avoid due to use of `ng-repeat` and `truncate-long-text`.
255:      text-align: left;
296:    // prevent text wrap
307:    // hide tooltip text 'Empty'
312:.donut-mini-text {
326:        text-decoration: none;
339:    .text-muted;
340:    .text-center;
342:    // Show text closer to the pod donut. (It has no bottom margin, but the donut chart does not
390://    text-align: center;
441://    .pod-text {
458:        text-transform: lowercase;
============= ./styles/_container-terminal.less =================
28:      text-decoration: none;
============= ./styles/_core.less =================
13:  input[type="text"],
19:  textarea,
20:  textarea.form-control,
122:  // Make sure icons are the same size so text aligns.
125:    text-align: center;
166:// Mark is used for highlighting terms like search terms. See http://getbootstrap.com/css/#type-inline-text
177:  .text-center;
181:      .text-center;
198:  // Indent icon width to align with text above.
264:    .avg-duration-text {
320:  // Avoid overlapping tick text at mobile.
374:      .text-muted();
381:    .text-muted();
391:    .text-center();
410:    .text-muted();
459:  text-align: center;
501:  .text-muted();
533:    text-align: center;
568:          text-align: left;
603:        input, textarea {
664:  textarea {
690:        text-align: right;
695:      // Align text fields with read-only values.
826:// Fix to override the Firefox 40+ behavior to add text-decoration
829:  text-decoration: none;
835:      text-align: left;
872:  .text-overflow();
907:    text-align: center;
948:    text-decoration: none;
959:    text-decoration: none;
1056:      .text-center();
1151:  // this ensures when the icons change, the text that follows doesn't shift
1153:    text-align: center;
============= ./styles/_data-toolbar.less =================
24:      text-align: right;
62:    text-align: right;
============= ./styles/_ellipsis.less =================
4://            supports prepended [text]...
20:  text-align: center;
============= ./styles/_forms.less =================
8:  color: @text-color;
77:.osc-file-input textarea {
79:  // Use the same spacing as `help-block` so the textarea is evenly spaced under the help text.
99:// Add vendor prefixes for placeholder text, since they where removed from PatternFly
============= ./styles/_kve.less =================
31:    color: #333; // boostrap's @text-color
35:      text-decoration: none;
88:    text-align: center;
============= ./styles/_list-view.less =================
20:    text-align: left;
47:.list-group-item-text, .list-view-pf-additional-info {
84:      text-overflow: ellipsis;
85:      .text-muted();
88:  .list-group-item-text {
95:  text-align: left;
120:    .list-group-item-text {;
============= ./styles/_log.less =================
10:    .text-muted();
35:    .text-muted();
102:      text-decoration: none;
223:  text-align: right;
248:  text-align: right;
254:.log-line-text {
282:  .text-center();
============= ./styles/_messages.less =================
29:        text-decoration: underline;
133:    text-transform: none;
144:  text-decoration: none;
============= ./styles/_mixins.less =================
71:// - DO NOT use in any other case such as paragraph text, descriptions, titles, project names, etc.
107:// Nav icon text positioning
132:    .text-overflow();
============= ./styles/_navbar-alt.less =================
42:    text-decoration: none;
54:      text-decoration: none;
119:      text-decoration: none;
222:    text-decoration: none;
============= ./styles/_openshift-icon.less =================
19:  text-transform: none;
38:  text-transform: none;
314:    text-shadow: none;
328:    text-align: center;
============= ./styles/_openshift-logos-icon.less =================
18:  text-transform: none;
============= ./styles/_overview.less =================
37:    .text-muted();
100:    .text-muted();
101:    text-transform: uppercase;
105:      text-transform: none;
150:    text-align: center;
151:    .text-muted();
218:      .text-center();
230:      .text-center();
298:    .text-center();
302:    .text-center();
390:    .text-muted();
649:      text-transform: uppercase;
673:        .text-right();
752:    .text-muted();
755:    text-transform: uppercase;
762:    .text-muted();
784:      .text-muted();
788:      .text-muted();
830:        .text-center();
854:      text-align: center;
868:      text-align: center;
869:      & .text-danger {
874:      .text-muted();
964:    .text-muted();
994:    .text-center();
999:    .text-center();
1000:    .text-muted();
============= ./styles/_pipeline.less =================
145:      text-align: center;
180:  text-align: center;
189:  .text-muted();
233:  .text-center();
250:  .text-muted();
535:    text-align: left;
============= ./styles/_project-menu.less =================
106:            span.text {
============= ./styles/_projects.less =================
35:.project-description.list-group-item-text {
76:      text-overflow: ellipsis;
============= ./styles/_select.less =================
29:      .text-muted {
42:  .ui-select-match-text, .ui-select-placeholder {
46:  .ui-select-match-text span {
48:    text-overflow: ellipsis;
56:    text-overflow: ellipsis;
============= ./styles/_sidebar.less =================
226:            text-align: center;
261:    text-align: left;
287:          text-align: left;
298:            text-align: right;
314:    text-decoration: none;
327:      text-decoration: none;
390:          .text-muted();
403:            .text-right();
420:    text-decoration: none;
422:      text-decoration: underline;
426:    color: @text-color;
429:    color: @text-muted;
============= ./styles/_substructure.less =================
125:              text-align: left;
============= ./styles/_tile.less =================
35:        text-decoration: none;
89:    text-align: center;
============= ./styles/_topology.less =================
19:  g.DeploymentConfig text {
25:  g.Route text {
============= ./styles/_typography.less =================
89:    text-decoration: none;
111:/* Device specific text alignment classes.
114:     <div class="text-xs-left text-right">
115:     would align text to left on mobile, else align right on other devices.
119:  .text-xs-left {
120:    text-align: left;
122:  .text-xs-right {
123:    text-align: right;
128:  .text-sm-left {
129:    text-align: left;
131:  .text-sm-right {
132:    text-align: right;
137:  .text-md-left {
138:    text-align: left;
140:  .text-md-right {
141:    text-align: right;
146:  .text-lg-left {
147:    text-align: left;
149:  .text-lg-right {
150:    text-align: right;
============= ./styles/_variables.less =================
42:@console-text-color-default: @gray-dark;
============= ./styles/fonts/openshift-logos-icon/demo.css =================
19:  text-decoration: none;
61:  text-align: right;
64:  text-align: center;
134:.textbox0 {
============= ./styles/fonts/openshift-logos-icon/demo.html =================
9:    <link rel="stylesheet" type="text/css" href="../../../../dist/styles/main.css">
25:                  <input type="text" readonly value="f157" class="unit size1of2" />
26:                  <input type="text" maxlength="1" readonly value="&#xf157;" class="unitRight size1of2 talign-right" />
30:                  <input type="text" readonly value="" class="liga unitRight" />
41:                  <input type="text" readonly value="f156" class="unit size1of2" />
42:                  <input type="text" maxlength="1" readonly value="&#xf156;" class="unitRight size1of2 talign-right" />
46:                  <input type="text" readonly value="" class="liga unitRight" />
57:                  <input type="text" readonly value="f155" class="unit size1of2" />
58:                  <input type="text" maxlength="1" readonly value="&#xf155;" class="unitRight size1of2 talign-right" />
62:                  <input type="text" readonly value="" class="liga unitRight" />
73:                  <input type="text" readonly value="f154" class="unit size1of2" />
74:                  <input type="text" maxlength="1" readonly value="&#xf154;" class="unitRight size1of2 talign-right" />
78:                  <input type="text" readonly value="" class="liga unitRight" />
89:                  <input type="text" readonly value="f153" class="unit size1of2" />
90:                  <input type="text" maxlength="1" readonly value="&#xf153;" class="unitRight size1of2 talign-right" />
94:                  <input type="text" readonly value="" class="liga unitRight" />
105:                  <input type="text" readonly value="f129" class="unit size1of2" />
106:                  <input type="text" maxlength="1" readonly value="&#xf129;" class="unitRight size1of2 talign-right" />
110:                  <input type="text" readonly value="" class="liga unitRight" />
121:                  <input type="text" readonly value="f114" class="unit size1of2" />
122:                  <input type="text" maxlength="1" readonly value="&#xf114;" class="unitRight size1of2 talign-right" />
126:                  <input type="text" readonly value="" class="liga unitRight" />
137:                  <input type="text" readonly value="f101" class="unit size1of2" />
138:                  <input type="text" maxlength="1" readonly value="&#xf101;" class="unitRight size1of2 talign-right" />
142:                  <input type="text" readonly value="" class="liga unitRight" />
153:                  <input type="text" readonly value="f102" class="unit size1of2" />
154:                  <input type="text" maxlength="1" readonly value="&#xf102;" class="unitRight size1of2 talign-right" />
158:                  <input type="text" readonly value="" class="liga unitRight" />
169:                  <input type="text" readonly value="f103" class="unit size1of2" />
170:                  <input type="text" maxlength="1" readonly value="&#xf103;" class="unitRight size1of2 talign-right" />
174:                  <input type="text" readonly value="" class="liga unitRight" />
185:                  <input type="text" readonly value="f104" class="unit size1of2" />
186:                  <input type="text" maxlength="1" readonly value="&#xf104;" class="unitRight size1of2 talign-right" />
190:                  <input type="text" readonly value="" class="liga unitRight" />
201:                  <input type="text" readonly value="f105" class="unit size1of2" />
202:                  <input type="text" maxlength="1" readonly value="&#xf105;" class="unitRight size1of2 talign-right" />
206:                  <input type="text" readonly value="" class="liga unitRight" />
217:                  <input type="text" readonly value="f106" class="unit size1of2" />
218:                  <input type="text" maxlength="1" readonly value="&#xf106;" class="unitRight size1of2 talign-right" />
222:                  <input type="text" readonly value="" class="liga unitRight" />
233:                  <input type="text" readonly value="f107" class="unit size1of2" />
234:                  <input type="text" maxlength="1" readonly value="&#xf107;" class="unitRight size1of2 talign-right" />
238:                  <input type="text" readonly value="" class="liga unitRight" />
249:                  <input type="text" readonly value="f108" class="unit size1of2" />
250:                  <input type="text" maxlength="1" readonly value="&#xf108;" class="unitRight size1of2 talign-right" />
254:                  <input type="text" readonly value="" class="liga unitRight" />
265:                  <input type="text" readonly value="f109" class="unit size1of2" />
266:                  <input type="text" maxlength="1" readonly value="&#xf109;" class="unitRight size1of2 talign-right" />
270:                  <input type="text" readonly value="" class="liga unitRight" />
281:                  <input type="text" readonly value="f110" class="unit size1of2" />
282:                  <input type="text" maxlength="1" readonly value="&#xf110;" class="unitRight size1of2 talign-right" />
286:                  <input type="text" readonly value="" class="liga unitRight" />
297:                  <input type="text" readonly value="f112" class="unit size1of2" />
298:                  <input type="text" maxlength="1" readonly value="&#xf112;" class="unitRight size1of2 talign-right" />
302:                  <input type="text" readonly value="" class="liga unitRight" />
313:                  <input type="text" readonly value="f113" class="unit size1of2" />
314:                  <input type="text" maxlength="1" readonly value="&#xf113;" class="unitRight size1of2 talign-right" />
318:                  <input type="text" readonly value="" class="liga unitRight" />
329:                  <input type="text" readonly value="f115" class="unit size1of2" />
330:                  <input type="text" maxlength="1" readonly value="&#xf115;" class="unitRight size1of2 talign-right" />
334:                  <input type="text" readonly value="" class="liga unitRight" />
345:                  <input type="text" readonly value="f116" class="unit size1of2" />
346:                  <input type="text" maxlength="1" readonly value="&#xf116;" class="unitRight size1of2 talign-right" />
350:                  <input type="text" readonly value="" class="liga unitRight" />
361:                  <input type="text" readonly value="f117" class="unit size1of2" />
362:                  <input type="text" maxlength="1" readonly value="&#xf117;" class="unitRight size1of2 talign-right" />
366:                  <input type="text" readonly value="" class="liga unitRight" />
377:                  <input type="text" readonly value="f118" class="unit size1of2" />
378:                  <input type="text" maxlength="1" readonly value="&#xf118;" class="unitRight size1of2 talign-right" />
382:                  <input type="text" readonly value="" class="liga unitRight" />
393:                  <input type="text" readonly value="f119" class="unit size1of2" />
394:                  <input type="text" maxlength="1" readonly value="&#xf119;" class="unitRight size1of2 talign-right" />
398:                  <input type="text" readonly value="" class="liga unitRight" />
409:                  <input type="text" readonly value="f120" class="unit size1of2" />
410:                  <input type="text" maxlength="1" readonly value="&#xf120;" class="unitRight size1of2 talign-right" />
414:                  <input type="text" readonly value="" class="liga unitRight" />
425:                  <input type="text" readonly value="f121" class="unit size1of2" />
426:                  <input type="text" maxlength="1" readonly value="&#xf121;" class="unitRight size1of2 talign-right" />
430:                  <input type="text" readonly value="" class="liga unitRight" />
441:                  <input type="text" readonly value="f122" class="unit size1of2" />
442:                  <input type="text" maxlength="1" readonly value="&#xf122;" class="unitRight size1of2 talign-right" />
446:                  <input type="text" readonly value="" class="liga unitRight" />
457:                  <input type="text" readonly value="f123" class="unit size1of2" />
458:                  <input type="text" maxlength="1" readonly value="&#xf123;" class="unitRight size1of2 talign-right" />
462:                  <input type="text" readonly value="" class="liga unitRight" />
473:                  <input type="text" readonly value="f124" class="unit size1of2" />
474:                  <input type="text" maxlength="1" readonly value="&#xf124;" class="unitRight size1of2 talign-right" />
478:                  <input type="text" readonly value="" class="liga unitRight" />
489:                  <input type="text" readonly value="f125" class="unit size1of2" />
490:                  <input type="text" maxlength="1" readonly value="&#xf125;" class="unitRight size1of2 talign-right" />
494:                  <input type="text" readonly value="" class="liga unitRight" />
505:                  <input type="text" readonly value="f126" class="unit size1of2" />
506:                  <input type="text" maxlength="1" readonly value="&#xf126;" class="unitRight size1of2 talign-right" />
510:                  <input type="text" readonly value="" class="liga unitRight" />
521:                  <input type="text" readonly value="f127" class="unit size1of2" />
522:                  <input type="text" maxlength="1" readonly value="&#xf127;" class="unitRight size1of2 talign-right" />
526:                  <input type="text" readonly value="" class="liga unitRight" />
537:                  <input type="text" readonly value="f128" class="unit size1of2" />
538:                  <input type="text" maxlength="1" readonly value="&#xf128;" class="unitRight size1of2 talign-right" />
542:                  <input type="text" readonly value="" class="liga unitRight" />
553:                  <input type="text" readonly value="f130" class="unit size1of2" />
554:                  <input type="text" maxlength="1" readonly value="&#xf130;" class="unitRight size1of2 talign-right" />
558:                  <input type="text" readonly value="" class="liga unitRight" />
569:                  <input type="text" readonly value="f131" class="unit size1of2" />
570:                  <input type="text" maxlength="1" readonly value="&#xf131;" class="unitRight size1of2 talign-right" />
574:                  <input type="text" readonly value="" class="liga unitRight" />
585:                  <input type="text" readonly value="f132" class="unit size1of2" />
586:                  <input type="text" maxlength="1" readonly value="&#xf132;" class="unitRight size1of2 talign-right" />
590:                  <input type="text" readonly value="" class="liga unitRight" />
601:                  <input type="text" readonly value="f133" class="unit size1of2" />
602:                  <input type="text" maxlength="1" readonly value="&#xf133;" class="unitRight size1of2 talign-right" />
606:                  <input type="text" readonly value="" class="liga unitRight" />
617:                  <input type="text" readonly value="f111" class="unit size1of2" />
618:                  <input type="text" maxlength="1" readonly value="&#xf111;" class="unitRight size1of2 talign-right" />
622:                  <input type="text" readonly value="" class="liga unitRight" />
633:                  <input type="text" readonly value="f134" class="unit size1of2" />
634:                  <input type="text" maxlength="1" readonly value="&#xf134;" class="unitRight size1of2 talign-right" />
638:                  <input type="text" readonly value="" class="liga unitRight" />
649:                  <input type="text" readonly value="f136" class="unit size1of2" />
650:                  <input type="text" maxlength="1" readonly value="&#xf136;" class="unitRight size1of2 talign-right" />
654:                  <input type="text" readonly value="" class="liga unitRight" />
665:                  <input type="text" readonly value="f135" class="unit size1of2" />
666:                  <input type="text" maxlength="1" readonly value="&#xf135;" class="unitRight size1of2 talign-right" />
670:                  <input type="text" readonly value="" class="liga unitRight" />
681:                  <input type="text" readonly value="f137" class="unit size1of2" />
682:                  <input type="text" maxlength="1" readonly value="&#xf137;" class="unitRight size1of2 talign-right" />
686:                  <input type="text" readonly value="" class="liga unitRight" />
697:                  <input type="text" readonly value="f152" class="unit size1of2" />
698:                  <input type="text" maxlength="1" readonly value="&#xf152;" class="unitRight size1of2 talign-right" />
702:                  <input type="text" readonly value="" class="liga unitRight" />
713:                  <input type="text" readonly value="f151" class="unit size1of2" />
714:                  <input type="text" maxlength="1" readonly value="&#xf151;" class="unitRight size1of2 talign-right" />
718:                  <input type="text" readonly value="" class="liga unitRight" />
729:                  <input type="text" readonly value="f150" class="unit size1of2" />
730:                  <input type="text" maxlength="1" readonly value="&#xf150;" class="unitRight size1of2 talign-right" />
734:                  <input type="text" readonly value="" class="liga unitRight" />
745:                  <input type="text" readonly value="f149" class="unit size1of2" />
746:                  <input type="text" maxlength="1" readonly value="&#xf149;" class="unitRight size1of2 talign-right" />
750:                  <input type="text" readonly value="" class="liga unitRight" />
761:                  <input type="text" readonly value="f148" class="unit size1of2" />
762:                  <input type="text" maxlength="1" readonly value="&#xf148;" class="unitRight size1of2 talign-right" />
766:                  <input type="text" readonly value="" class="liga unitRight" />
777:                  <input type="text" readonly value="f147" class="unit size1of2" />
778:                  <input type="text" maxlength="1" readonly value="&#xf147;" class="unitRight size1of2 talign-right" />
782:                  <input type="text" readonly value="" class="liga unitRight" />
793:                  <input type="text" readonly value="f146" class="unit size1of2" />
794:                  <input type="text" maxlength="1" readonly value="&#xf146;" class="unitRight size1of2 talign-right" />
798:                  <input type="text" readonly value="" class="liga unitRight" />
809:                  <input type="text" readonly value="f145" class="unit size1of2" />
810:                  <input type="text" maxlength="1" readonly value="&#xf145;" class="unitRight size1of2 talign-right" />
814:                  <input type="text" readonly value="" class="liga unitRight" />
825:                  <input type="text" readonly value="f144" class="unit size1of2" />
826:                  <input type="text" maxlength="1" readonly value="&#xf144;" class="unitRight size1of2 talign-right" />
830:                  <input type="text" readonly value="" class="liga unitRight" />
841:                  <input type="text" readonly value="f143" class="unit size1of2" />
842:                  <input type="text" maxlength="1" readonly value="&#xf143;" class="unitRight size1of2 talign-right" />
846:                  <input type="text" readonly value="" class="liga unitRight" />
857:                  <input type="text" readonly value="f142" class="unit size1of2" />
858:                  <input type="text" maxlength="1" readonly value="&#xf142;" class="unitRight size1of2 talign-right" />
862:                  <input type="text" readonly value="" class="liga unitRight" />
873:                  <input type="text" readonly value="f141" class="unit size1of2" />
874:                  <input type="text" maxlength="1" readonly value="&#xf141;" class="unitRight size1of2 talign-right" />
878:                  <input type="text" readonly value="" class="liga unitRight" />
889:                  <input type="text" readonly value="f140" class="unit size1of2" />
890:                  <input type="text" maxlength="1" readonly value="&#xf140;" class="unitRight size1of2 talign-right" />
894:                  <input type="text" readonly value="" class="liga unitRight" />
905:                  <input type="text" readonly value="f139" class="unit size1of2" />
906:                  <input type="text" maxlength="1" readonly value="&#xf139;" class="unitRight size1of2 talign-right" />
910:                  <input type="text" readonly value="" class="liga unitRight" />
921:                  <input type="text" readonly value="f138" class="unit size1of2" />
922:                  <input type="text" maxlength="1" readonly value="&#xf138;" class="unitRight size1of2 talign-right" />
926:                  <input type="text" readonly value="" class="liga unitRight" />
============= ./views/_build-trends-chart.html =================
13:        <span class="avg-duration-text text-muted">
============= ./views/_config-file-params.html =================
7:    <copy-to-clipboard clipboard-text="data.password" display-wide="true"></copy-to-clipboard>
============= ./views/_overview-deployment.html =================
46:          <span ng-switch-when="Cancelled">&mdash; <span class="text-warning"><i class="fa fa-ban" aria-hidden="true"></i> Cancelled</span></span>
47:          <span ng-switch-when="Failed">&mdash; <span class="text-danger"><i class="fa fa-times" aria-hidden="true"></i> Failed</span></span>
============= ./views/_pod-template.html =================
33:            <span ng-if="imagesByDockerReference[container.image].dockerImageMetadata.Size" class="small text-muted nowrap">
95:              <truncate-long-text
101:              </truncate-long-text>
136:            <small class="text-muted">{{mount | volumeMountMode : podTemplate.spec.volumes}}</small>
============= ./views/_pods.html =================
11:      <div class="pod-text">{{phase}}</div>
19:      <div class="pod-text">{{phase}}</div>
============= ./views/_project-page.html =================
12:      <events-sidebar ng-if="projectContext" project-context="projectContext" collapsed="renderOptions.collapseEventsSidebar"></events-sidebar>
============= ./views/_templateopt.html =================
23:          type="text"
45:      <textarea
59:          ng-attr-aria-describedby="{{parameter.description ? (paramID + '-description') : undefined}}"></textarea>
============= ./views/_volumes.html =================
18:        <span class="small text-muted">(当pod建立时被一个机密构成)</span>
38:        <span class="small text-muted">(参考一个固定卷声明)</span>
52:        <span class="small text-muted">(显示主机文件夹卷)</span>
61:       <span class="small text-muted">(临时文件夹和pod同时销毁)</span>
73:       <span class="small text-muted">(当pod创建的时候从git拉取)</span>
84:        <span class="small text-muted">(生成关于pod的信息)</span>
95:        <span class="small text-muted">(生成一个配置映射关系图)</span>
============= ./views/add-config-volume.html =================
19:                <div ng-if="error" class="empty-state-message text-center">
26:                    <h2 class="text-center">No config maps or secrets.</h2>
49:                                <small class="text-muted">&ndash; {{$select.selected.kind | humanizeKind : true}}</small>
77:                              type="text"
152:                                    type="text"
199:                                help-text="Add the volume to the selected containers.">
============= ./views/attach-pvc.html =================
20:                  <h2 class="text-center">No persistent volume claims.</h2>
27:                  <div ng-if="project && ('persistentvolumeclaims' | canI : 'create')" class="text-center">
90:                            type="text"
120:                            type="text"
151:                            type="text"
209:                              help-text="Add the volume to the selected containers.">
============= ./views/browse/_build-details.html =================
12:            <span class="text-muted">&ndash;</span>
20:            <span><span class="text-muted">&ndash;</span> {{build.status.startTimestamp | date : 'medium'}}</span>
71:                    context-dir="build.spec.source.contextDir">{{build.spec.source.git.uri}}</osc-git-link></span></dd>
74:        <dt ng-if-start="build.spec.source.contextDir">Source Context Dir:</dt>
75:        <dd ng-if-end>{{build.spec.source.contextDir}}</dd>
============= ./views/browse/_pod-details.html =================
53:          <span ng-if="pod.status.phase === 'Running' && pod.status.startTime" class="text-muted">
============= ./views/browse/build-config.html =================
85:                    <div ng-if="buildConfig && unfilteredBuilds && (unfilteredBuilds | hashSize) === 0" class="empty-state-message text-center">
101:                                              context-dir="buildConfig.spec.source.contextDir">{{buildConfig.spec.source.git.uri}}</osc-git-link></span>
163:                      <div class="last-timestamp meta text-muted">
247:                                            context-dir="buildConfig.spec.source.contextDir">{{buildConfig.spec.source.git.uri}}</osc-git-link></span></dd>
250:                                  <dt ng-if="buildConfig.spec.source.contextDir">Source Context Dir:</dt>
251:                                  <dd ng-if="buildConfig.spec.source.contextDir">{{buildConfig.spec.source.contextDir}}</dd>
387:                                      <copy-to-clipboard clipboard-text="buildConfig.metadata.name | webhookURL : trigger.type : trigger.github.secret : project.metadata.name"></copy-to-clipboard>
395:                                      <copy-to-clipboard clipboard-text="buildConfig.metadata.name | webhookURL : trigger.type : trigger.generic.secret : project.metadata.name"></copy-to-clipboard>
428:                              <copy-to-clipboard clipboard-text="'oc start-build ' + buildConfig.metadata.name + ' -n ' + project.metadata.name"></copy-to-clipboard>
============= ./views/browse/build.html =================
125:                        context="projectContext"
145:                      <events resource-kind="Pod" resource-name="{{build | annotation : 'buildPod'}}" project-context="projectContext" ng-if="selectedTab.events"></events>
============= ./views/browse/config-map.html =================
11:          <div ng-if="loaded && error" class="empty-state-message text-center">
53:              <div ng-if="!(configMap.data | hashSize)" class="empty-state-message text-center">
62:                        <truncate-long-text
67:                        </truncate-long-text>
============= ./views/browse/deployment-config.html =================
126:                      <div class="last-timestamp meta text-muted">
313:                              <copy-to-clipboard clipboard-text="'oc rollout latest dc/' + deploymentConfig.metadata.name + ' -n ' + project.metadata.name"></copy-to-clipboard>
322:                                    <small ng-if="!trigger.imageChangeParams.automatic" class="text-muted">(disabled)</small>
380:                    <events resource-kind="DeploymentConfig" resource-name="{{deploymentConfig.metadata.name}}" project-context="projectContext" ng-if="selectedTab.events"></events>
============= ./views/browse/deployment.html =================
161:                              class="pficon pficon-help text-muted small"></span>
173:                              class="pficon pficon-help text-muted small"></span>
185:                              class="pficon pficon-help text-muted small"></span>
296:                  <events resource-kind="Deployment" resource-name="{{deployment.metadata.name}}" project-context="projectContext" ng-if="selectedTab.events"></events>
============= ./views/browse/pod.html =================
89:                      context="projectContext"
129:                      <div ng-if="noContainersYet" class="empty-state-message text-center">
180:                                      ng-class="{'text-muted' : (term.status === 'disconnected')}">
185:                                      ng-class="{'text-muted' : !term.isUsed}">
223:                    <events resource-kind="Pod" resource-name="{{pod.metadata.name}}" project-context="projectContext" ng-if="selectedTab.events"></events>
============= ./views/browse/replica-set.html =================
138:                      context="projectContext"
152:                    <events resource-kind="{{kind}}" resource-name="{{replicaSet.metadata.name}}" project-context="projectContext" ng-if="selectedTab.events"></events>
============= ./views/browse/routes.html =================
91:                    <!-- Use shorter Termination title for table-mobile to avoid overlapping text. -->
============= ./views/browse/secret.html =================
11:          <div ng-if="loaded && error" class="empty-state-message text-center">
68:                              clipboard-text="secretData"
============= ./views/browse/service.html =================
110:                  <events resource-kind="Service" resource-name="{{service.metadata.name}}" project-context="projectContext" ng-if="selectedTab.events"></events>
============= ./views/browse/stateful-set.html =================
192:                        project-context="projectContext"
============= ./views/builds.html =================
71:                                            context-dir="buildConfigs[buildConfigName].spec.source.contextDir">{{buildConfigs[buildConfigName].spec.source.git.uri}}</osc-git-link></span></td>
115:                          context-dir="latestBuild.spec.source.contextDir">{{latestBuild.spec.source.git.uri}}</osc-git-link>
============= ./views/catalog/_image.html =================
13:          <truncate-long-text
18:            use-word-boundary="true"></truncate-long-text>
============= ./views/catalog/_template.html =================
11:        <truncate-long-text
16:          highlight-keywords="keywords"></truncate-long-text>
============= ./views/catalog/catalog.html =================
4:  <h2 class="text-center">No images or templates.</h2>
51:  <div ng-if="allContentHidden" class="empty-state-message text-center h2">
============= ./views/catalog/category-content.html =================
4:  <h2 class="text-center">No images or templates.</h2>
46:  <div ng-if="!filteredBuilderImages.length && !filteredTemplates.length && loaded" class="empty-state-message text-center h2">
============= ./views/command-line.html =================
40:                    <copy-to-clipboard display-wide="true" clipboard-text="'oc login ' + loginBaseURL + ' --token=' + sessionToken" input-text="'oc login ' + loginBaseURL + ' --token=<hidden>'"></copy-to-clipboard>
53:                    <copy-to-clipboard display-wide="true" clipboard-text="'oc project <project-name>'"></copy-to-clipboard>
57:                    <copy-to-clipboard display-wide="true" clipboard-text="'oc new-project <project-name>'"></copy-to-clipboard>
61:                    <copy-to-clipboard display-wide="true" clipboard-text="'oc status'"></copy-to-clipboard>
============= ./views/create-from-url.html =================
32:                          <span ng-if="project | displayName : true" class="small text-muted">
49:                              <span ng-if="project | displayName : true" class="small text-muted">
============= ./views/create-route.html =================
34:                            help-text="Labels for this route.">
============= ./views/create.html =================
30:                    <deploy-image project="projectName" context="context" alerts="alerts"></deploy-image>
============= ./views/create/fromimage.html =================
40:                               <input type="text"
88:                                    type="text"
98:                                    ref: {{image.metadata.annotations.sampleRef}}</span><span ng-if="image.metadata.annotations.sampleContextDir">,
99:                                    context dir: {{image.metadata.annotations.sampleContextDir}}</span>
120:                                    type="text"
134:                            <label for="contextdir">Context Dir</label>
137:                                id="contextdir"
138:                                ng-model="buildConfig.contextDir"
139:                                type="text"
146:                            <div class="help-block">Optional subdirectory for the application source code, used as the context directory for the build.</div>
405:                                help-text="Each label is applied to each created resource.">
============= ./views/create/next-steps.html =================
103:                  <copy-to-clipboard clipboard-text="createdBuildConfig.metadata.name | webhookURL : trigger.type : trigger.github.secret : projectName"></copy-to-clipboard>
============= ./views/directives/_copy-to-clipboard.html =================
6:      type="text"
23:        data-clipboard-text="{{clipboardText}}"
============= ./views/directives/_edit-command.html =================
7:        <input type="text"
16:        <textarea ng-model="arg.value"
24:        </textarea>
42:      <input type="text"
66:      <textarea ng-model="nextArg"
75:      </textarea>
============= ./views/directives/_edit-probe.html =================
28:            type="text"
============= ./views/directives/_pod-content.html =================
1:<div class="pod-text" ng-switch="pod.status.phase">
============= ./views/directives/_probe.html =================
7:    <truncate-long-text
13:    </truncate-long-text>
20:<small class="text-muted">
============= ./views/directives/_status-icon.html =================
2:  <span ng-switch-when="Cancelled" class="fa fa-ban text-muted" aria-hidden="true"></span>
3:  <span ng-switch-when="Complete" class="fa fa-check text-success" aria-hidden="true"></span>
4:  <span ng-switch-when="Completed" class="fa fa-check text-success" aria-hidden="true"></span>
6:  <span ng-switch-when="Error" class="fa fa-times text-danger" aria-hidden="true"></span>
7:  <span ng-switch-when="Failed" class="fa fa-times text-danger" aria-hidden="true"></span>
11:  <span ng-switch-when="Succeeded" class="fa fa-check text-success" aria-hidden="true"></span>
12:  <span ng-switch-when="Bound" class="fa fa-check text-success" aria-hidden="true"></span>
13:  <span ng-switch-when="Terminating" class="fa fa-times text-danger" aria-hidden="true"></span>
14:  <span ng-switch-when="Terminated" class="fa fa-times text-danger" aria-hidden="true"></span>
15:  <span ng-switch-when="Unknown" class="fa fa-question text-danger" aria-hidden="true"></span>
19:  <span ng-switch-when="CrashLoopBackOff" class="fa fa-times text-danger" aria-hidden="true"></span>
20:  <span ng-switch-when="ImagePullBackOff" class="fa fa-times text-danger" aria-hidden="true"></span>
21:  <span ng-switch-when="ImageInspectError" class="fa fa-times text-danger" aria-hidden="true"></span>
22:  <span ng-switch-when="ErrImagePull" class="fa fa-times text-danger" aria-hidden="true"></span>
23:  <span ng-switch-when="ErrImageNeverPull" class="fa fa-times text-danger" aria-hidden="true"></span>
24:  <span ng-switch-when="no matching container" class="fa fa-times text-danger" aria-hidden="true"></span>
25:  <span ng-switch-when="RegistryUnavailable" class="fa fa-times text-danger" aria-hidden="true"></span>
26:  <span ng-switch-when="RunContainerError" class="fa fa-times text-danger" aria-hidden="true"></span>
27:  <span ng-switch-when="KillContainerError" class="fa fa-times text-danger" aria-hidden="true"></span>
28:  <span ng-switch-when="VerifyNonRootError" class="fa fa-times text-danger" aria-hidden="true"></span>
29:  <span ng-switch-when="SetupNetworkError" class="fa fa-times text-danger" aria-hidden="true"></span>
30:  <span ng-switch-when="TeardownNetworkError" class="fa fa-times text-danger" aria-hidden="true"></span>
31:  <span ng-switch-when="DeadlineExceeded" class="fa fa-times text-danger" aria-hidden="true"></span>
============= ./views/directives/annotations.html =================
12:            <truncate-long-text
17:            </truncate-long-text>
============= ./views/directives/build-hooks.html =================
9:      <truncate-long-text
15:      </truncate-long-text>
21:      <truncate-long-text
26:      </truncate-long-text>
46:      <truncate-long-text
52:      </truncate-long-text>
============= ./views/directives/create-secret.html =================
22:            type="text"
69:            type="text"
116:          help-text="Upload your ca.crt file."
138:          help-text="Upload your private SSH key file."></osc-file-input>
168:          help-text="Upload your .gitconfig or  file."
189:            type="text"
209:            type="text"
272:          help-text="Upload a .dockercfg or .docker/config.json file"
============= ./views/directives/deploy-image.html =================
59:  <div ng-if="loading || !import" class="empty-state-message text-muted text-center">
68:    <div class="col-sm-2 hidden-xs text-right h2">
69:      <span class="fa fa-cube text-muted" style="font-size: 100px;" aria-hidden="true"></span>
115:           <input type="text"
182:            help-text="Each label is applied to each created resource.">
198:  <div ng-if="!loading && import.error" class="empty-state-message text-center">
206:  <div ng-if="!loading && import && !import.error && !import.image" class="empty-state-message text-center">
============= ./views/directives/deployment-metrics.html =================
38:  <div ng-if="metricsError" class="empty-state-message text-center">
50:    <p class="text-muted">
============= ./views/directives/edit-config-map.html =================
11:            type="text"
61:              type="text"
103:          help-text="Enter a value for the config map entry or use the contents of a file."></osc-file-input>
============= ./views/directives/edit-webhook-triggers.html =================
12:      <copy-to-clipboard is-disabled="trigger.disabled" clipboard-text="bcName | webhookURL : trigger.data.type : trigger.data[(type === 'GitHub') ? 'github' : 'generic'].secret : projectName"></copy-to-clipboard>
============= ./views/directives/events-badge.html =================
1:<a ng-href="project/{{projectContext.projectName}}/browse/events" class="events-badge visible-xs"><span class="event-label">Events</span><span ng-if="warningCount" class="mar-left-md"><span class="pficon pficon-warning-triangle-o mar-right-sm" aria-hidden="true"></span><span class="sr-only">Warning</span><span class="event-count">{{warningCount}}</span></span><span ng-if="normalCount" class="mar-left-sm"><span class="pficon pficon-info mar-right-sm" aria-hidden="true"></span><span class="sr-only">Normal</span><span class="event-count">{{normalCount}}</span></span></a>
============= ./views/directives/events-sidebar.html =================
18:      <a ng-href="project/{{projectContext.projectName}}/browse/events">View Details</a>
32:            <span ng-switch-when="Normal" class="pficon pficon-info text-muted"></span>
52:          <div ng-if="event.count > 1" class="text-muted small">
============= ./views/directives/events.html =================
14:                 ng-model="filter.text"
22:              ng-if="filter.text"
23:              ng-click="filter.text = ''">
58:            <a href="" ng-click="filter.text = ''" role="button">Clear Filter</a>
65:            <a href="" ng-click="filter.text = ''" role="button">Clear Filter</a>
87:        <td data-title="Severity" class="hidden-xs hidden-sm hidden-md text-center severity-icon-td">
99:          <truncate-long-text
106:          </truncate-long-text>
107:          <div ng-if="event.count > 1" class="text-muted small">
============= ./views/directives/from-file.html =================
13:          help-text="Upload file by dragging & dropping, selecting it, or pasting from the clipboard."
============= ./views/directives/header/project-header.html =================
17:      <select class="selectpicker form-control" data-selected-text-format="count>3" id="boostrapSelect" title=""></select>
============= ./views/directives/key-value-editor.html =================
34:          type="text"
53:          <span class="validation-text">{{ entry.keyValidatorError || keyValidatorError }}</span>
67:          <span class="validation-text">Minimum character count is {{keyMinlength}}</span>
72:          <span class="validation-text">{{keyRequiredError}}</span>
85:            type="text"
149:                    <small class="text-muted">&ndash; {{$select.selected.kind | humanizeKind : true}}</small>
176:          <span class="validation-text">{{ entry.valueValidatorError || valueValidatorError}}</span>
190:          <span class="validation-text">Minimum character count is {{valueMinlength}}</span>
============= ./views/directives/lifecycle-hook.html =================
29:            <truncate-long-text content="arg" limit="80" newline-limit="1" expandable="false" use-word-boundary="false"></truncate-long-text>
============= ./views/directives/logs/_log-viewer.html =================
49:<div class="empty-state-message text-center" ng-if="state=='empty'" ng-class="{'log-fixed-height': fixedHeight}">
104:<div ng-if="limitReached" class="text-muted">
110:<div ng-if="errorWhileRunning" class="text-muted">
============= ./views/directives/metrics-compact.html =================
9:        <span ng-if="metric.lastValue | isNil" class="text-muted" aria-hidden="true">
============= ./views/directives/osc-autoscaling.html =================
9:          type="text"
============= ./views/directives/osc-file-input.html =================
7:        type="text"
25:    <span class="help-block">There was an error reading the file. Please copy the file content into the text area.</span>
27:  <textarea class="form-control"
37:  </textarea>
============= ./views/directives/osc-key-values.html =================
17:              type="text"
38:              type="text"
167:                type="text"
============= ./views/directives/osc-persistent-volume-claim.html =================
22:              <span ng-if="sclass.parameters.type || sclass.parameters.zone || (sclass | description)" class="text-muted">
58:          type="text"
============= ./views/directives/osc-routing.html =================
11:            type="text"
46:            type="text"
93:            type="text"
300:              show-text-area="true"
301:              help-text="The PEM format certificate. Upload file by dragging & dropping, selecting it, or pasting from the clipbard."
310:              show-text-area="true"
311:              help-text="The PEM format key. Upload file by dragging & dropping, selecting it, or pasting from the clipboard."
320:              show-text-area="true"
321:              help-text="The PEM format CA certificate. Upload file by dragging & dropping, selecting it, or pasting from the clipboard."
329:                show-text-area="true"
331:                help-text="The PEM format CA certificate to validate the endpoint certificate for re-encrypt termination. Upload file by dragging & dropping, selecting it, or pasting from the clipboard."
============= ./views/directives/osc-source-secrets.html =================
29:                type="text"
77:                type="text"
============= ./views/directives/pod-donut.html =================
3:<div ng-if="mini" class="donut-mini-text">
14:<!-- Include text values for screen readers -->
============= ./views/directives/pod-metrics.html =================
38:  <div ng-if="metricsError" class="empty-state-message text-center">
50:    <p class="text-muted">
72:          <div class="available-text pull-left">
81:          <div class="available-text pull-left">
============= ./views/directives/pods-table.html =================
43:          <span class="fa fa-fw fa-check text-success" aria-hidden="true"></span>
48:            <span class="fa fa-fw fa-times text-danger" aria-hidden="true" data-toggle="tooltip" style="cursor: help;"></span>
============= ./views/directives/traffic-table.html =================
30:      <td role="presentation" class="text-muted arrow"></td>
35:      <td role="presentation" class="text-muted arrow"></td>
51:      <!-- Use shorter Termination title for table-mobile to avoid overlapping text. -->
60:        <span ng-if="!port.nodePort" class="text-muted">none</span>
63:      <td role="presentation" class="text-muted arrow"></td>
68:      <td role="presentation" class="text-muted arrow"></td>
72:      <td data-title="Hostname"><span class="text-muted">none</span></td>
74:        <span class="text-muted">none</span>
============= ./views/edit/build-config.html =================
42:                                    type="text"
69:                                    type="text"
84:                              <label for="sourceContextDir">Context Dir</label>
87:                                  id="sourceContextDir"
88:                                  name="sourceContextDir"
89:                                  type="text"
90:                                  ng-model="updatedBuildConfig.spec.source.contextDir"
95:                                  aria-describedby="context-dir-help">
97:                              <div class="help-block" id="context-dir-help">Optional subdirectory for the application source code, used as the context directory for the build.</div>
131:                                type="text"
177:                                  type="text"
194:                                  type="text"
260:                               type="text"
267:                          Optional path to the Jenkinsfile relative to the context dir.
268:                          Defaults to the Jenkinsfile in context dir.
325:                                type="text"
339:                                type="text"
396:                                type="text"
============= ./views/edit/deployment-config.html =================
61:                                  type="text"
191:                                      type="text"
214:                                      type="text"
316:                                type="text"
============= ./views/edit/jenkinsfile-examples.html =================
11:      clipboard-text="'node {
26:      clipboard-text="'node(\'maven\') {
44:      clipboard-text="'node {
============= ./views/edit/project.html =================
24:                        type="text"
30:                    <textarea class="form-control input-lg"
34:                        ng-model="editableFields.description"></textarea>
============= ./views/events.html =================
18:            <div class="col-md-12" ng-if="projectContext">
19:              <events project-context="projectContext" ng-if="projectContext"></events>
============= ./views/logs/chromeless-build-log.html =================
19:            context="projectContext"
============= ./views/logs/chromeless-deployment-log.html =================
19:            context="projectContext"
============= ./views/logs/chromeless-pod-log.html =================
19:            context="projectContext"
============= ./views/membership.html =================
180:                        type="text"
============= ./views/modals/confirm-save-log.html =================
8:    <copy-to-clipboard ng-if="command" display-wide="true" clipboard-text="command"></copy-to-clipboard>
============= ./views/modals/debug-terminal.html =================
4:    <small class="text-muted">
11:    <div ng-if="!containerState.running" class="empty-state-message text-center">
13:      <h2 ng-if="debugPod.status.phase !== 'Failed'" class="text-muted">
25:          <span ng-if="containerState.terminated.exitCode" class="text-muted">Exit code: {{containerState.terminated.exitCode}}</span>
38:          <truncate-long-text
44:          </truncate-long-text>
47:        <!-- <copy-to-clipboard clipboard-text="container | entrypoint : image"></copy-to-clipboard> -->
============= ./views/monitoring.html =================
13:                <events-badge project-context="projectContext" ng-if="projectContext" class="pull-right" sidebar-collapsed="renderOptions.collapseEventsSidebar"></events-badge>
33:                          ng-model="filters.text"
41:                          ng-if="filters.text"
42:                          ng-click="filters.text = ''">
96:                            <div class="list-group-item-text">
114:                        context="projectContext"
179:                            <div class="list-group-item-text">
201:                        context="projectContext"
237:                            <div class="list-group-item-text">
303:                            <div class="list-group-item-text">
369:                            <div class="list-group-item-text">
404:                        context="projectContext"
============= ./views/new-overview.html =================
12:        <div class="empty-state-message text-center">
62:                          type="text"
111:              <div class="empty-state-message text-center h2">
251:                <div ng-if="!overview.pipelineBuildConfigs.length" class="empty-state-message text-center">
273:                  <div class="empty-state-message text-center h2">
============= ./views/newfromtemplate.html =================
35:                              <span ng-if="image.usesParameters.length" class="text-muted small">
52:                              help-text="Each label is applied to each created resource.">
============= ./views/other-resources.html =================
56:                    <td data-title="Actions" class="text-xs-left text-right">
============= ./views/overview.html =================
16:                <div class="empty-project text-center">
============= ./views/overview/_build-counts.html =================
14:          <i class="pficon pficon-error-circle-o text-danger"></i>
============= ./views/overview/_builds.html =================
19:            <i class="pficon pficon-error-circle-o text-danger"></i>
37:          <small class="text-muted mar-left-md">created <span am-time-ago="build.metadata.creationTimestamp"></span></small>
40:          <mini-log api-object="build" context="overviewBuilds.context"></mini-log>
============= ./views/overview/_dc.html =================
124:        <span class="text-danger deployment-status-msg">
============= ./views/overview/_list-row-expanded.html =================
155:              context="row.state.context"
181:      context="row.state.context"
============= ./views/overview/_metrics-summary.html =================
7:      <span ng-if="metric.currentUsage | isNil" class="text-muted" aria-hidden="true">
============= ./views/overview/_networking.html =================
14:        <i class="fa fa-long-arrow-right text-muted"></i>
52:        <span ng-if="!('routes' | canI : 'create')" class="text-muted">No Routes</span>
============= ./views/pipelines.html =================
30:              <div ng-if="buildConfigsLoaded" class="empty-state-message text-center">
73:                        context-dir="buildConfigs[buildConfigName].spec.source.contextDir">{{buildConfigs[buildConfigName].spec.source.git.uri}}</osc-git-link></span>
101:                <div ng-if="!(statsByConfig[buildConfigName].avgDuration | isNil)" class="hidden-xs pull-right text-muted">
107:                  <small ng-if="!(statsByConfig[buildConfigName].avgDuration | isNil)" class="visible-xs-block mar-top-xs text-muted">
============= ./views/project.html =================
43:                <div ng-if="renderOptions.showGetStarted" class="empty-project text-center">
69:                      <text y="6" x="0.5">&#xf1b3;</text>
73:                      <text y="10" x="1">&#xe61e;</text>
77:                      <text y="9">&#xe624;</text>
81:                      <text y="8">&#xf013;</text>
85:                      <text y="9">&#xe625;</text>
============= ./views/projects.html =================
20:                    <h2 class="text-center">Loading...</h2>
42:                                    ng-model="search.text">
47:                                    ng-if="search.text"
48:                                    ng-click="search.text = ''">
65:                      <a href="" ng-click="search.text = ''" role="button">Clear Filter</a>
115:                              <span class="list-group-item-text project-description">
116:                                <truncate-long-text ng-if="!keywords.length" content="project | description" limit="265" newline-limit="10" use-word-boundary="true"></truncate-long-text>
129:                  <div class="empty-state-message empty-state-full-page text-center">
============= ./views/quota.html =================
33:                        <span class="text-muted small" ng-if="scope | scopeDetails">&mdash; {{scope | scopeDetails}}</span>
40:                        <h3 class="text-center">CPU <small>Request</small></h3>
44:                        <h3 class="text-center">Memory <small>Request</small></h3>
48:                        <h3 class="text-center">CPU <small>Request</small></h3>
52:                        <h3 class="text-center">Memory <small>Request</small></h3>
56:                        <h3 class="text-center">CPU <small>Limit</small></h3>
60:                        <h3 class="text-center">Memory <small>Limit</small></h3>
125:                        <span class="text-muted small" ng-if="scope | scopeDetails">&mdash; {{scope | scopeDetails}}</span>
132:                        <h3 class="text-center">CPU <small>Request</small></h3>
136:                        <h3 class="text-center">Memory <small>Request</small></h3>
140:                        <h3 class="text-center">CPU <small>Request</small></h3>
144:                        <h3 class="text-center">Memory <small>Request</small></h3>
148:                        <h3 class="text-center">CPU <small>Limit</small></h3>
152:                        <h3 class="text-center">Memory <small>Limit</small></h3>
============= ./views/storage.html =================
59:                      <span ng-if="pvc | storageClass" class="text-muted"> using storage class {{pvc | storageClass}}</span>
============= ./file-sys.result =================
440:./views/directives/truncate-long-text.html
457:./views/logs/textonly_log.html
