============= ./scripts/controllers/build.js =================
87:          message: "构建已被删除."
96:        message: "构建细节无法加载.",
105:          message: "构建配置 " + $scope.buildConfigName + " 已被删除."
144:                message: "取消构建 " + build.metadata.name + " of " + $scope.buildConfigName + "."
150:                message: "出现错误，取消构建.",
190:                  message: "构建 " + name + " 正在被" + build.metadata.name + "重构建.",
196:                  message: "构建过程出现错误.",
============= ./scripts/controllers/buildConfig.js =================
78:          // TODO:  de-duplicate success and error messages.
79:          // as it stands, multiple messages appear based on how edit
84:            message: $scope.buildConfigName + " 被更新."
90:            message: $scope.buildConfigName + " 不被更新.",
135:          message: "构建的配置信息已被删除."
144:          message: "构建的配置已经被更新在界面中。保存你的修改可能会有冲突或者数据的丢失.",
177:              message: e.status === 404 ? "构建的配置信息无法找到, 可能已被删除." : "构建的配置详细信息不能被加载.",
253:                message: "构建 " + build.metadata.name + " 已经开始."
259:                message: "构建起始出现错误.",
============= ./scripts/controllers/configMap.js =================
42:          message: "配置图已被删除."
============= ./scripts/controllers/create/createFromImage.js =================
73:        message: errorMessage,
294:                            message: "不能创建 " + humanize(failure.object.kind).toLowerCase() + " \"" + failure.object.metadata.name + "\". ",
295:                            details: failure.data.message
303:                            message: "创建 " + humanize(success.kind).toLowerCase() + " \"" + success.metadata.name + "\" 成功. "
308:                      alerts.push({ type: "success", message: "All resources for application " + $scope.name +
320:                    message: "创建应用过程出现错误.",
340:                  message: "应用配置信息出现问题.",
============= ./scripts/controllers/createConfigMap.js =================
71:                  message: "创建配置图时出现错误.",
============= ./scripts/controllers/createFromURL.js =================
24:        message: "请求的镜像流 \"" + imageStream + "\" 不能被加载."
31:        message: "请求的镜像流标签 \"" + imageTag + "\" 不能被加载."
38:        message: "应用名称 \"" + name + "\" 校验未通过.  应用名字是由字母数字(a-z和数字0-9)组成的一个混合的长度为24位的字符串，且字符创中的第一个字符是(a-z)中的一个，且"-"允许在这个字符串中除了第一个和最后一个的任何位置
."
45:        message: "命名空间 \"" + namespace + "\" 的资源不允许使用."
52:        message: "模版 \"" + template + "\" 不能被加载."
59:        message: "镜像或模版正在被访问."
66:        message: "镜像流和模版不匹配."
77:          message: "参数模版JSON格式不正确. " + e
============= ./scripts/controllers/createPersistentVolumeClaim.js =================
66:                    message: "存储声明被请求时出现错误.",
============= ./scripts/controllers/createRoute.js =================
110:                  message: "创建路由时出现错误.",
============= ./scripts/controllers/deployment.js =================
74:        message: "部署的环境变量已经被升级到界面中。保存你的修改可能会造成冲突或者引起数据的丢失.",
93:        message: errorMessage,
133:                // TODO:  de-duplicate success and error messages.
134:                // as it stands, multiple messages appear based on how edit
138:                  message: $routeParams.deployment + " 已更新."
144:                  message: $routeParams.deployment + " 没有被更新.",
166:                  message: "部署已被删除."
209:              message: e.status === 404 ? "没有发现调度, 可能已被删除." : "部署详细信息不能被加载.",
277:              message: "衡量部署时出现错误.",
296:                message: "" + (paused ? "pausing" : "resuming") + " 部署时出现错误.",
319:            message: "确定删除卷标 " + volume.name + "?",
329:              message: "删除卷标时出现错误.",
============= ./scripts/controllers/deploymentConfig.js =================
82:        message: "部署的环境变量配置已经在后台更新，保存您的变更可能会引起冲突或者数据丢失.",
101:        message: errorMessage,
143:                // TODO:  de-duplicate success and error messages.
144:                // as it stands, multiple messages appear based on how edit
149:                  message: $scope.deploymentConfigName + " 已经被更新."
155:                  message: $scope.deploymentConfigName + " 没有被更新.",
173:                  message: "部署配置已被删除."
198:              message: e.status === 404 ? "未发现部署配置, 可能已被删除." : "T部署配置详细信息未被加载.",
363:              message: "衡量部署配置时出现错误.",
380:                message: " " + (paused ? "pausing" : "resuming") + " 部署配置时出现错误.",
412:            message: "确定删除卷标 " + volume.name + "?",
422:              message: "删除卷标时出现错误.",
============= ./scripts/controllers/edit/autoscaler.js =================
72:        message: errorMessage,
============= ./scripts/controllers/edit/buildConfig.js =================
317:                  message: "自从你编辑时构建配置信息已被更改，你需要复制你更改的内容并且再次编辑它."
323:                  message: "构建配置已经被删除."
336:              message: "构建配置详细信息不能被加载.",
570:              message: "构建配置 " + $scope.updatedBuildConfig.metadata.name + " 更新成功."
580:            message: "构建配置 " + $scope.updatedBuildConfig.metadata.name + "构建时出现错误",
============= ./scripts/controllers/edit/configMap.js =================
60:              message: "配置图详情不能被加载.",
77:                  message: "配置图更新时出现错误.",
============= ./scripts/controllers/edit/deploymentConfig.js =================
58:        message: errorMessage,
194:                  message: "自从你编辑时部署配置信息已被更改，你需要复制你更改的内容并且再次编辑它."
200:                  message: "部署配置已经被删除."
213:              message: "部署配置详细信息不能被加载.",
238:              message: "你的一些现有的 " + $scope.originalStrategy.toLowerCase() + " 策略参数可用于 " + $scope.strategyData.type.toLowerCase() + " 策略。确定保存参数?",
358:              message: "部属配置 " + $scope.updatedDeploymentConfig.metadata.name + " 更新成功."
368:            message: "更新部属配置 " + $scope.updatedDeploymentConfig.metadata.name + "出错.",
============= ./scripts/controllers/edit/healthChecks.js =================
63:        message: errorMessage,
119:                      message: displayName + " 已经被更新."
============= ./scripts/controllers/edit/project.js =================
75:                  message: "更新项目时出现错误",
============= ./scripts/controllers/edit/route.js =================
169:                    message: "路由 " + $scope.routeName + "已更新成功."
177:                  message: "更新 " + $scope.routeName + "路由时出现错误.",
============= ./scripts/controllers/edit/yaml.js =================
125:                  message: '不能改变资源种类 (original: ' + resource.kind + ', modified: ' + (updatedResource.kind || '<unspecified>') + ').'
133:                $scope.error = { message: APIService.invalidObjectKindOrVersion(updatedResource) };
137:                $scope.error = { message: '不能改变路由组 (original: ' + (groupVersion.group || '<none>') + ', modified: ' + (updatedGroupVersion.group || '<none>') + ').' };
141:                $scope.error = { message: APIService.unsupportedObjectKindOrVersion(updatedResource) };
156:                      message: "没有修改被用于 " + humanizeKind($routeParams.kind) + " " + $routeParams.name + ".",
167:                      message: humanizeKind($routeParams.kind, true) + " " + $routeParams.name + " 更新成功."
176:                    message: $filter('getErrorDetails')(result)
============= ./scripts/controllers/image.js =================
56:            message: "镜像详情不能被加载.",
74:          message: "镜像流中没有找到镜像标签.",
88:          message: "镜像流已经被删除."
108:              message: "镜像流详情不能被加载.",
============= ./scripts/controllers/imagestream.js =================
47:                  message: "镜像流已经被删除."
59:              message: "镜像流详情不能被加载.",
============= ./scripts/controllers/membership.js =================
29:      var messages = {
61:          message: msg,
119:            showAlert('rolebindingCreate', 'success', messages.update.subject.success({
125:            showAlert('rolebindingCreateFail', 'error', messages.update.subject.error({
128:            }), messages.errorReason({httpErr: $filter('getErrorDetails')(err)}));
138:            showAlert('rolebindingUpdate', 'success', messages.update.subject.success({
144:            showAlert('rolebindingUpdateFail', 'error', messages.update.subject.error({
147:            }), messages.errorReason({httpErr: $filter('getErrorDetails')(err)}));
210:          detailsMarkup: messages.remove.areYouSure.html.subject({
220:          modalScope.detailsMarkup = messages.remove.areYouSure.html.self({
225:            showAlert('currentUserLastRole', 'error', messages.notice.yourLastRole({roleName: roleName}), null, modalScope);
229:          showAlert('editingServiceAccountRole', 'error', messages.warning.serviceAccount(), null, modalScope);
311:                      showAlert('rolebindingUpdate', 'success', messages.remove.success({
317:                    showAlert('rolebindingUpdateFail', 'error', messages.remove.error({
320:                    }),  messages.errorReason({
342:                showAlert('rolebindingUpdate', 'info', messages.update.subject.exists({
============= ./scripts/controllers/modals/confirmModal.js =================
16:    // heading: modalConfig.message
============= ./scripts/controllers/newOverview.js =================
172:  // Show the "Get Started" message if the project is empty.
373:        message: '获取权值出现错误.',
1058:          message: " " + buildType + "启动时出错.",
============= ./scripts/controllers/newfromtemplate.js =================
90:          message: "参数模版不是正确的JSON格式. " + e
262:                        message: "不能创建 " + humanize(failure.object.kind).toLowerCase() + " \"" + failure.object.metadata.name + "\". ",
263:                        details: failure.data.message
271:                        message: "创建 " + humanize(success.kind).toLowerCase() + " \"" + success.metadata.name + "\" 成功. "
276:                  alerts.push({ type: "success", message: "所有项目在模版 " + $scope.templateDisplayName() +
296:                  message: "我们检测到您的应用具有潜在的问题. 请确实您是否仍然要创建这个应用.",
336:              // Cache template parameters and message so they can be displayed in the nexSteps page
337:              ProcessedTemplateService.setTemplateData(config.parameters, $scope.template.parameters, config.message);
345:              if (result.data && result.data.message) {
346:                details = result.data.message;
351:                  message: "模版处理出现错误.",
============= ./scripts/controllers/overview.js =================
454:    // Show the "Get Started" message if the project is empty.
481:          message: '已经达到配额限制.',
581:          message: '获取权值出现错误.',
============= ./scripts/controllers/persistentVolumeClaim.js =================
35:          message: "持久卷声明已经被删除."
53:            message: "持久的卷声明详情不能被加载.",
============= ./scripts/controllers/pipelines.js =================
133:              // success, don't show a message since the build will appear directly below on the page
139:                  message: "构建启动的时候出现错误.",
============= ./scripts/controllers/pod.js =================
46:      message: "这个终端已经断开连接。如果你连接,你的终端历史记录将丢失。"
249:          message: "这个Pod已经被删除."
281:              message: "pod详情不能被加载.",
326:                  message: "不能删除pod " + debugPod.metadata.name,
354:              message: "不能调试容器 " + containerName
404:                message: "不能调试容器 " + containerName,
============= ./scripts/controllers/projects.js =================
154:      // Check if there are detailed messages. If there are, show them instead of our default message.
156:        var messages = [];
158:          if (cause.message) { messages.push(cause.message); }
160:        if (messages.length > 0) {
161:          $scope.newProjectMessage = messages.join("\n");
============= ./scripts/controllers/replicaSet.js =================
111:        message: "这个环境变量属于" +
137:          message: $scope.replicaSet.metadata.name + " 已经被更新."
143:          message: $scope.replicaSet.metadata.name + " 没有更新.",
163:        message: errorMessage,
288:                message: "部署配置详情不能被加载.",
333:                  message: "部属配置副本已经被删除."
431:                  message: "这个 " + displayKind + " 已经被删除."
470:              message: "这个 " + displayKind + " 详情不能被加载.",
576:              message: "缩容出现错误.",
618:            message: "确定删除卷 " + volume.name + "?",
628:              message: "删除卷出现错误.",
============= ./scripts/controllers/route.js =================
49:          message: "路由已经被删除."
100:              message: "路由详情不能被加载.",
============= ./scripts/controllers/service.js =================
88:          message: "这个服务已经被删除."
107:              message: "这个服务详情已经被加载.",
============= ./scripts/controllers/setLimits.js =================
68:        message: errorMessage,
109:                      message: displayName + " 已更新."
============= ./scripts/controllers/topology.js =================
522:        // Show the "Get Started" message if the project is empty.
============= ./scripts/directives/alerts.js =================
10:        //   message:  the message to display
============= ./scripts/directives/createSecret.js =================
170:                message: "机密 " + secret.metadata.name + "已被创建并且链接到服务账户 " + sa.metadata.name + "."
179:                message: "机密链接到服务账户 " + $scope.newSecret.pickedServiceAccountToLink + "时出现错误.",
208:                message: "机密 " + newSecret.metadata.name + " was 创建."
229:              message: "创建机密时出现问题.",
============= ./scripts/directives/deployImage.js =================
47:            message: errorMessage,
137:                  $scope.import.error = _.get(response, 'result.message', 'An error occurred finding the image.');
229:                      message: "不能创建 " + humanizeKind(failure.object.kind).toLowerCase() + " \"" + failure.object.metadata.name + "\". ",
230:                      details: failure.data.message
237:                      message: "创建 " + humanizeKind(success.kind).toLowerCase() + " \"" +所有资源已被创建 + "\" 成功. "
241:                  // Only show one success message when everything worked.
244:                    message: "镜像 " + $scope.app.name + " 已创建成功."
264:                    message: "检测到你的应用配置出现问题.",
============= ./scripts/directives/deploymentDonut.js =================
52:                return _.escape(warning.message);
83:              message: "部署缩容出现问题.",
============= ./scripts/directives/deploymentMetrics.js =================
132:        // Get the URL to show in error messages.
359:        // If the first request for metrics fails, show an empty state error message.
368:            // Show an empty state message if the first request for data fails.
390:              message: '更新权值出现错误.',
409:            // Show the no metrics message.
440:            // "Loading..." message with "没有权值进行显示."
============= ./scripts/directives/events.js =================
59:          'message',
105:            id: 'message',
============= ./scripts/directives/fromFile.js =================
66:                  message: "我们检查您的应用具有潜在的问题。请确认你还想创建这个应用？.",
183:              message: "."
197:              message: "资源缺失元数据字段."
203:              message: "元数据字段却是资源名称."
209:              message: item.kind + " " + item.metadata.name + " can't be created in project " + item.metadata.namespace + ". Can't create resource in different projects."
283:            $scope.error = { message: APIService.invalidObjectKindOrVersion(item) };
288:            $scope.error = { message: APIService.unsupportedObjectKindOrVersion(item) };
326:                    message: 资源类别 + " " + resource.metadata.name + " 已创建成功."
335:                  message: "无法创建 " + humanizeKind(resource.kind) + " '" + resource.metadata.name + "'.",
348:                    message: resource.kind + " " + resource.metadata.name + " 更新成功."
357:                  message: "无法更新 " + humanizeKind(resource.kind) + " '" + resource.metadata.name + "'.",
386:                        mesResource is missing kind fieldsage: "不能创建 " + humanizeKind(failure.object.kind) + " \"" + failure.object.metadata.name + "\". ",
387:                        details: failure.data.message
395:                        message: "创建 " + humanizeKind(success.kind) + " \"" + success.metadata.name + "\" 成功. "
406:                  alerts.push({ type: "success", message: alertMsg});
437:                        message: "不能更新 " + humanizeKind(failure.object.kind) + " \"" + failure.object.metadata.name + "\". ",
438:                        details: failure.data.message
446:                        message: "更新 " + humanizeKind(success.kind) + " \"" + success.metadata.name + "\" 成功. "
457:                  alerts.push({ type: "success", message: alertMsg});
465:                    message: "资源更新时出错.",
============= ./scripts/directives/keyValueEditor.js =================
57:            keyValidatorError: '@',                   // general key validation error message
60:            valueValidatorError: '@',                 // general value validation error message
============= ./scripts/directives/logViewer.js =================
278:                // Scroll immediately. Don't wait the next message.
372:                    // Completely empty messages (without even a newline character) should not add lines
402:                      //   callback has already fired.  onError message takes priority in severity.
403:                      // - at present we are using the same error message in both onError and onClose
419:                      // if logs err before we get anything, will show an empty state message
548:          // and we were sending it messages telling it when to scroll.
============= ./scripts/directives/notificationIcon.js =================
23:          return _.escape(alert.message);
============= ./scripts/directives/oscFileInput.js =================
18:        scope.dropMessageID = id + '-drop-message';
============= ./scripts/directives/oscKeyValues.js =================
103:   * keyValidationTooltip: The tool tip to display when the key validation message is visible
============= ./scripts/directives/overview/dc.js =================
51:                message: "编排开始时出错.",
80:              message: "部署恢复时出错.",
101:                  message: "确定取消部署 " + rcName + "?",
118:                message: "部署 " + rcName + " 已不存在."
127:                message: "部署 " + rcName + " 没有进展."
============= ./scripts/directives/overview/deployment.js =================
29:              message: "恢复部署出错.",
============= ./scripts/directives/overview/listRow.js =================
250:          message: " " + buildType + "启动时出错.",
278:            message: "取消部署 " + rcName + "?",
293:          message: "部署 #" + latestVersion + " 不是最新的."
305:          message: "部署 " + rcName + " 没有进展."
============= ./scripts/directives/overview/serviceGroup.js =================
72:                    message: "无法连接服务.",
87:                  message: "确定从组中删除服务 '" + service.metadata.name + "'?",
110:                  message: "不能删除服务连接.",
============= ./scripts/directives/podMetrics.js =================
106:        // Get the URL to show in error messages.
302:        // If the first request for metrics fails, show an empty state error message.
311:            // Show an empty state message if the first request for data fails.
332:            message: 'pod ' + _.get(scope, 'pod.metadata.name', '<unknown>') + '权值更新时出错.',
501:            // "Loading..." message with "No metrics to display."
============= ./scripts/directives/popups.js =================
105:          content += warnings[i].message;
============= ./scripts/directives/resources.js =================
167:        // Optional empty message to display when there are no pods.
============= ./scripts/directives/serviceGroupNotifications.js =================
41:              message: object.metadata.name + " 没有健康检查,确保您的应用程序运行正确吗？.",
68:          // Show messages about cancelled or failed deployments.
83:              message: '部署 ' + displayName + '已被取消.',
101:              message: '部署 ' + displayName + ' 失败.',
179:              message: warning.message
195:              // Allow users to permanently dismiss the non-zero exit code message for terminating pods.
============= ./scripts/filters/resources.js =================
322:      // If this logic ever changes, update the message in podWarnings
335:      // If this logic ever changes, update the message in podWarnings
347:      // If this logic ever changes, update the message in podWarnings
393:        warnings.push({reason: 'Unknown', pod: pod.metadata.name, message: 'pod状态无法获得，这通常是由于pod与主机之间通信出错.'});
397:        warnings.push({reason: "Stuck", pod: pod.metadata.name, message: "pod一直停留在挂起状态超过五分钟."});
413:                message: "容器 " + containerStatus.name + " 终止(exit code " + containerStatus.state.terminated.exitCode + ")时没有停止清理."
421:                message: "容器 " + containerStatus.name + " 失败 (exit code " + containerStatus.state.terminated.exitCode + ")."
431:              message: "容器" + containerStatus.name + " 频繁挂起. 必须等待下次重新启动."
440:              message: "容器 " + containerStatus.name + " 已启动五分钟，并且未通过检查."
449:  // Groups pod warnings by reason + container name, all messages in a group are expected to be the same
============= ./scripts/filters/util.js =================
328:      if (error.message) {
329:        return capitalize ? upperFirstFilter(error.message) : error.message;
============= ./scripts/services/applicationGenerator.js =================
446:          failureResults.push({data: {message: APIService.invalidObjectKindOrVersion(apiObject)}});
452:          failureResults.push({data: {message: APIService.unsupportedObjectKindOrVersion(apiObject)}});
============= ./scripts/services/deployments.js =================
29:              message: "部署 #" + req.status.latestVersion + " 于 " + deploymentConfig.metadata.name + " 已经启动.",
37:              message: "部署启动时出错.",
65:                    message: "删除部署的pod出现错误.",
90:              message: "部署失败 " + deploymentName + " 属于 " + deploymentConfigName + ".",
98:              message: "部署重试出现错误.",
135:                  message: "部署 #" + rolledBackDeploymentConfig.status.latestVersion + " 正在回滚 " + deploymentConfigName + " 到" + deploymentName + ".",
143:                  message: "部署回滚出现错误.",
154:              message: "部署回滚中出现错误.",
181:              message: "取消部署 " + deploymentName + " 属于 " + deploymentConfigName + ".",
189:              message: "取消部署时出现错误.",
326:            message: "不能衡量类别" + object.kind + "."
============= ./scripts/services/hpa.js =================
127:    // Returns an array of warnings, each an object with `message` and `reason` properties.
137:            message: '指标不能由您的集群管理员进行配置. ' +
159:            message: cpuRequestMessage,
166:            message: '多个指标衡量资源. ' +
186:            message: '部署由部署配置和定标器共同衡量决定. ' +
============= ./scripts/services/keyValueEditorProvider.js =================
14:          keyValidatorError: 'Validation error',                   // default error message string
15:          keyValidatorErrorTooltip: undefined,                     // default error message tooltip string
16:          keyValidatorErrorTooltipIcon: 'pficon pficon-help',      // default error message tooltip icon
17:          valueValidatorError: 'Validation error',                 // default error message string
18:          valueValidatorErrorTooltip: undefined,                   // default error message tooltip string
19:          valueValidatorErrorTooltipIcon: 'pficon pficon-help',    // default error message tooltip icon
============= ./scripts/services/limits.js =================
150:    // Returns an array of error messages, or an empty array if no problems.
============= ./scripts/services/logLinks.js =================
68:          "columns:!(kubernetes.container_name,message),",
============= ./scripts/services/navigate.js =================
35:       * @param {type} message    The message to display to the user
39:      toErrorPage: function(message, errorCode, reload) {
41:          error_description: message,
============= ./scripts/services/quota.js =================
75:        var details, message;
83:          message = '你在你给pods的配额中.';
86:          message = '你在你的pods配额中 ' + humanizeQuotaResource(type) + '.';
90:          message: message,
131:          message: '你已经接近你在pod上的配额' + humanizeQuotaResource(type) + " .",
209:              message: "在你的配额中 " + q.hard[quotaKey] + " " + (q.hard[quotaKey] === "1" ? humanizedKind : humanizedResource) +
============= ./scripts/services/resourceAlerts.js =================
29:          message: warning.message
46:            // Allow users to permanently dismiss the non-zero exit code message for terminating pods.
81:          message: '已经达到配额限制.',
111:      // Show messages about cancelled or failed deployments.
121:          message: '部署 ' + displayName + ' 已被取消.',
133:          message: '部署 ' + displayName + ' 失败.',
============= ./scripts/services/routes.js =================
70:          var message = '被请求的主机' + (ingress.host || '<unknown host>') + '被路由拒绝.';
71:          if (condition.message || condition.reason) {
72:            message += " Reason: " + (condition.message || condition.reason) + '.';
74:          warnings.push(message);
77:        // This message only displays with old router images that are not aware of `wildcardPolicy`.
177:      // Returns: Array of warning messages.
============= ./scripts/services/securityCheck.js =================
42:          message: "工程外创建资源，可能影响集群中所有用户.",
61:          message: "给你的功能授予权限.",
68:          message: "和工程创建额外的关系角色.",
78:          message: "将会创建资源可能有安全或者功能行为牵连.",
============= ./scripts/services/tasks.js =================
49:      // If the message has errors, return... it will show until dismissed
54:      // Otherwise, queue the message to be deleted
============= ./scripts/services/templates.js =================
27:        message: null
47:          templateData.message = msg;
============= ./styles/_core.less =================
133:.empty-state-message {
489:    .empty-state-message {
727:.template-message {
736:    // Consistent font-size with the CLI examples in code blocks below the template message.
897:.attention-message {
1052:    .empty-state-message {
============= ./styles/_list-view.less =================
16:  .log-fixed-height.empty-state-message,
17:  .metrics .empty-state-message {
25:  .metrics .empty-state-message .pficon-error-circle-o {
26:    // Hide the icon so the message is consistent with logs, which doesn't have an error icon.
============= ./styles/_log.less =================
275:.log-fixed-height.empty-state-message {
281:  .empty-state-message();
============= ./styles/_messages.less =================
17:  .messenger-message {
39:    .messenger-message {
43:    .message .messenger-actions {
109:ul.messenger-theme-flat .messenger-message {
122:  .messenger-message-inner:before {
143:ul.messenger-theme-flat .messenger-message .messenger-actions a {
150:  .messenger-message.alert-error {
156:    .messenger-message-inner:before {
160:  .messenger-message.alert-warning {
169:  .messenger-message.alert-success .messenger-message-inner:before {
175:  .messenger-message.alert-info .messenger-message-inner:before {
============= ./styles/_overview.less =================
212:    .empty-state-message {
215:      // Avoid breaking long identifiers like image stream names in empty state message.
293:  .loading-message {
449:  .loading-message {
565:        overview-service,.no-child-services-message {
671:        // Display the message below the route when there is an app label.
963:  .no-child-services-message, .no-deployments-message {
981:  .no-deployments-message {
984:  .no-child-services-message {
1079:    .no-deployments-message {
============= ./styles/_projects.less =================
11:.empty-state-message .projects-instructions code {
============= ./styles/_sidebar.less =================
382:        .event-reason, .event-object, .event-message {
385:        .event-message {
============= ./styles/_tables.less =================
69:  th#message {
============= ./styles/main.less =================
23:@import "_messages.less";
============= ./views/_alerts.html =================
2:  <div ng-repeat="(alertID, alert) in (alerts | filterCollection : filter) track by (alertID + (alert.message || alert.details))" ng-if="!alert.hidden" class="alert-wrapper animate-repeat" ng-class="{'animate-slide': animateSlide}">
22:      <span ng-if="alert.message" style="margin-right: 5px;" ng-class="{'strong': !toast}">{{alert.message}}</span><span ng-if="alert.details">{{alert.details}}</span>
============= ./views/_parse-error.html =================
7:  <div class="pre-wrap" ng-if="error.message">{{error.message}}</div>
============= ./views/_pod-template.html =================
64:                  {{build.spec.revision.git.message}}
============= ./views/_triggers.html =================
22:            <span ng-if="!build.status.message || build.status.phase === 'Cancelled'">{{build.status.phase}}.</span>
23:            <span ng-if="build.status.message && build.status.phase !== 'Cancelled'">{{build.status.message}}.</span>
============= ./views/_webhook-trigger-cause.html =================
1:{{trigger.message === 'GitHub WebHook' ? 'GitHub webhook' : 'Generic webhook'}}:
2:<span ng-if="trigger.githubWebHook.revision || trigger.genericWebHook.revision"> {{trigger.githubWebHook.revision.git.message || trigger.genericWebHook.revision.git.message}}</span>
============= ./views/browse/_pod-details.html =================
18:        <dt ng-if-start="pod.status.message">Message:</dt>
19:        <dd ng-if-end>{{pod.status.message}}</dd>
============= ./views/directives/events.html =================
49:        <th id="message"><span class="hidden-xs-inline visible-sm-inline visible-md-inline hidden-lg-inline">Reason and </span>Message</th>
98:          <!-- Truncate long messages to 1000 chars or 4 lines. -->
100:              content="event.message"
============= ./views/directives/logs/_log-viewer.html =================
39:  messages will be displayed because of the large log size.
43:<!-- show this message until the log viewer starts. important for pending state, etc -->
49:<div class="empty-state-message text-center" ng-if="state=='empty'" ng-class="{'log-fixed-height': fixedHeight}">
106:  <a href="" ng-click="restartLogs()">reload</a> the log to see new messages.
============= ./views/new-overview.html =================
12:        <div class="empty-state-message text-center">
17:              image, or add components like databases and message queues.
31:      <div ng-if="overview.showLoading" class="container-fluid loading-message">
111:              <div class="empty-state-message text-center h2">
250:                <!-- TODO: Reuse pipelines empty state message from pipelines.html -->
251:                <div ng-if="!overview.pipelineBuildConfigs.length" class="empty-state-message text-center">
273:                  <div class="empty-state-message text-center h2">
============= ./views/overview.html =================
21:                      image, or add components like databases and message queues.
35:              <div ng-if="renderOptions.showLoading" class="loading-message">

258:./styles/_messages.less
