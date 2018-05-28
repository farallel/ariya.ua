<#macro logout>
    <form class="form-inline my-2 my-lg-0" method="post" action="/logout">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-primary my-2 my-sm-0 ml-2" type="submit">Выйти</button>
    </form>
</#macro>

<#macro addUser>
    <div class="card my-3">
        <div class="card-header">
            Добавить пользователя
        </div>
        <div class="card-body">
            <form method="post" action="/admin-panel/addUser">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Логин" name="username" required>
                </div>
                <#if userExistsError??>
                <div class="alert alert-danger" role="alert">
                    ${userExistsError}
                </div>
                </#if>
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Имя пользователя" name="fullName" required>
                </div>
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Email" name="email" required>
                </div>
                <div class="input-group mb-3">
                    <input type="password" class="form-control" placeholder="Пароль" name="password" required>
                </div>
                <#if confirmPasswordError??>
                <div class="alert alert-danger" role="alert">
                    ${confirmPasswordError}
                </div>
                </#if>
                <div class="input-group mb-3">
                    <input type="password" class="form-control" placeholder="Подтвердите пароль" name="confirmPassword" required>
                </div>
                <#if confirmPasswordError??>
                <div class="alert alert-danger" role="alert">
                    ${confirmPasswordError}
                </div>
                </#if>
                <#if userSuccessfullyAdded??>
                <div class="alert alert-success" role="alert">
                    ${userSuccessfullyAdded}
                </div>
                </#if>
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <button type="submit" class="btn btn-primary">Добавить</button>
            </form>
        </div>
    </div>
</#macro>

<#macro addNews>
    <div class="card my-3">
        <div class="card-header">
            Добавить новость
        </div>
        <div class="card-body">
            <form method="post" action="/control-panel/addNews" enctype="multipart/form-data">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Заголовок" name="title" required>
                </div>
                <div class="input-group mb-3">
                    <textarea class="form-control" placeholder="Описание" name="text" required></textarea>
                </div>
                <div class="input-group mb-3">
                    <div class="custom-file">
                        <input name="file" type="file" class="custom-file-input" id="inputGroupFile02">
                        <label class="custom-file-label" for="inputGroupFile02">Выбрать файл</label>
                    </div>
                    <div class="input-group-append">
                        <span class="input-group-text" id="">Загрузить</span>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button type="submit" class="btn btn-primary">Разместить</button>
            </form>
        </div>
    </div>
</#macro>

<#macro addTask>
    <div class="card my-3">
        <div class="card-header">
            Добавить задание
        </div>
        <div class="card-body">
            <form method="post" action="/control-panel/addTask" enctype="multipart/form-data">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Шапка" name="header" required>
                </div>
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Заголовок" name="title" required>
                </div>
                <div class="input-group mb-3">
                    <textarea class="form-control" placeholder="Описание" name="text" required></textarea>
                </div>
                <div class="input-group mb-3">
                    <div class="custom-file">
                        <input name="file" type="file" class="custom-file-input" id="inputGroupFile02">
                        <label class="custom-file-label" for="inputGroupFile02">Выбрать файл</label>
                    </div>
                    <div class="input-group-append">
                        <span class="input-group-text" id="">Загрузить</span>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button type="submit" class="btn btn-primary">Разместить</button>
            </form>
        </div>
    </div>
</#macro>