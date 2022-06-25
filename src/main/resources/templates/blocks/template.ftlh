<#macro template user>
    <!doctype html>
    <html lang="ru">
    <head>
        <title>MarketPlace</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
    </head>
<style>
    .navbar-brand,
    .block {
        font-size: 30px;
        color: #2ea82e;
    }
    .navbar-brand:hover,
    .block:hover {
        color: #168a16;
        text-decoration: underline;
    }
</style>
    <body>
    <div class="d-flex justify-content-between align-items-center p-4">
        <a href="/">
            <span class="navbar-brand mb-0 h1">Market Place</span>
        </a>
        <#if user.email??>
            <a href="/profile" class="block">Личный кабинет</a>
        <#else>
            <button type="button"
                    onclick="window.location.href = '/login'" class="btn btn-secondary">
                Войти
            </button>
        </#if>
    </div>
    <h5 class="text-center">Доска бесплатных объявлений</h5>

    <div class="container px-3 pt-3 pb-4">
        <#nested/>
    </div>


    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
        <script>
            $( document ).ready(function() {
                $('.slider').owlCarousel({
                    dots: false,
                    items: 1,
                    center: true
                });
            });
        </script>
    </body>
    </html>
</#macro>