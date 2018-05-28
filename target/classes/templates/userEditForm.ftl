<#import "parts/common.ftl" as c>

<@c.page>

    <div class="card my-3">
        <div class="card-header">
            Изменить данные пользователя
        </div>
        <div class="card-body">
            <form method="post" action="/admin-panel/user-edit">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Имя пользователя" name="fullName" value="${user.fullName}" required>
                </div>
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Email" name="email" value="${user.email}" required>
                </div>
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Пароль" name="password" value="${user.password}" required>
                </div>
                <div>
                    <#list roles as role>
                        <div>
                            <label><input type="checkbox" name="${role}" ${user.roles?seqContains(role)?string("checked" , "")}>${role}</label>
                        </div>
                    </#list>
                </div>

                <input type="hidden" name="userId" value="${user.id}">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit" class="btn btn-primary">Сохранить</button>
            </form>
        </div>
    </div>

</@c.page>