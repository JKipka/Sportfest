<%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 05.12.2015
  Time: 00:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Wettkämpfe</title>
</head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
<link rel="stylesheet" href="http://localhost:8080/styles.css">

<body>
<table align="center">
    <tr>
        <td>
            <div class="main">
                <div id="header_main">
                    <h1>Bundes-Jugend-Spiele Zuckerberg 2015</h1>
                </div>

                <div id="navi_bar">
                    <ul>
                        <li class="active"><a href="index.jsp">Home</a></li>
                        <li><a href="termine.jsp">Termine</a></li>
                        <li><a href="vereine.jsp">Vereine</a></li>
                        <li><a href="wettkaempfe.jsp">Wettkämpfe</a></li>
                        <li><a href="galerie.jsp">Galerie</a></li>
                        <li><a href="kontakt.jsp">Kontakt</a></li>
                        <li><a href="historie.jsp">Historie</a></li>
                        <li><a href="impressum.jsp">Impressum</a></li>
                        <ul style="float:right;list-style-type:none;">
                            <li><a href="/checkLogin.jsp"><%=session.getAttribute("login")%></a></li>
                        </ul>

                    </ul>
                </div> <!--Navi Bar Ende**-->

                <div id="main_container" style="border-right-style: none" class="col-sm-9">

                    <div class="liste_wett">
                        <h2>Wettkämpfe</h2><br>

                        <div class="row">
                            <div class="col-md-4">
                                <a href="50meterergebnisse.jsp" class="thumbnail">
                                    <p>50-Meter-Lauf</p>
                                    <img src="50m.jpg" alt="50 Meter Lauf" style="width:200px;height:150px">
                                </a>
                            </div>
                            <div class="col-md-4">
                                <a href="100meterergebnisse.jsp" class="thumbnail">
                                    <p>100-Meter-Lauf</p>
                                    <img src="100m.jpg" alt="100 Meter Lauf" style="width:200px;height:150px">
                                </a>
                            </div>
                            <div class="col-md-4">
                                <a href="/weitsprungergebnisse.jsp" class="thumbnail">
                                    <p>Weitwurf</p>
                                    <img src="weitsprung.jpg" alt="Weitsprung" style="width:200px;height:150px">
                                </a>
                            </div>
                        </div>
                        <!--
                        <ul>
                            <li>50-Meter-Lauf</li>
                            <a href="50meterergebnisse.jsp">Zu den Ergebnissen</a>
                            <br>
                            <br>
                            <li>100-Meter-Lauf</li>
                            <a href="100meterergebnisse.jsp">Zu den Ergebnissen</a>
                            <br>
                            <br>
                            <li>Weitsprung</li>
                            <a href="weitsprungergebnisse.jsp">Zu den Ergebnissen</a>
                            <br>
                        -->

                        </ul>
                    </div>
                </div>

                <div id="sidebar" class="col-sm-3">

                    <div>
                        <div class="artikel" style="padding-top: 25px">
                            <form action="login_home.jsp">
                                <button class="btn btn-default" type="submit">Ergebnisse eintragen</button>
                            </form>
                            <p>Um Ergebnisse eintragen zu können, müssen Sie ein Benutzerkonto besitzen.</p><br>
                        </div>
                    </div>

                </div>

            </div>
        </td>
    </tr>
</table>


</body>
</html>
