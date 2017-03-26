============= ./index.html =================
20:    <link rel="stylesheet" href="bower_components/kubernetes-label-selector/labelFilter.css" />
130:    <script src="bower_components/kubernetes-label-selector/labelSelector.js"></script>
131:    <script src="bower_components/kubernetes-label-selector/labelFilter.js"></script>
202:        <script src="scripts/services/labels.js"></script>
260:        <script src="scripts/controllers/labels.js"></script>
314:        <script src="scripts/directives/labels.js"></script>
============= ./scripts/app.js =================
150:      // For when a build is missing a buildconfig label
============= ./scripts/constants.js =================
36:    "selector_label":          "install_config/persistent_storage/selector_label_binding.html",
137:      label: "概览",
142:      label: "应用",
148:              label: "部署",
158:              label: "状态",
165:              label: "Pods",
172:              label: "服务",
179:              label: "路由",
190:      label: "构建",
196:              label: "构建",
204:              label: "编排",
211:              label: "镜像",
222:      label: "资源",
228:              label: "配额",
232:              label: "权限",
241:              label: "配置图",
248:              label: "机密",
259:              label: "其他资源",
267:      label: "存储",
275:      label: "监控",
286:      //         label: "事件",
290:      //         label: "日志",
294:      //         label: "权重",
305:      label: "语言",
310:          label: "Java",
317:                label: "Red Hat JBoss A-MQ"
321:                label: "Red Hat JBoss BPM Suite"
325:                label: "Red Hat JBoss BRMS"
329:                label: "Red Hat JBoss Data Grid"
333:                label: "Red Hat JBoss EAP"
337:                label: "Red Hat JBoss Fuse"
341:                label: "Red Hat JBoss Web Server (Tomcat)"
345:                label: "Red Hat Single Sign-On"
349:                label: "WildFly"
357:          label: "JavaScript",
362:          label: ".NET",
367:          label: "Perl",
372:          label: "PHP",
377:          label: "Python",
382:          label: "Ruby",
388:          label: "Go",
395:      label: "业务",
400:          label: "业务流程服务",
406:          label: "持续集成和部署",
412:          label: "数据存储",
417:          label: "消息",
422:          label: "集成",
428:          label: "单点登录",
433:          label: "未分类",
============= ./scripts/controllers/build.js =================
165:              label: "构建视图"
176:            label: "日志视图"
============= ./scripts/controllers/buildConfig.js =================
25:    $scope.labelSuggestions = {};
147:              label: 'Reload Environment Variables',
205:        LabelFilter.addLabelSuggestionsFromResources($scope.unfilteredBuilds, $scope.labelSuggestions);
206:        LabelFilter.setLabelSuggestions($scope.labelSuggestions);
217:            // because build config names can be > 63 chars but label values can't
219:            labelSelector: $filter('labelName')('buildConfig') + '=' + _.trunc($scope.buildConfigName, {length: 63, omission: ''})
236:        LabelFilter.onActiveFiltersChanged(function(labelSelector) {
239:            $scope.builds = labelSelector.select($scope.unfilteredBuilds);
============= ./scripts/controllers/builds.js =================
16:    $scope.labelSuggestions = {};
43:          LabelFilter.addLabelSuggestionsFromResources($scope.builds, $scope.labelSuggestions);
51:          LabelFilter.addLabelSuggestionsFromResources($scope.unfilteredBuildConfigs, $scope.labelSuggestions);
52:          LabelFilter.setLabelSuggestions($scope.labelSuggestions);
62:          // If we aren't filtering by labels, show the build
63:          var labelSelector = LabelFilter.getLabelSelector();
64:          if (labelSelector.isEmpty()) {
77:          return labelSelector.matches(build);
103:        LabelFilter.onActiveFiltersChanged(function(labelSelector) {
106:            $scope.buildConfigs = labelSelector.select($scope.unfilteredBuildConfigs);
============= ./scripts/controllers/configMap.js =================
21:    $scope.labelSuggestions = {};
============= ./scripts/controllers/configMaps.js =================
21:    $scope.labelSuggestions = {};
46:      LabelFilter.addLabelSuggestionsFromResources(configMaps, $scope.labelSuggestions);
47:      LabelFilter.setLabelSuggestions($scope.labelSuggestions);
============= ./scripts/controllers/create/browseCategory.js =================
32:          $scope.subcategories = [{ id: '', label: '' }].concat(subcategories);
85:        title: parentCategory.label,
91:      title: $scope.category.label
============= ./scripts/controllers/create/createFromImage.js =================
122:              label: 'Manual',
125:              label: 'Automatic',
211:                        label: servicePort.targetPort + "/" + servicePort.protocol
380:          $scope.labels = _.extend(systemLabels, userLabels);
============= ./scripts/controllers/createPersistentVolumeClaim.js =================
79:            labels: {},
============= ./scripts/controllers/createRoute.js =================
28:    $scope.labels = [];
72:          var serviceLabels = _.get($scope, 'routing.to.service.metadata.labels', {});
73:          var existing = keyValueEditorUtils.mapEntries(keyValueEditorUtils.compactEntries($scope.labels));
75:          $scope.labels = _.map(updated, function(value, key) {
87:            var labels = keyValueEditorUtils.mapEntries(keyValueEditorUtils.compactEntries($scope.labels));
89:            var route = ApplicationGenerator.createRoute($scope.routing, serviceName, labels);
============= ./scripts/controllers/deployment.js =================
77:            label: 'Reload Environment Variables',
============= ./scripts/controllers/deploymentConfig.js =================
27:                        labelNameFilter) {
37:    $scope.labelSuggestions = {};
85:            label: 'Reload Environment Variables',
245:          LabelFilter.addLabelSuggestionsFromResources($scope.unfilteredDeployments, $scope.labelSuggestions);
246:          LabelFilter.setLabelSuggestions($scope.labelSuggestions);
253:              labelSelector: labelNameFilter('deploymentConfig')+'='+ $scope.deploymentConfigName
324:        LabelFilter.onActiveFiltersChanged(function(labelSelector) {
327:            $scope.deployments = labelSelector.select($scope.unfilteredDeployments);
============= ./scripts/controllers/deployments.js =================
26:    $scope.labelSuggestions = {};
45:      LabelFilter.addLabelSuggestionsFromResources($scope.unfilteredReplicaSets, $scope.labelSuggestions);
46:      LabelFilter.setLabelSuggestions($scope.labelSuggestions);
78:            LabelFilter.addLabelSuggestionsFromResources($scope.unfilteredReplicationControllers, $scope.labelSuggestions);
79:            LabelFilter.setLabelSuggestions($scope.labelSuggestions);
125:          LabelFilter.addLabelSuggestionsFromResources($scope.unfilteredDeploymentConfigs, $scope.labelSuggestions);
126:          LabelFilter.setLabelSuggestions($scope.labelSuggestions);
143:          LabelFilter.addLabelSuggestionsFromResources($scope.unfilteredDeployments, $scope.labelSuggestions);
144:          LabelFilter.setLabelSuggestions($scope.labelSuggestions);
195:        LabelFilter.onActiveFiltersChanged(function(labelSelector) {
198:            $scope.deploymentConfigs = labelSelector.select($scope.unfilteredDeploymentConfigs);
204:            $scope.deployments = labelSelector.select($scope.unfilteredDeployments);
205:            $scope.replicaSets = labelSelector.select($scope.unfilteredReplicaSets);
============= ./scripts/controllers/edit/autoscaler.js =================
58:    $scope.labels = [];
96:              labels: keyValueEditorUtils.mapEntries(keyValueEditorUtils.compactEntries($scope.labels))
130:          hpa.metadata.labels = keyValueEditorUtils.mapEntries(keyValueEditorUtils.compactEntries($scope.labels));
156:          $scope.labels = _.map(
157:                            _.get(resource, 'metadata.labels', {}),
============= ./scripts/controllers/edit/buildConfig.js =================
123:      label: "Command"
126:      label: "Shell Script"
129:      label: "Arguments to default image entry point"
132:      label: "Command with arguments"
135:      label: "Shell script with arguments"
============= ./scripts/controllers/images.js =================
17:    $scope.labelSuggestions = {};
35:          LabelFilter.addLabelSuggestionsFromResources($scope.unfilteredImageStreams, $scope.labelSuggestions);
36:          LabelFilter.setLabelSuggestions($scope.labelSuggestions);
82:        LabelFilter.onActiveFiltersChanged(function(labelSelector) {
85:            $scope.imageStreams = labelSelector.select($scope.unfilteredImageStreams);
============= ./scripts/controllers/labels.js =================
17:       if ($scope.labelKey && $scope.labelValue) {
18:         $scope.labels[$scope.labelKey] = $scope.labelValue;
19:         $scope.labelKey = "";
20:         $scope.labelValue = "";
26:       if ($scope.labels[key]) {
27:         delete $scope.labels[key];
============= ./scripts/controllers/monitoring.js =================
44:        label: "Deployments",
============= ./scripts/controllers/newOverview.js =================
64:  var label = $filter('label');
68:  var labelSuggestions = {};
126:    label: 'Name'
128:    id: 'label',
129:    label: 'Label'
135:    label: 'Application'
138:    label: 'Resource Type'
141:    label: 'Pipeline'
196:  // Group a collection of resources by app label. Returns a map where the key
197:  // is the app label value and the value is an array of objects, sorted by
259:  // Group each resource kind by app and update the list of app label values.
302:  // Updated on viewBy changes to include the app label when appropriate.
310:    case 'label':
321:    case 'label':
349:    filterFields = overview.viewBy === 'app' ? ['metadata.name', 'metadata.labels.app'] : ['metadata.name'];
354:      LabelFilter.setLabelSuggestions(labelSuggestions);
376:          label: 'Open Metrics URL',
380:          label: "Don't Show Me Again",
561:  // Update the label filter suggestions for a list of objects. This should
568:    LabelFilter.addLabelSuggestionsFromResources(objects, labelSuggestions);
570:      LabelFilter.setLabelSuggestions(labelSuggestions);
574:  // Update the label suggestions used when viewBy === 'pipeline'.
608:    if (label(pod, "openshift.io/deployer-pod-for.name")) {
619:    if (label(pod, "jenkins") === "slave") {
============= ./scripts/controllers/newfromtemplate.js =================
49:    $scope.labels = [];
330:          var userLabels = keyValueEditorUtils.mapEntries(keyValueEditorUtils.compactEntries($scope.labels));
332:          $scope.template.labels = _.extend(systemLabels, userLabels);
359:          // If the template defines its own app label, we don't need to add one at all
360:          if (_.get($scope.template, 'labels.app')) {
364:          // Otherwise check if an object in the template has an app label defined
365:          return !_.some($scope.template.objects, "metadata.labels.app");
368:        function setTemplateParams(labels) {
395:          $scope.systemLabels = _.map($scope.template.labels, function(value, key) {
============= ./scripts/controllers/otherResources.js =================
13:    $scope.labelSuggestions = {};
135:        $scope.labelSuggestions = {};
136:        LabelFilter.addLabelSuggestionsFromResources($scope.unfilteredResources, $scope.labelSuggestions);
137:        LabelFilter.setLabelSuggestions($scope.labelSuggestions);
154:    LabelFilter.onActiveFiltersChanged(function(labelSelector) {
157:        $scope.resources = labelSelector.select($scope.unfilteredResources);
============= ./scripts/controllers/overview.js =================
57:    var label = $filter('label');
273:      if (label(pod, "openshift.io/deployer-pod-for.name")) {
285:      if (label(pod, "jenkins") === "slave") {
333:    // Check if an app label is used more than once on a top-level service so we can disambiguate.
375:      }).sortByAll(['metadata.labels.app', 'metadata.name']).value();
378:        var app = _.get(service, 'metadata.labels.app');
484:            label: "View Quota"
487:            label: "Don't Show Me Again",
584:            label: 'Open Metrics URL',
588:            label: "Don't Show Me Again",
============= ./scripts/controllers/pods.js =================
19:    $scope.labelSuggestions = {};
41:          LabelFilter.addLabelSuggestionsFromResources($scope.unfilteredPods, $scope.labelSuggestions);
42:          LabelFilter.setLabelSuggestions($scope.labelSuggestions);
68:        LabelFilter.onActiveFiltersChanged(function(labelSelector) {
71:            $scope.pods = labelSelector.select($scope.unfilteredPods);
============= ./scripts/controllers/quota.js =================
21:    $scope.labelSuggestions = {};
48:    // then alphabetically by humanized label.
============= ./scripts/controllers/replicaSet.js =================
116:            label: 'Reload Environment Variables',
============= ./scripts/controllers/routes.js =================
15:    $scope.labelSuggestions = {};
33:          LabelFilter.addLabelSuggestionsFromResources($scope.unfilteredRoutes, $scope.labelSuggestions);
34:          LabelFilter.setLabelSuggestions($scope.labelSuggestions);
57:        LabelFilter.onActiveFiltersChanged(function(labelSelector) {
60:            $scope.routes = labelSelector.select($scope.unfilteredRoutes);
============= ./scripts/controllers/services.js =================
17:    $scope.labelSuggestions = {};
36:          LabelFilter.addLabelSuggestionsFromResources($scope.unfilteredServices, $scope.labelSuggestions);
37:          LabelFilter.setLabelSuggestions($scope.labelSuggestions);
57:        LabelFilter.onActiveFiltersChanged(function(labelSelector) {
60:            $scope.services = labelSelector.select($scope.unfilteredServices);
============= ./scripts/controllers/statefulSets.js =================
7:    $scope.labelSuggestions = {};
31:          LabelFilter.addLabelSuggestionsFromResources($scope.unfilteredStatefulSets, $scope.labelSuggestions);
32:          LabelFilter.setLabelSuggestions($scope.labelSuggestions);
55:        LabelFilter.onActiveFiltersChanged(function(labelSelector) {
58:            $scope.statefulSets = labelSelector.select($scope.unfilteredStatefulSets);
============= ./scripts/controllers/storage.js =================
15:    $scope.labelSuggestions = {};
33:          LabelFilter.addLabelSuggestionsFromResources($scope.unfilteredPVCs, $scope.labelSuggestions);
34:          LabelFilter.setLabelSuggestions($scope.labelSuggestions);
53:        LabelFilter.onActiveFiltersChanged(function(labelSelector) {
56:            $scope.pvcs = labelSelector.select($scope.unfilteredPVCs);
============= ./scripts/controllers/topology.js =================
21:                        labelFilter, // for getting k8s resource labels
22:                        LabelFilter, // for the label-selector widget in the navbar
69:    $scope.labelSuggestions = {};
131:          LabelFilter.addLabelSuggestionsFromResources($scope.unfilteredServices, $scope.labelSuggestions);
132:          LabelFilter.setLabelSuggestions($scope.labelSuggestions);
259:          // Initialize all the label selectors upfront
355:          if (labelFilter(pod, "openshift.io/deployer-pod-for.name")) {
373:            var getLabels = $parse('spec.template.metadata.labels');
409:            var getLabels = $parse('spec.template.metadata.labels');
548:        LabelFilter.onActiveFiltersChanged(function(labelSelector) {
551:            $scope.services = labelSelector.select($scope.unfilteredServices);
============= ./scripts/controllers/util/error.js =================
28:          label: "Check Server Connection",
============= ./scripts/directives/alerts.js =================
16:        //   label:    the link text
============= ./scripts/directives/buildCounts.js =================
13:    label: '@'
============= ./scripts/directives/buildTrendsChart.js =================
54:            // Prevent problems with the y-axis label getting cut off on updates.
60:              label: {
74:              label: {
122:              label: {
256:            // Call flush to work around a c3.js bug where the y-axis label
============= ./scripts/directives/catalog.js =================
44:            // Test to see if the keyword matches the category label.
46:              return regex.test(categoryItem.label);
56:            // Test to see if the keyword matches the category label.
58:              return regex.test(categoryItem.label);
============= ./scripts/directives/createSecret.js =================
26:            label: "Image Secret",
30:                label: "Image Registry Credentials"
34:                label: "Configuration File"
39:            label: "Source Secret",
43:                label: "Basic Authentication"
47:                label: "SSH Key"
============= ./scripts/directives/deployImage.js =================
34:        $scope.labels = [];
111:          var userLabels = keyValueEditorUtils.mapEntries(keyValueEditorUtils.compactEntries($scope.labels));
122:            labels: _.extend(systemLabels, userLabels),
============= ./scripts/directives/deploymentMetrics.js =================
63:          label: "Memory",
79:          label: "CPU",
90:          label: "Network (Sent)",
104:          label: "Network (Received)",
157:          var label;
159:            label = metric.compactDatasetLabel || metric.label;
161:            label = "Average Usage";
165:              values = [label],
393:                label: 'Retry',
============= ./scripts/directives/editProbe.js =================
18:          label: 'HTTP GET'
21:          label: 'Container Command'
24:          label: 'TCP Socket'
============= ./scripts/directives/editRequestLimit.js =================
9:        label: '@',
26:        // Create a unique ID for `label for` and `aria-describedby` attributes.
35:              label: humanizeUnit(unit, scope.type)
62:            label: "millicores"
65:            label: "cores"
72:            label: "MiB"
75:            label: "GiB"
78:            label: "MB"
81:            label: "GB"
============= ./scripts/directives/fromFile.js =================
298:              // Update only 'annotations' and 'labels' fields from the metadata field.
301:              updatedMetadata.labels = item.metadata.labels;
============= ./scripts/directives/keyValueEditor.js =================
71:            addRowLink: '@',                          // creates a link to "add row" and sets its text label
72:            addRowWithSelectorsLink: '@',             // creates a link to "add row with selectors" and sets its text label
============= ./scripts/directives/labels.js =================
4:  .directive('labels', function($location, $timeout, LabelFilter) {
8:        labels: '=',
19:      templateUrl: 'views/directives/labels.html',
36:  .directive('labelEditor', function() {
56:        labels: "=",
62:        // Optional help text to show with the label controls
65:      templateUrl: 'views/directives/label-editor.html',
76:          var labelValidator = {
91:              key: labelValidator,
92:              value: labelValidator
============= ./scripts/directives/metricsSummary.js =================
42:    label: 'Memory',
56:    label: "CPU",
71:    label: "Network",
============= ./scripts/directives/oscKeyValues.js =================
35:      label: function(modelValue, viewValue) {
96:   *   - label:  Validate as a label
219:          } else if (keyTitle === 'label') {
220:            return "label";
============= ./scripts/directives/oscPersistentVolumeClaim.js =================
28:          label: "MiB"
31:          label: "GiB"
34:          label: "TiB"
37:          label: "MB"
40:          label: "GB"
43:          label: "TB"
103:                 labels: {},
============= ./scripts/directives/oscRouting.js =================
61:          {value: '', label: 'None'},
62:          {value: 'Allow', label: 'Allow'},
63:          {value: 'Redirect', label: 'Redirect'}
107:                label: portMapping.port + " \u2192 " +
285:        // (optional). Changes the labels and help text.
============= ./scripts/directives/overview/serviceGroup.js =================
118:        $scope.$watch('service.metadata.labels.app', function(appName) {
============= ./scripts/directives/podDonut.js =================
59:            label: {
============= ./scripts/directives/podMetrics.js =================
44:            label: "Memory",
52:                label: "Memory",
60:            label: "CPU",
70:                label: "CPU",
78:            label: "Network",
86:                label: "Sent",
91:                label: "Received",
127:              label: {
335:              label: 'Retry',
355:              // set the label to the description if specified
356:              var label = metric.description || metric.name;
367:                label: label,
375:                    label: label,
============= ./scripts/directives/quotaUsageChart.js =================
50:            label: {
============= ./scripts/directives/routeServicePie.js =================
27:            label: {
============= ./scripts/directives/serviceGroupNotifications.js =================
50:                                    label: "Add Health Checks"
86:                label: 'View Deployment'
88:                label: 'Start New Deployment',
105:                label: 'View Log'
109:                label: 'View Events'
190:                label: "View Log"
202:                label: "Don't Show Me Again",
============= ./scripts/filters/resources.js =================
58:  .filter('buildConfigForBuild', function(annotationFilter, labelNameFilter, labelFilter) {
59:    var labelName = labelNameFilter('buildConfig');
61:      return annotationFilter(build, 'buildConfig') || labelFilter(build, labelName);
231:      var label = (host || routeHostFilter(route));
232:      if (!label) {
237:        label = '*.' + RoutesService.getSubdomain(route);
241:        return label;
245:        label += route.spec.path;
247:      return label;
============= ./scripts/services/applicationGenerator.js =================
94:        buildConfig: scope._generateBuildConfig(input, imageSpec, input.labels),
95:        deploymentConfig: scope._generateDeploymentConfig(input, imageSpec, ports, input.labels)
115:    scope.createRoute = function(routeOptions, serviceName, labels) {
117:        labels: labels || {},
132:          labels: input.labels,
196:      var templateLabels = angular.copy(input.labels);
220:          labels: input.labels,
231:              labels: templateLabels
266:          labels: input.labels,
334:          labels: input.labels,
383:          labels: input.labels,
409:          labels: input.labels,
============= ./scripts/services/apps.js =================
6:      return _.get(apiObject, 'metadata.labels.app', '');
9:    // Place empty app labels last.
============= ./scripts/services/builds.js =================
87:    // because we can't filter our watch on the annotation, only on the potentially truncated label
88:    // Assumes the builds were already pre-filtered based on the label.
============= ./scripts/services/deployments.js =================
55:          if (pod.metadata.labels[deployerPodForAnnotation] === deploymentName) {
197:    // filter will run the current label filter against any deployments whose DC is deleted, or any RCs
200:      var labelSelector = LabelFilter.getLabelSelector();
203:        if (!filter || deploymentConfigs && deploymentConfigs[deploymentConfigName] || labelSelector.matches(deployment)) {
============= ./scripts/services/images.js =================
81:    //   labels:       labels for each resource
115:            labels: config.labels
139:          labels: config.labels,
173:              labels: _.assign({
175:              }, config.labels),
206:            labels: config.labels,
============= ./scripts/services/labels.js =================
6:      return _.get(object, 'spec.template', { metadata: { labels: {} } });
10:      // Group objects using label selectors (e.g., pods by service
15:      // `opts.matchTemplate` will match object's `spec.template.metadata.labels`
16:      // instead of `metadata.labels`.
============= ./scripts/services/metricsCharts.js =================
24:    var labels = {
42:          label: "Last hour",
45:          label: "Last 4 hours",
48:          label: "Last day",
51:          label: "Last 3 days",
54:          label: "Last week",
78:              label: units,
109:	  names: labels
============= ./scripts/services/pods.js =================
40:          labels: {}
============= ./scripts/services/quota.js =================
94:            label: "View Quota",
135:            label: "View Quota",
214:                label: "View Quota",
============= ./scripts/services/resourceAlerts.js =================
41:              label: "View Log"
53:              label: "Don't Show Me Again",
84:            label: "View Quota"
87:            label: "Don't Show Me Again",
125:            label: 'View Deployment'
137:            label: 'View Log'
141:            label: 'View Events'
============= ./styles/_components.less =================
56:    .component-label {
58:      font-size: @component-label;
65:      .component-label-details {
94:          font-size: @component-label;
162:  .component-label {
163:    font-size: @component-label;
398://    .pod-status-label {
411://      .pod-status-label {
429://      .pod-status-label {
492:    .build-detail-label, .pod-detail-label, .deployment-detail-label {
============= ./styles/_core.less =================
299:        label {
379:  .usage-label {
382:    // Make sure the labels align with the bottom of the chart.
438:label.checkbox {
693:    .labels .form-group {
694:      // Show name/value fields like labels and env vars side by side at wide screen sizes.
704:.label-list li,
723:.label + .label {
792:label.required:before {
1097:  .labels {
1132:    .labels {
1186:.k8s-label {
1195:  .label-pair {
1198:  .label {
1199:    // prevent short label-key or label-value from being truncated less than 4 characters
1208:  .label-key {
1217:  a.label-key {
1223:  .label-value {
1231:  a.label-value {
1239:  .k8s-label {
1240:  // enable label to truncate
1242:    .label {
1246:    .label-pair {
============= ./styles/_data-toolbar.less =================
2:   - Includes customizations for label filter input and active filter
38:    .filter .navbar-filter-widget .label-filter .selectize-control .selectize-input {
43:    .label-filter {
45:        &.label-filter-key {
============= ./styles/_log.less =================
6:  label {
============= ./styles/_overview.less =================
40:.builds-label {
96:  .component-label {
97:    font-size: @component-label;
102:    .sublabel {
103:      font-size: (@component-label - 1);
113:    .label-filter,
117:    .label-filter,
136:    .label-filter-add.btn {
141:  .data-toolbar-label {
191:    > .component-label {
322:    .usage-label {
323:      // Make sure the labels align with the bottom of the chart.
388:  .usage-label {
670:      &.has-app-label .other-routes-msg {
671:        // Display the message below the route when there is an app label.
751:  .component-label {
753:    font-size: @component-label;
1033:          .traffic-label {
1047:    .traffic-label {
1056:      // Make sure the bar is wide enough to show the label for small percentages like 2%.
============= ./styles/_projects.less =================
129:  .projects-sort-label {
============= ./styles/_secrets.less =================
4:    .input-labels,
10:      .input-label,
37:    .input-labels,
39:      .input-label,
============= ./styles/_select.less =================
38:  .ui-select-choices-group-label:empty {
39:    // Prevent extra space above the first choice when the group label is empty.
============= ./styles/_sidebar.less =================
421:    .event-label {
============= ./styles/_tables.less =================
36:  .sort-label {
============= ./styles/_variables.less =================
37:@component-label: 11px;
60:@navbar-os-label-filter-bg: @navbar-os-project-menu-bg;
69:@navbar-project-label-color: @sidebar-os-color;
============= ./views/_alerts.html =================
24:        <a ng-if="!link.href" href="" ng-click="onClick(alert, link)" role="button" ng-attr-target="{{link.target}}">{{link.label}}</a>
25:        <a ng-if="link.href" href="{{link.href}}" ng-click="onClick(alert, link)" ng-attr-target="{{link.target}}">{{link.label}}</a>
============= ./views/_compute-resource.html =================
3:    <label ng-if="label">{{label}}</label>
6:        <label class="sr-only" ng-attr-for="{{id}}">Amount</label>
17:        <label class="sr-only" ng-attr-for="{{id}}-unit">Unit</label>
19:          <ui-select-match>{{$select.selected.label}}</ui-select-match>
21:            {{option.label}}
============= ./views/_edit-request-limit.html =================
18:      label="Request"
31:      label="{{requestCalculated ? undefined : 'Limit'}}"
============= ./views/_overview-deployment.html =================
31:      <div class="component-label">
75:      <div class="component-label">
============= ./views/_overview-monopod.html =================
13:      <span class="component-label">Pod: {{pod.metadata.name}}</span>
============= ./views/_pod-template.html =================
22:      <div class="component-label">Container: {{container.name}}</div>
============= ./views/_sidebar.html =================
8:          <span class="{{primaryItem.iconClass}}"></span> {{primaryItem.label}}
11:          <span class="{{primaryItem.iconClass}}"></span> {{primaryItem.label}} <span class="fa fa-angle-right"></span>
27:              <a ng-href="{{navURL(secondaryItem.href)}}">{{secondaryItem.label}}</a>
46:              <a ng-href="{{navURL(secondaryItem.href)}}">{{secondaryItem.label}}</a>
============= ./views/_templateopt.html =================
16:    <label ng-attr-for="{{paramID}}" ng-attr-title="{{parameter.name}}" ng-class="{required: parameter.required}">{{parameter.displayName || parameter.name}}</label>
76:      <label for="" class="key truncate" ng-class="{required: parameter.required}" ng-attr-title="{{ parameter.name }}">{{parameter.name}}</label>
============= ./views/_volume-claim-templates.html =================
5:    <div class="component-label">Storage claim: {{template.metadata.name}}</div>
============= ./views/add-config-volume.html =================
44:                          <label class="required">Source</label>
73:                          <label for="mount-path" class="required">Mount Path</label>
111:                            <label>
119:                            </label>
136:                                <label class="required">Key</label>
147:                                <label ng-attr-for="path-{{$id}}" class="required">Path</label>
194:                            <label class="sr-only required">Containers</label>
============= ./views/attach-pvc.html =================
47:                        <label for="persistentVolumeClaim" class="required">Storage</label>
86:                        <label for="mount-path">Mount Path</label>
116:                        <label for="sub-path">Subpath</label>
142:                        <label for="volume-name">Volume Name</label>
144:                          Volume name must conform to a DNS label
185:                          <label>
188:                          </label>
204:                          <label class="required">Containers</label>
============= ./views/browse/_replica-set-details.html =================
24:              <label>
26:              </label>
29:              <label>
31:              </label>
34:              <label>
36:              </label>
============= ./views/browse/build-config.html =================
69:            <labels labels="buildConfig.metadata.labels" clickable="true" kind="builds" title-kind="build configs" project-name="{{buildConfig.metadata.namespace}}" limit="3"></labels>
============= ./views/browse/build.html =================
82:              <labels ng-if="buildConfigName" labels="build.metadata.labels" clickable="true" kind="builds" title-kind="builds for build config {{buildConfigName}}" project-name="{{build.metadata.namespace}}" limit="3" navigate-url="project/{{build.metadata.namespace}}/browse/builds/{{buildConfigName}}"></labels>
83:              <labels ng-if="!buildConfigName" labels="build.metadata.labels" limit="3"></labels>
130:                        <label>Status:</label>
============= ./views/browse/config-map.html =================
45:            <labels labels="configMap.metadata.labels" clickable="true" kind="config-maps" title-kind="config maps" project-name="{{configMap.metadata.namespace}}" limit="3"></labels>
============= ./views/browse/config-maps.html =================
59:                        <em ng-if="(configMap.metadata.labels | hashSize) === 0">none</em>
60:                        <labels labels="configMap.metadata.labels" clickable="true" kind="Config Map" project-name="{{configMap.metadata.namespace}}" limit="3" filter-current-page="true"></labels>
============= ./views/browse/deployment-config.html =================
89:              <labels labels="deploymentConfig.metadata.labels" clickable="true" kind="deployments" title-kind="deployment configs" project-name="{{deploymentConfig.metadata.namespace}}" limit="3"></labels>
============= ./views/browse/deployment.html =================
69:            <labels labels="deployment.metadata.labels" clickable="true" kind="deployments" project-name="{{deployment.metadata.namespace}}" limit="3"></labels>
============= ./views/browse/imagestream.html =================
39:            <labels labels="imageStream.metadata.labels" clickable="true" kind="images" project-name="{{imageStream.metadata.namespace}}" limit="3"></labels>
============= ./views/browse/persistent-volume-claim.html =================
46:            <labels labels="pvc.metadata.labels" clickable="true" kind="storage" project-name="{{pvc.metadata.namespace}}" limit="3"></labels>
============= ./views/browse/pod.html =================
46:              <labels labels="pod.metadata.labels" clickable="true" kind="pods" project-name="{{pod.metadata.namespace}}" limit="3"></labels>
96:                        <label for="selectLogContainer">Container:</label>
155:                                <label for="selectLogContainer">Container:</label>
============= ./views/browse/replica-set.html =================
34:              <labels ng-if="deploymentConfigName" labels="replicaSet.metadata.labels" clickable="true" kind="deployments" title-kind="deployments for deployment config {{deploymentConfigName}}" project-name="{{replicaSet.metadata.namespace}}" limit="3" navigate-url="{{replicaSet | configURLForResource}}"></labels>
35:              <labels ng-if="!deploymentConfigName" labels="replicaSet.metadata.labels" clickable="true" kind="deployments" project-name="{{replicaSet.metadata.namespace}}" limit="3"></labels>
144:                        <label>Status:</label>
============= ./views/browse/route.html =================
46:            <labels labels="route.metadata.labels" clickable="true" kind="routes" project-name="{{route.metadata.namespace}}" limit="3"></labels>
============= ./views/browse/service.html =================
43:            <labels labels="service.metadata.labels" clickable="true" kind="services" project-name="{{service.metadata.namespace}}" limit="3"></labels>
============= ./views/browse/stateful-set.html =================
11:              <span class="label label-warning">Technology Preview</span>
52:            <labels
53:              labels="statefulSet.metadata.labels"
58:              limit="3"></labels>
============= ./views/browse/stateful-sets.html =================
11:              <span class="label label-warning">Technology Preview</span>
============= ./views/catalog/catalog.html =================
27:      <!-- Add a hidden label for screen readers. -->
29:        <label for="search" class="sr-only">Filter by name or description</label>
58:      <h2 class="h3" ng-if="category.label">{{category.label}}</h2>
59:      <div class="row tile-row" ng-class="{ 'mar-top-xl': !category.label || category.items.length < 2 }">
69:                  {{item.label}}
73:                  {{item.label}}
104:          <span ng-bind-html="item.label | highlightKeywords : keywords"></span>
126:        Other {{parentCategory.label}}
============= ./views/catalog/category-content.html =================
7:    No images or templates are loaded for the category {{category.label}}.
22:      <!-- Add a hidden label for screen readers. -->
24:        <label for="search" class="sr-only">Filter by name or description</label>
============= ./views/command-line.html =================
25:                      <label class="cli-download-label">Download <code>oc</code>:</label>
============= ./views/create-route.html =================
30:                        <label-editor
31:                            labels="labels"
35:                        </label-editor>
============= ./views/create/category.html =================
15:                <h1>{{category.label}}</h1>
============= ./views/create/fromimage.html =================
31:                             <label for="appname" class="required">Name</label>
79:                                <label for="sourceUrl" class="required">Git Repository URL</label>
115:                                <label for="gitref">Git Reference</label>
134:                            <label for="contextdir">Context Dir</label>
174:                                <label>
177:                                </label>
196:                                <label>
205:                                </label>
208:                                <label>
216:                                </label>
219:                                <label>
222:                                </label>
251:                                  <label>
254:                                  </label>
257:                                <label>
260:                                </label>
310:                                <label for="scale-type">Strategy</label>
312:                                  <ui-select-match>{{$select.selected.label}}</ui-select-match>
314:                                    {{option.label}}
331:                                <label class="number">Replicas</label>
400:                            <label-editor
401:                                labels="userDefinedLabels"
402:                                system-labels="systemLabels"
405:                                help-text="Each label is applied to each created resource.">
406:                            </label-editor>
416:                            <!-- unable to use form.valid.  need to fix validators in labels and key values directive -->
============= ./views/directives/_edit-command.html =================
36:    <label class="sr-only" ng-attr-for="{{id}}-add-arg">
39:    </label>
============= ./views/directives/_edit-probe.html =================
3:    <label class="required">Type</label>
5:      <ui-select-match>{{$select.selected.label}}</ui-select-match>
6:      <ui-select-choices repeat="item.id as item in types">{{item.label}}</ui-select-choices>
12:        <label>
19:        </label>
23:      <label ng-attr-for="{{id}}-path">Path</label>
37:      <label class="required">Port</label>
48:    <label class="required">Command</label>
53:      <label class="required">Port</label>
64:    <label ng-attr-for="{{id}}-initial-delay">Initial Delay</label>
95:    <label ng-attr-for="{{id}}-timeout">Timeout</label>
============= ./views/directives/_pod-content.html =================
2:  <strong class="pod-status-label">{{pod.status.phase}}</strong>
============= ./views/directives/_project-filter.html =================
3:    <label ng-if="!renderOptions || !renderOptions.hideFilterWidget" class="control-label sr-only">Filter by labels</label>
============= ./views/directives/create-secret.html =================
5:    <label>Secret Type</label>
16:      <label for="secretName" class="required">Secret Name</label>
52:      <label for="authentificationType">Authentication Type</label>
54:        <ui-select-match>{{$select.selected.label}}</ui-select-match>
56:          {{type.label}}
63:        <label for="username">Username</label>
81:        <label ng-class="{ required: !add.cacert && !add.gitconfig }" for="passwordToken">Password or Token</label>
104:          <label>
107:          </label>
111:        <label class="required" for="cacert">CA Certificate File</label>
133:        <label for="privateKey" class="required">SSH Private Key</label>
155:          <label>
158:          </label>
163:        <label class="required" for="gitconfig">Git Configuration File</label>
183:        <label for="dockerServer" class="required">Image Registry Server Address</label>
203:        <label for="dockerUsername" class="required">Username</label>
223:        <label for="dockerPassword" class="required">Password</label>
242:        <label for="dockerEmail" class="required">Email</label>
267:        <label for="dockerConfig" class="required">Configuration File</label>
296:          <label>
300:          </label>
306:          <label class="required">Service Account</label>
============= ./views/directives/deploy-image.html =================
8:        <label>
11:        </label>
26:        <label>
29:        </label>
32:        <label for="imageName" class="sr-only">Image name or pull spec</label>
113:         <label for="name" class="required">Name</label>
177:        <label-editor
178:            labels="labels"
179:            system-labels="systemLabels"
182:            help-text="Each label is applied to each created resource.">
183:        </label-editor>
============= ./views/directives/deployment-metrics.html =================
7:      <label for="selectContainer">Container:</label>
21:      <label for="timeRange">Time Range:</label>
24:          <ui-select-match>{{$select.selected.label}}</ui-select-match>
26:            {{range.label}}
56:    <h2 class="metric-label">
57:      {{metric.label}}
============= ./views/directives/edit-config-map.html =================
5:      <label for="config-map-name" class="required">Name</label>
51:        <label ng-attr-for="key-{{$id}}" class="required">Key</label>
99:        <label ng-attr-for="name-{{$id}}">Value</label>
============= ./views/directives/edit-lifecycle-hook.html =================
12:        <label for="actionType" class="required">Lifecycle Action</label><br/>
13:        <label class="radio-inline">
21:        </label>
22:        <label class="radio-inline">
30:        </label>
40:          <label class="required">Container Name</label>
50:          <label class="required">Command</label>
55:          <label>Environment Variables</label>
69:        <label>Volumes</label>
86:              <label class="required">Container Name</label>
98:              <label class="required">Tag As</label>
114:        <label class="required picker-label">Failure Policy</label>
============= ./views/directives/events-badge.html =================
1:<a ng-href="project/{{projectContext.projectName}}/browse/events" class="events-badge visible-xs"><span class="event-label">Events</span><span ng-if="warningCount" class="mar-left-md"><span class="pficon pficon-warning-triangle-o mar-right-sm" aria-hidden="true"></span><span class="sr-only">Warning</span><span class="event-count">{{warningCount}}</span></span><span ng-if="normalCount" class="mar-left-sm"><span class="pficon pficon-info mar-right-sm" aria-hidden="true"></span><span class="sr-only">Normal</span><span class="event-count">{{normalCount}}</span></span></a>
2:<a href="" ng-click="expandSidebar()" ng-if="sidebarCollapsed" class="events-badge hidden-xs"><span class="events-sidebar-expand fa fa-arrow-circle-o-left mar-right-md"><span class="sr-only">Expand event sidebar</span></span><span class="event-label">Events</span><span ng-if="warningCount" class="mar-left-md"><span class="pficon pficon-warning-triangle-o mar-right-sm" aria-hidden="true"></span><span class="sr-only">Warning</span><span class="event-count">{{warningCount}}</span></span><span ng-if="normalCount" class="mar-left-sm"><span class="pficon pficon-info mar-right-sm" aria-hidden="true"></span><span class="sr-only">Normal</span><span class="event-count">{{normalCount}}</span></span></a>
============= ./views/directives/events.html =================
9:          <label for="events-filter" class="sr-only">Filter</label>
31:      <span class="sort-label">Sort by</span>
============= ./views/directives/header/_navbar-utility.html =================
14:      class="uib-dropdown-menu" aria-labelledby="help-dropdown"
28:      aria-labelledby="user-dropdown"
============= ./views/directives/hpa.html =================
14:        label="Remove"
============= ./views/directives/istag-select.html =================
5:        <label class="sr-only">Namespace</label>
16:        <label class="sr-only">Image Stream</label>
27:        <label class="sr-only">Tag</label>
============= ./views/directives/key-value-editor.html =================
31:        <label for="uniqueForKey(unique, $index)" class="sr-only">{{keyPlaceholder}}</label>
81:        <label for="uniqueForValue(unique, $index)" class="sr-only">{{valuePlaceholder}}</label>
199:          aria-label="Move row"
206:          aria-label="Delete row"
219:        aria-label="Add row"
229:          aria-label="Add row"
============= ./views/directives/label-editor.html =================
10:      The following labels are being added automatically. If you want to override them, you can do so below.
21:  <div ng-if="helpText && ((labels | hashSize) !== 0 || $parent.expand)" class="help-block">
27:      entries="labels"
34:      key-validator-error-tooltip="A valid object label has the form [domain/]name where a name is an alphanumeric (a-z, and 0-9) string,
37:      value-validator-error-tooltip="A valid label value is an alphanumeric (a-z, and 0-9) string, with a maximum length of 63 characters, with the '-'
44:      entries="labels"
============= ./views/directives/labels.html =================
1:<div row wrap ng-if="(labels | hashSize) > 0">
2:  <span row nowrap ng-repeat="(labelKey, labelValue) in labels" class="k8s-label" ng-if="!limit || $index < limit">
3:    <span row class="label-pair" ng-if="clickable">
4:      <a href="" class="label-key label truncate" ng-click="filterAndNavigate(labelKey)" ng-attr-title="All {{titleKind || kind}} with the label '{{labelKey}}' (any value)">{{labelKey}}</a><a href="" class="label-value label truncate" ng-click="filterAndNavigate(labelKey, labelValue)" ng-attr-title="All {{titleKind || kind}} with the label '{{labelKey}}={{labelValue}}'">{{labelValue}}<span ng-if="labelValue === ''"><em>&lt;empty&gt;</em></span></a>
6:    <span row class="label-pair" ng-if="!clickable">
7:      <span class="label-key label truncate">{{labelKey}}</span><span class="label-value label truncate">{{labelValue}}</span>
10:  <a href="" class="small" ng-click="limit = null" ng-show="limit && limit < (labels | hashSize)" style="padding-left: 5px; vertical-align: middle;">More labels...</a>
============= ./views/directives/metrics-compact.html =================
13:      <div class="usage-label">
15:        {{metric.compactLabel || metric.label}}
============= ./views/directives/osc-autoscaling.html =================
4:    <label for="hpa-name" class="required">Autoscaler Name</label>
43:    <label>Min Pods</label>
71:    <label class="required">Max Pods</label>
104:    <label>
109:    </label>
============= ./views/directives/osc-key-values.html =================
5:<div class="labels">
6:    <div class="form-inline labels-edit" ng-show="editable">
7:      <ng-form class="edit-label" name="form" novalidate>
206:      <ul ng-if="(entries | hashSize) !== 0" class="labels-readonly label-list list-unstyled">
============= ./views/directives/osc-persistent-volume-claim.html =================
5:      <label>Storage Class</label>
53:      <label for="claim-name" class="required">Name</label>
92:      <label class="required">Access Mode</label><br/>
93:      <label class="radio-inline">
96:      </label>
97:      <label class="radio-inline">
100:      </label>
101:      <label class="radio-inline">
104:      </label>
112:      <label>Size</label>
120:        <label class="required">
131:        </label>
134:            <label for="claim-amount" class="sr-only">Amount</label>
145:            <label class="sr-only" >Unit</label>
147:              <ui-select-match>{{$select.selected.label}}</ui-select-match>
149:                {{option.label}}
192:      <a href="" ng-click="showAdvancedOptions = true">label selectors</a>
198:        <label>Label Selector</label>
200:          Enter a label and value to use for your storage.
202:            <a ng-href="{{'selector_label' | helpLink}}" target="_blank">Learn More&nbsp;<i class="fa fa-external-link" aria-hidden="true"></i></a>
207:          key-placeholder="label"
210:          key-validator-error-tooltip="A valid label name is an alphanumeric (a-z and 0-9) string beginning with a letter that may contain underscores and dashes."
============= ./views/directives/osc-routing-service.html =================
4:      <label for="{{id}}-service-select" class="required">
6:      </label>
35:      <label for="{{id}}-service-weight" class="required">Weight</label>
============= ./views/directives/osc-routing.html =================
6:      <label for="route-name" class="required">Name</label>
41:      <label for="host">Hostname</label>
88:      <label for="path">Path</label>
131:      <label for="routeTargetPort">Target Port</label>
133:        <ui-select-match>{{$select.selected.label}}</ui-select-match>
135:          {{portOption.label}}
151:          <label>
154:          </label>
196:        <label class="sr-only" for="weight-slider">Service {{route.to.service.metadata.name}} Weight</label>
223:      <label>
226:      </label>
235:        <label for="tlsTermination">TLS Termination</label>
249:        <label for="insecureTraffic">Insecure Traffic</label>
257:          <ui-select-match>{{$select.selected.label}}</ui-select-match>
261:            {{option.label}}
296:            <label>Certificate</label>
306:            <label>Private Key</label>
316:            <label>CA Certificate</label>
326:            <label>Destination CA Certificate</label>
============= ./views/directives/osc-secrets.html =================
4:      <div class="input-labels">
5:        <label class="input-label">
7:        </label>
============= ./views/directives/osc-source-secrets.html =================
6:        <div class="input-labels">
7:          <label class="input-label">
9:          </label>
10:          <label class="input-label">
12:          </label>
54:        <div class="input-labels">
55:          <label class="input-label">
57:          </label>
58:          <label class="input-label">
60:          </label>
============= ./views/directives/pause-rollouts-checkbox.html =================
3:    <label>
10:    </label>
============= ./views/directives/pod-metrics.html =================
8:      <label for="selectContainer">Container:</label>
22:      <label for="timeRange">Time Range:</label>
25:          <ui-select-match>{{$select.selected.label}}</ui-select-match>
27:            {{range.label}}
57:      {{metric.label}}
============= ./views/directives/select-containers.html =================
3:    <label class="truncate">
13:    </label>
============= ./views/edit/autoscaler.html =================
58:                    <label-editor
59:                      labels="labels"
61:                      can-toggle="false"></label-editor>
============= ./views/edit/build-config.html =================
32:                                <label for="sourceUrl" class="required">Git Repository URL</label>
64:                                <label for="sourceRef">Git Reference</label>
84:                              <label for="sourceContextDir">Context Dir</label>
114:                          <label for="buildFrom">Dockerfile</label>
126:                            <label for="dockerfilePath">Dockerfile Path</label>
142:                            <label>
151:                            </label>
159:                              <label>Image Source From</label>
174:                              <label for="imageSourceImage">Image Stream Image</label>
189:                              <label for="imageSourceLink">Docker Image Repository</label>
205:                              <label for="buildFrom">Source and Destination Paths<span class="help action-inline">
209:                              </span></label>
222:                            <label for="imageSourceFrom">Image Source From<span class="help action-inline">
227:                            </span></label>
242:                        <label for="jenkinsfile-type">Jenkinsfile Type</label>
256:                        <label for="jenkinsfilePath">Jenkinsfile Source Path</label>
273:                        <label>Jenkinsfile</label>
306:                            <label for="buildFrom">Build From</label>
322:                            <label for="FromTypeLink">Docker Image Repository</label>
336:                            <label for="FromTypeImage">Image Stream Image</label>
368:                            <label>
371:                            </label>
377:                            <label for="buildFrom">Push To</label>
391:                            <label for="pushToLink">Docker Image Repository</label>
471:                              <label>
474:                              </label>
480:                                <label>
490:                                </label>
527:                        <label class="sr-only">Run policy type</label>
555:                          <label>
558:                          </label>
566:                            <label>Hook Types</label>
570:                              <ui-select-match>{{$select.selected.label}}</ui-select-match>
572:                                {{type.label}}
579:                              <label class="required">Script</label>
596:                              <label class="required">Command</label>
606:                              <label class="required">Arguments</label>
============= ./views/edit/deployment-config.html =================
28:                            <label class="picker-label">Strategy Type</label>
55:                              <label for="imageName" class="required">Image Name</label>
72:                              <label>Command</label>
76:                              <label>Environment Variables</label>
88:                              <label for="strategyTimeout">Timeout</label>
123:                                  <label for="updatePeriod">Update Period</label>
155:                                  <label for="interval">Interval</label>
188:                                <label for="maxUnavailable">Maximum Number of Unavailable Pods</label>
211:                                <label for="maxSurge">Maximum Number of Surge Pods</label>
293:                              <label>
296:                              </label>
299:                              <label class="required">Image Stream Tag</label>
303:                                <label>
306:                                </label>
311:                              <label for="imageName" class="required">Image Name</label>
325:                            <label>
328:                            </label>
============= ./views/edit/jenkinsfile-examples.html =================
23:    Checkout source code and run shell commands on a node labelled <var>maven:</var>
============= ./views/edit/project.html =================
19:                    <label for="displayName">Display Name</label>
29:                    <label for="description">Description</label>
============= ./views/membership.html =================
171:                      <label
175:                      </label>
287:                        <label>
289:                          Show hidden roles</label>&nbsp;<a href=""
============= ./views/modals/debug-terminal.html =================
36:        <label>Original Command:</label>
============= ./views/modals/link-service.html =================
9:      <label class="sr-only" for="childService">Service:</label>
============= ./views/modals/process-template.html =================
7:      <label>
10:      </label>
14:      <label>
17:      </label>
============= ./views/monitoring.html =================
18:                <ui-select-match placeholder="Choose a resource">{{$select.selected.label ? $select.selected.label : ($select.selected.kind | humanizeKind : true)}}</ui-select-match>
20:                  <div ng-bind-html="(kind.label ? kind.label : (kind.kind | humanizeKind : true)) | highlight: $select.search"></div>
28:                      <label for="name-filter" class="sr-only">Filter by name</label>
50:                <label>
52:                </label>
123:                          <label for="selectLogContainer">Container:</label>
============= ./views/new-overview.html =================
37:            <div class="data-toolbar" role="toolbar" aria-label="Filter Toolbar">
45:                  <ui-select-match>{{$select.selected.label}}</ui-select-match>
47:                    {{option.label}}
50:                <div ng-if="overview.filterBy === 'label'" class="label-filter">
51:                  <!-- FIXME: This disables the add button but not the label filter selectize controlers. -->
60:                        <label for="name-filter" class="sr-only">Filter by name</label>
85:                <span class="data-toolbar-label">List by</span>
87:                  <ui-select-match>{{$select.selected.label}}</ui-select-match>
89:                    {{option.label}}
120:                    <div class="component-label">Application</div>
288:                    <div class="component-label">Pipeline</div>
============= ./views/newfromtemplate.html =================
47:                          <label-editor
48:                              labels="labels"
49:                              system-labels="systemLabels"
52:                              help-text="Each label is applied to each created resource.">
53:                          </label-editor>
============= ./views/other-resources.html =================
54:                      <em ng-if="(resource.metadata.labels | hashSize) === 0">none</em>
55:                      <labels labels="resource.metadata.labels" clickable="true" kind="{{kindSelector.selected.kind | kindToResource : true }}" project-name="{{resource.metadata.namespace}}" limit="3" filter-current-page="true"></labels></td>
62:                        <ul class="uib-dropdown-menu dropdown-menu-right" aria-labelledby="{{resource.metadata.name}}_actions">
============= ./views/overview.html =================
39:                   ng-if="service.metadata.labels.app || routesByService[service.metadata.name].length || childServicesByParent[service.metadata.name].length">
46:                    ng-if="!service.metadata.labels.app && !routesByService[service.metadata.name].length && !childServicesByParent[service.metadata.name].length"
============= ./views/overview/_build-counts.html =================
2:  <span ng-if="buildCounts.label" class="builds-label">
3:    {{buildCounts.label}}
============= ./views/overview/_list-row-content.html =================
3:    <div class="component-label">
23:          label="Pipelines"
28:        <build-counts builds="row.recentBuilds" label="Builds"></build-counts>
============= ./views/overview/_list-row-expanded.html =================
12:            <!-- TODO: markup semantics suggest div.component-label in <pod-template> should be an h4,
101:            <!-- TODO: markup semantics suggest div.component-label in <pod-template> should be an h4,
============= ./views/overview/_metrics-summary.html =================
11:    <div class="usage-label">
13:      {{metric.label}}
============= ./views/overview/_networking.html =================
5:      <div class="component-label">
7:        <span class="sublabel">Internal Traffic</span>
27:      <div class="component-label">
29:        <span class="sublabel">External Traffic</span>
============= ./views/overview/_service-group.html =================
3:       ng-if="service.metadata.labels.app || displayRoute"
5:       ng-class="{ 'has-app-label': appName }">
============= ./views/overview/_traffic-percent.html =================
9:    <span class="traffic-label">Traffic</span>
============= ./views/project.html =================
23:                  <label class="btn btn-default" ng-model="$parent.overviewMode" uib-btn-radio="'tiles'" title="Tile View">
25:                  </label>
26:                  <label class="btn btn-default" ng-model="$parent.overviewMode" uib-btn-radio="'topology'" title="Topology View">
28:                  </label>
97:                        <div ng-attr-title="{{service | serviceImplicitDNSName}}" class="component-label">
============= ./views/projects.html =================
36:                                  <label for="search-projects" class="sr-only">Search</label>
55:                            <span class="projects-sort-label">Sort by</span>
============= ./views/util/error.html =================
13:          <a ng-repeat-start="link in errorLinks" ng-href="{{link.href}}" target="{{link.target || '_blank'}}">{{link.label}}</a>
============= ./file-sys.result =================
61:./scripts/controllers/labels.js
134:./scripts/directives/labels.js
217:./scripts/services/labels.js
411:./views/directives/label-editor.html
412:./views/directives/labels.html
