<#import "blocks/template.ftlh" as t>
<@t.template user>
<#--    <#macro template>-->
    <hr>

    <div class="container">
        <div class="row">
            <div class="col-6 m-auto">
                <h5>Войти в личный кабинет</h5>
                <form action="/login " method="post">
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" class="form-control <#if RequestParameters.error??>is-invalid</#if>" id="email" name="username">
                        <div id="email" class="invalid-feedback">
                            <#--                Неверный адрес email-->
                        </div>
                    </div>
                    <br>
                    <div class="form-group">
                        <label for="password">Пароль</label>
                        <input type="password" class="form-control <#if RequestParameters.error??>is-invalid</#if>" id="password" name="password">
                        <div id="password" class="invalid-feedback">
                            <#--                Неверный пароль-->
                        </div>
                        <br>
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}">
                    <button type="submit" class="btn btn-secondary">Войти</button>
                </form>
                <hr>
                <h5>Впервые у нас и хотите подать объявление? <a href="/registration">Зарегистрируйтесь</a></h5>
            </div>
        </div>
    </div>
<#--</#macro>-->
</@t.template>