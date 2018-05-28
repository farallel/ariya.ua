<#include "security.ftl">

<#macro newsCard id title text filename author>
    <div class="card mb-4">
        <#if filename?has_content>
            <img class="card-img-top" src="/img/${filename}">
        </#if>
        <div class="card-body">
            <h5 class="card-title">${title}</h5>
            <p class="card-text">${text}</p>
        </div>
        <ul class="list-group lust-group-flush">
            <li class="list-group-item">Автор: ${author}</li>
        </ul>
        <#if isEditor>
            <div class="card-footer">
                <div class="btn-group" role="group" aria-label="Basic example">
                    <a class="btn btn-primary" href="/main/id${id}">Изменить</a>
                    <a class="btn btn-danger" href="/main/delete${id}">Удалить</a>
                </div>
            </div>
        </#if>
    </div>
</#macro>

<#macro taskCard id header title text filename author>
    <div class="card my-3">
        <div class="card-header">
            ${header}
        </div>
        <div class="card-body">
            <h5 class="card-title">${title}</h5>
            <p class="card-text">${text}</p>
            <#if filename?has_content>
                <a href="/img/${filename}" class="btn btn-primary">Скачать файл</a>
            </#if>
        </div>
        <ul class="list-group lust-group-flush">
            <li class="list-group-item">Автор: ${author}</li>
        </ul>
        <#if isEditor>
            <div class="card-footer">
                <div class="btn-group" role="group" aria-label="Basic example">
                    <a class="btn btn-primary" href="/work-plan/id${id}">Изменить</a>
                    <a class="btn btn-danger" href="/work-plan/delete${id}">Удалить</a>
                </div>
            </div>
        </#if>
    </div>
</#macro>

<#macro empty>
    <div class="card my-3">
        <div class="card-body">
            <h5 class="card-title align-middle">На данный момент нет ни одной записи.</h5>
        </div>
    </div>
</#macro>



