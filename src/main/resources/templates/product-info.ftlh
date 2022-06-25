<#import "blocks/template.ftlh" as t>
<@t.template user>
    <style>
        .owl-stage {
            display: flex;
        }
        .owl-nav {
            text-align: center;
            margin-top: 30px;
        }
        .slider {
            overflow: hidden;
        }
        .slider .slider-img {
            width: 400px;
            max-height: 500px;
            margin: 0 auto;
            cursor: pointer;
        }
    </style>
    <hr>
    <h4 class="text-center">Подробная информация о товаре</h4>
<div>
    <div class="slider mt-5">
        <#list images as img>
            <div class="slider-img">
                <img src="/images/${img.id}" class="img-fluid"/>
            </div>
        </#list>
    </div>

    <div class="row mt-3">
        <div class="col-4">Заголовок:</div>
        <div class="col-8">${product.title}</div>
    </div>
    <div class="row mt-3">
        <div class="col-4">Описание товара,услуги:</div>
        <div class="col-8">${product.description}</div>
    </div>
    <div class="row mt-3">
        <div class="col-4">Цена:</div>
        <div class="col-8">${product.price} руб.</div>
    </div>
    <div class="row mt-3">
        <div class="col-4">Город:</div>
        <div class="col-8">${product.city}</div>
    </div>
    <div class="row mt-3">
        <div class="col-4">Контакты:</div>
        <div class="col-8"><a href="/user/${product.user.id}">${product.user.name}</div>
    </div>
</div>
</@t.template>
