<#import "parts/common.ftl" as c>
<#import "parts/cards.ftl" as crd>

<@c.page>

	<#list tasks as task>
		<@crd.taskCard "${task.id}" "${task.header}" "${task.title}" "${task.text}" "${task.filename?ifExists}" "${task.authorName}" />
	<#else>
		<@crd.empty/>
	</#list>

</@c.page>


