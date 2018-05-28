<#import "parts/common.ftl" as c>
<#import "parts/forms.ftl" as f>

<@c.page>

    <@f.addUser />

    <div class="card my-3">
        <div class="card-header">
            Список пользователей
        </div>
        <div class="card-body">
            <table class="table table-striped table-bordered">
                <thead class="thead-light">
                <tr>
                    <th scope="col">Логин</th>
                    <th scope="col">Имя пользователя</th>
                    <th scope="col">Email</th>
                    <th scope="col">Роль</th>
                    <th scope="col">Редактировать</th>
                    <th scope="col">Удалить</th>
                </tr>
                </thead>
                <tbody>
                    <#list users as user>
                    <tr>
                        <th scope="row">${user.username}</th>
                        <td>${user.fullName}</td>
                        <td>${user.email}</td>
                        <td><#list user.roles as role>${role}<#sep>, </#list></td>
                        <td><a href="/admin-panel/id${user.id}">Изменить</a></td>
                        <td><a href="/admin-panel/delete${user.id}">Удалить</a></td>
                    </tr>
                    </#list>
                </tbody>
            </table>
        </div>
    </div>

</@c.page>