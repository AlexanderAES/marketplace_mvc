<#import "blocks/template.ftlh" as t>
<#import "blocks/pager.ftlh" as p>
<@t.template user>
    <hr>
    <form method="get" action="/">
        Поиск по названию объявления: <input type="text" name="title">
        <input type="submit" value="Поиск"/>
    </form>
    <hr>
    <div class="row">
    <#list pageable.content as product>
        <a href="/product/${product.id}" class="col-4 card p-3 mt-2 mr-2">
                <div>
<#--                    <img src="/images/${product.previewImageId}">-->
                    <div>
                        <div>${product.title} - ${product.price} руб.</div>
                    </div>
                    <div>
                        ${product.city}
                    </div>
                </div>
            </a>
        <#else>
            <h3>По вашему запросу ничего не найдено...</h3>
        </#list>
    </div>
    <@p.pager pageable url >
<#--        insert page.ftlh -->
</@p.pager>
</@t.template>
