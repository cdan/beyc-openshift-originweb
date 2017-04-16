openshift汉化

汉化思路：
1.通过关键词匹配找出待修改的候选项，源代码在app, dist和dist.java三个目录下
    输入：执行bash str-search.sh <key>，可能的key包括h1,h2,h3,span,<p>,message,label,text,uib-tab-heading，当然也可以扩展
    输出：相关的文件以及相关的行数
2.人工派查，进行代码修改
    输入：第一步的输出
    输出：相关的翻译工作
