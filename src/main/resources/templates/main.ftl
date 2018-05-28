<#import "parts/common.ftl" as c>
<#import "parts/cards.ftl" as crd>

<@c.page>

	<div class="card-columns">
		<#list newsList as news>
			<@crd.newsCard "${news.id}" "${news.title}" "${news.text}" "${news.filename?ifExists}" "${news.authorName}" />
		<#else>
			<@crd.empty/>
		</#list>
	</div>

</@c.page>


