<#import "blocks/template.ftlh" as t>
<@t.template user>
    <div>
        <hr>
        <h2 style="text-align: center">Мои объявления</h2>
        <hr>
        <div class="row">
         <div class="col-6 m-auto">
            <#if user.email??>
                <h3>Подать объявление</h3>
                <form action="/product/create" method="post" enctype="multipart/form-data">
                    <label for="category">Категория:</label>
                    <select id="category" name="category" class="form-control">
                        <option selected disabled value="">Выбрать...</option>
                        <#list category as category>
                            <#if category??>
                                <option id="${category.id}" value="${category.id}">${category.categoryName}</option>
                            </#if>
                        </#list>
                    </select>
                    <div class="row py-3">
                        <div class="col-4">
                            Заголовок:
                        </div>
                        <div class="col-8">
                            <input type="text" name="title" class="w-100"/>
                        </div>
                    </div>
                    <div class="row py-3">
                        <div class="col-4">
                            Текст объявления:
                        </div>
                        <div class="col-8">
                            <textarea name="description" class="w-100" rows="3"></textarea>
                        </div>
                    </div>
                    <div class="row py-3">
                        <div class="col-4">
                            Цена:
                        </div>
                        <div class="col-8">
                            <input type="number" name="price" class="w-100"/>
                        </div>
                    </div>
                    <div class="row py-3">
                        <div class="col-4">
                            Город:
                        </div>
                        <div class="col-8">
                            <input type="text" name="city" class="w-100"/>
                        </div>
                    </div>
                    <div class="row py-3">
                        <div class="col-4">
                            Фото товара:
                        </div>
                        <div class="col-8">
                            <input type="file" name="files" multiple="multiple"/>
                        </div>
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="submit" value="Подать объявление" class="btn btn-success d-block m-auto"/>
                </form>
            </#if>
          </div>
        </div>
        <div class="row mt-5">
            <#list products as product>
                <a href="/product/${product.id}" class="card p-2 col-4 mt-3 mr-2">
                    <div class="d-flex align-items-center">
                        <#--<img src="/images/${product.previewImageId}">-->
                        <div>
                            <div>
                                <div>${product.title} - ${product.price} руб</div>
                            </div>
                            <div class="mt-3">
                                ${product.city}
                            </div>
                        </div>
                        <div class="ml-4">
                            <form action="/product/delete/${product.id}" method="post">
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <button type="submit" class="btn btn-danger">
                                    Удалить
                                </button>
                            </form>
                            <form action="/product/edit/${product.id}" method="get" class="mt-3">
                                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                                <button type="submit" class="btn btn-secondary">
                                    Редактировать
                                </button>
                            </form>
                        </div>
                    </div>
                </a>
            <#else>
                <h3>Ваших объявлений не найдено...</h3>
            </#list>
        </div>
    </div>
</@t.template>