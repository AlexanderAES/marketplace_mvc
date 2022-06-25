<#import "blocks/template.ftlh" as t>
<@t.template user>
    <hr>
    <h2 style="text-align: center">Панель администратора</h2>
    <hr>
    <h3>Список категорий </h3>
    <tr>
        <th>Категории:</th>
    </tr>
    <#list categoryList as category>
        <tr>
            <th>${category.categoryName}</th>
        </tr>
    <#else>
        <h3>категорий нет</h3>
    </#list>
    <hr>
    <h3>Создать новую категорию</h3>
    <form action="/category/create" method="post">
        Название категории: <input type="text" name="categoryName"/><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Добавить категорию" class="btn btn-success"/>
    </form>
    <hr>
    <table border="1">
        <tr>
            <th>Email</th>
            <th>Номер телефона</th>
            <th>Активность</th>
            <th>Роли</th>
            <th>Бан</th>
            <th>Редактирование</th>
            <th>Подробная информация</th>
        </tr>
        <#list users as user>
            <tr>
                <th>${user.email}</th>
                <th>${user.phoneNumber}</th>
                <th><#if user.active>true<#else>false</#if></th>
                <th><#list user.roles as role>${role}</#list></th>
                <th>
                    <form action="/admin/user/ban/${user.id}" method="post">
                        <input type="hidden" name="_csrf" value="${_csrf.token}">
                        <input type="submit" value="Бан">
                    </form>
                </th>
                <th><a href="/admin/user/edit/${user.id}">Редактировние</a></th>
                <th><a href="/user/${user.id}">Подробная информация</a></th>
            </tr>
        <#else>
            <h3>Пользователей нет</h3>
        </#list>
    </table>
</@t.template>