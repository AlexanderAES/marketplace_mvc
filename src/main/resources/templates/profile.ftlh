<#import "blocks/template.ftlh" as t>
<@t.template user>
    <hr>
    <div>
        Пользователь: <h3>${user.name}</h3>
        <hr>
        Электоронная почта: <b>${user.email}</b><br>
        Номер телефона: <b>${user.phoneNumber}</b>
        <br>
        <#if user.isAdmin()>
            <a href="/admin">Панель администратора</a>
            <br>
        </#if>
        <br>
        <a href="/my/products"> Мои объявления </a>
        <br><br>
        <form action="/logout" method="post">
            <input type="hidden" name="_csrf" value="${_csrf.token}"/>
            <button type="submit" class="btn btn-secondary">
                Выйти из аккаунта
            </button>
        </form>
    </div>
</@t.template>