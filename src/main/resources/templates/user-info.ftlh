<#import "blocks/template.ftlh" as t>
<@t.template userByPrincipal>
<hr>
<h3>Подробная информация о пользователе ${user.name}:</h3>
    <h3 hidden>Информация об активации
<th><#if user.active>true<#else>false</#if></th></h3>
<b>Номер телефона: </b> ${user.phoneNumber}<br>
<b>Email: </b> ${user.email}<br>
    <hr>
<h4>Объявления пользователя ${user.name}:</h4>
<#list products as product>
    <div>
        <p><b>${product.title}</b> ${product.price} руб. | <a href="/product/${product.id}">Подробнее...</a></p>
    </div>
<#else>
    <h3>Объявлений нет</h3>
</#list>
<#--<#if errorMessage??>-->
<#--    <h2 style="color: red">${errorMessage}</h2>-->
<#--</#if>-->
</@t.template>