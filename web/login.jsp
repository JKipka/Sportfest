<%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 04.12.2015
  Time: 19:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
<link rel="stylesheet" href="http://localhost:8080/styles.css">
<head>
    <title>Anmelden</title>
    <script type="text/javascript">
        function oeffnefenster (url) {
            fenster = window.open(url, "fenster1", "width=900,height=400,status=yes,scrollbars=yes,resizable=yes");
            fenster.focus();
        }
    </script>
</head>
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

                <div id="main_container" class="col-sm-8">
                    <div id="container_form_login">
                    <h2>Anmelden</h2>
                    <form action="/anmelden" method="post">
                        E-Mail: <br>
                        <input type="text" name="mail"><br>
                        <br>
                        Password: <br>
                        <input type="password" name="passwort">
                        <br><br>
                        <input type="submit" name="submit" value="Anmelden">
                        <br>
                        <br>
                        <h2>oder</h2>
                    </form>
                    </div>


                    <div id="container_form_register">
                        <h2>Registrieren</h2>
                        <br>
                        <form role="form" action="/registrieren" onsubmit="return myFunction()" method="post">
                            <div class="form-group">
                                 <label>Vorname:</label>
                                 <input type="text" class="form-control" name="vorname">
                            </div>
                            <br><br>
                            <div class="form-group">
                                <label>Nachname:</label>
                                <input type="text" class="form-control" name="nachname">
                            </div>
                            <br><br>
                            <div class="form-group">
                                <label>E-Mail::</label>
                                <input type="email" class="form-control" name="mail">
                            </div>
                            <br><br>

                            <div class="form-group">
                                <label>Passwort:</label>
                                <input id="pass" type="password" class="form-control" name="passwort">
                            </div>
                            <br><br>

                            <div class="form-group">
                                <label>Passwort bestätigen:</label>
                                <input id="pass2" type="password" class="form-control" name="passwort_conf">
                            </div>
                            <br><br>

                            <div class="form-group">
                                <label>Verein:</label>
                                <input type="text" class="form-control" name="verein">
                            </div>
                            <br><br>
                            <input class="btn btn-default" type="submit" value="Registrieren">

                            <!--SCRIPT FOR CHECKING PASSWORDS-->
                            <script>
                                function myFunction() {
                                    var pass1 = document.getElementById("pass1").value;
                                    var pass2 = document.getElementById("pass2").value;
                                    var ok = true;
                                    if (pass1 != pass2) {
                                        //Passwordfelder rot markieren
                                        document.getElementById("pass1").style.borderColor = "#E34234";
                                        document.getElementById("pass2").style.borderColor = "#E34234";
                                        ok = false;
                                    }

                                    return ok;
                                }
                            </script>
                            <!--END SCRIPT-->

                        </form>

                    </div>

                </div>

                <div id="sidebar" class="col-sm-4">
                    <div id="header_sidebar">
                        <h2 id="h2_news">Neuigkeiten</h2>
                    </div>

                    <div id="main_sidebar">
                        <div class="artikel">
                            <h3>Lorem mfka</h3>
                            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>
                        </div>

                        <div class="artikel">
                            <h3>Lorem mfka</h3>
                            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>
                        </div>
                    </div>

                </div>


        </td>
    </tr>
</table>




</body>
</html>
