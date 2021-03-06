<#import "forms.ftl" as f>
<#include "security.ftl">

<#macro navbar>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">ООО Ария</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/main">Главная</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/work-plan">План работ</a>
                </li>
                <#if isEditor>
                <li class="nav-item">
                    <a class="nav-link" href="/control-panel">Панель управления</a>
                </li>
                </#if>
                <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link mr-2" href="/admin-panel">Панель администратора</a>
                </li>
                </#if>
            </ul>
            <div class="navbar-text">${name}</div>
            <@f.logout />
        </div>
    </nav>
</#macro>