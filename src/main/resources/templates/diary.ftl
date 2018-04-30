<html>
<head>
    <title>Diary</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="container">

    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Progress diary</a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Дневник</a></li>
                    <li><a href="/graph">График</a></li>
                    <li><a href="/gallery">Галерея</a></li>
                    <li><a href="/settings">Настройки</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="/logout"><span class="glyphicon glyphicon-log-in"></span> Выход</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div id="myCarousel" class="carousel slide" data-ride="carousel" data-interval="false">
        <div class="carousel-inner">
                <#list diary as page>
                    <div class="item">
                        <form class="form-horizontal" method="post" action="/edit-page">
                            <div class="row">
                                <div class="col-xs-6">
                                    <div class="form-group">
                                        <label for="date">Дата:</label>
                                        <input class="form-control" type="date" id="date"
                                               disabled
                                               value=${(page.date)}>
                                    </div>
                                    <div class="form-group">
                                        <label for="neck">Шея:</label>
                                        <input class="form-control" type="number" step="0.1" max="100" id="neck"
                                               disabled
                                               value="${(page.neck)!}">
                                    </div>
                                    <div class="form-group">
                                        <label for="biceps">Бицепс:</label>
                                        <input class="form-control" type="number" step="0.1" max="100" id="biceps"
                                               disabled
                                               value="${(page.biceps)!}">
                                    </div>
                                    <div class="form-group">
                                        <label for="chest">Грудь:</label>
                                        <input class="form-control" type="number" step="0.1" max="500" id="chest"
                                               disabled
                                               value="${(page.chest)!}">
                                    </div>
                                </div>
                                <div class="col-xs-6">
                                    <div class="form-group">
                                        <label for="waist">Талия:</label>
                                        <input class="form-control" type="number" step="0.1" max="500" id="waist"
                                               disabled
                                               value="${(page.waist)!}">
                                    </div>
                                    <div class="form-group">
                                        <label for="hip">Бедро:</label>
                                        <input class="form-control" type="number" step="0.1" max="200" id="hip" disabled
                                               value="${(page.hip)!}">
                                    </div>
                                    <div class="form-group">
                                        <label for="calf">Голень:</label>
                                        <input class="form-control" type="number" step="0.1" max="200" id="calf"
                                               disabled
                                               value="${(page.calf)!}">
                                    </div>
                                    <div class="form-group">
                                        <label for="weight">Вес:</label>
                                        <input class="form-control" type="number" step="0.1" max="1000" id="weight"
                                               disabled
                                               value="${(page.weight)!}">
                                    </div>

                                </div>
                                <div class="form-group">
                                    <label for="note">Примечание:</label>
                                    <textarea class="form-control" rows="3" id="note"
                                              disabled>
                                        ${(page.note)!}
                                    </textarea>
                                </div>
                            <#--<div class="form-group">-->
                            <#--<label for="photo">Добавить фото:</label>-->
                            <#--<input type="file" accept="image/*" id="photo" disabled-->
                            <#--value="${page.photo}">-->
                            <#--</div>-->
                                <input class="btn btn-default" type="button" value="Разблокировать для изменения">

                            </div>
                        </form>
                    </div>
                </#list>

            <div class="item active">
                <form class="form-horizontal" method="post" action="/new">
                    <div class="row">
                        <div class="col-xs-6">
                            <div class="form-group">
                                <label for="new-date">Дата:</label>
                                <input class="form-control" type="date" id="new-date" name="date">
                            </div>
                        <#--<script>-->
                        <#--document.getElementById("new-date").valueAsDate = new Date();-->
                        <#--</script>-->
                            <div class="form-group">
                                <label for="new-neck">Шея:</label>
                                <input class="form-control" type="number" step="0.1" max="100" id="new-neck"
                                       name="neck">
                            </div>
                            <div class="form-group">
                                <label for="new-biceps">Бицепс:</label>
                                <input class="form-control" type="number" step="0.1" max="100" id="new-biceps"
                                       name="biceps">
                            </div>
                            <div class="form-group">
                                <label for="new-chest">Грудь:</label>
                                <input class="form-control" type="number" step="0.1" max="500" id="new-chest"
                                       name="chest">
                            </div>
                        </div>
                        <div class="col-xs-6">
                            <div class="form-group">
                                <label for="new-waist">Талия:</label>
                                <input class="form-control" type="number" step="0.1" max="500" id="new-waist"
                                       name="waist">
                            </div>
                            <div class="form-group">
                                <label for="new-hip">Бедро:</label>
                                <input class="form-control" type="number" step="0.1" max="200" id="new-hip" name="hip">
                            </div>
                            <div class="form-group">
                                <label for="new-calf">Голень:</label>
                                <input class="form-control" type="number" step="0.1" max="200" id="new-calf"
                                       name="calf">
                            </div>
                            <div class="form-group">
                                <label for="new-weight">Вес:</label>
                                <input class="form-control" type="number" step="0.1" max="1000" id="new-weight"
                                       name="weight">
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="new-note">Примечание:</label>
                        <textarea class="form-control" rows="3" id="new-note" name="note"></textarea>
                    </div>
                <#--<div class="form-group">-->
                <#--<label for="new-photo">Добавить фото:</label>-->
                <#--<input type="file" accept="image/*" id="new-photo">-->
                <#--</div>-->
                    <div class="form-group">
                        <input type="submit" value="Сохранить">
                    </div>
                </form>
            </div>
        </div>

        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="sr-only">Next</span>
        </a>

    </div>

</div>

</body>
</html>