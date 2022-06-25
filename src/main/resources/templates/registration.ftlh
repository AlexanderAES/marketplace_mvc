<#import "blocks/template.ftlh" as t>
<@t.template user>
<h4 class="text-center">Регистрация</h4>
<hr>
    <div class="container">
    <div class="row">
            <form action="/registration" method="post" class="col-6 m-auto">
                <div class="row py-3">
                    <div class="col-4">
                        Имя пользователя:
                    </div>
                    <div class="col-8">
                        <input type="text" name="name" class="w-100">
                    </div>
                </div>
                <div class="row py-3">
                    <div class="col-4">
                        Эл. почта:
                    </div>
                    <div class="col-8">
                        <input type="email" name="email" class="w-100">
                    </div>
                </div>
                <div class="row py-3">
                    <div class="col-4">
                        Номер телефона:
                    </div>
                    <div class="col-8">
                        <input type="text" name="phoneNumber" class="w-100">
                    </div>
                </div>
                <div class="row py-3">
                    <div class="col-4">
                        Пароль:
                    </div>
                    <div class="col-8">
                        <input type="password" name="password" class="w-100">
                    </div>
                </div>
                <div class="mt-4">
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <input type="submit" value="Зарегистрироваться" class="btn btn-success d-block m-auto"/>
                </div>
            </form>
            <#if errorMessage??>
                <h2 style="color: #ff0000">${errorMessage}</h2>
            </#if>
    </div>

    </div>

</@t.template>