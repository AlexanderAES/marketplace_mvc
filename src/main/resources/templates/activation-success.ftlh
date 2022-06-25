
<head>
    <meta charset="UTF-8">
    <title>Подтверждение регистрации</title>
</head>
<style>
    body {
        position: relative;
    }
    .card {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 500px;
        height: 300px;
        border-radius: 20px;
        border: 1px solid #404040;
        padding: 15px;
        background-color: rgba(206, 243, 208, 0.22);
    }
    .card .card-position {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        width: 80%;
    }
    .card .card-position h2 {
        font-weight: normal;
        font-size: 25px;
        color: #404040;
        margin: 0;
    }
</style>
<body>

<div class="card">
    <div class="card-position">
        <h2>Ваш профиль успешно активирован</h2>
        <a href="/login">Для авторизации пройдите по ссылке</a>
    </div>
</div>

</body>