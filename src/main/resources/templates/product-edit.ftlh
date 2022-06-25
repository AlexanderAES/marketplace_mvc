<#import "blocks/template.ftlh" as t>
<@t.template user>
    <hr>
    <div>
    <#if user.email??>
        <div class="container">
            <h3 class="text-center">Редактировать объявление</h3>
            <div class="row">
                <form action="/product/create" method="post" enctype="multipart/form-data" class="col-6 m-auto">
                    <input type="hidden" value="${(product.id)!''}" name="id"/>
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
                            <input type="text" name="title" value="${(product.title)!''}" class="w-100"/>
                        </div>
                    </div>
                    <div class="row py-3">
                        <div class="col-4">
                            Текст объявления:
                        </div>
                        <div class="col-8">
<#--                            <input type="text" name="description" value="${(product.description)!''}" class="w-100"/>-->
                            <textarea name="description"  class="form-control w-100" id="exampleFormControlTextarea1" rows="3">${(product.description)!''}</textarea>
                        </div>
                    </div>
                    <div class="row py-3">
                        <div class="col-4">
                            Цена:
                        </div>
                        <div class="col-8">
                            <input type="number" name="price" value="${(product.price)!''}" class="w-100"/>
                        </div>
                    </div>
                    <div class="row py-3">
                        <div class="col-4">
                            Город:
                        </div>
                        <div class="col-8">
                            <input type="text" name="city" value="${(product.city)!''}" class="w-100"/>
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
                    <div class="mt-4">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="submit" value="Редактировать объявление"  class="btn btn-secondary d-block m-auto"/>
                    </div>
                </form>
            </div>
        </div>


    </#if>
    </div>
</@t.template>