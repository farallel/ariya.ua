<#import "parts/common.ftl" as c>

<@c.page>

    <div class="card my-3">
        <div class="card-header">
            Редактировать новость
        </div>
        <div class="card-body">
            <form method="post" action="/main/news-edit" enctype="multipart/form-data">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Заголовок" name="title" value="${news.title}" required>
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

                <input type="hidden" name="newsId" value="${news.id}">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button type="submit" class="btn btn-primary">Сохранить</button>
            </form>
        </div>
    </div>

</@c.page>