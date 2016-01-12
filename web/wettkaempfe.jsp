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

    <script src="script/jquery-1.12.0.min.js"></script>
    <script src="script/bootstrap.js"></script>
    <script src="script/validate.js"></script>
    <link rel="stylesheet" type="text/css" href="script/bootstrap.css">
    <link rel="stylesheet" href="script/styles.css">


    <title>Wettkämpfe</title>

    <%
        String userLog = (String) session.getAttribute("loggedUser");
        String login = (String) session.getAttribute("login");
        if (userLog==null){session.setAttribute("loggedUser", "");}
        if (login==null) {session.setAttribute("login", "");}
        login = (String) session.getAttribute("login");
        Cookie[] cookies = request.getCookies();

        boolean userLoggedIn = false;

        if (cookies!=null){
            for(Cookie cookie1 : cookies){
                if (cookie1.getName().equals("user")) {
                    //wenn User-Cookie existiert
                    userLoggedIn = true;
                    String user = cookie1.getValue();
                    session.setAttribute("loggedUser", user);
                }
            }
        }

        if (!userLoggedIn){
            session.setAttribute("login", "Login"); //Kein User kann eingeloggt sein, wenn oben geprüfter Cookie nicht existiert
        }else{
            session.setAttribute("login", "Logout");
        }



    %>

    <%
        String profil1 = (String) session.getAttribute("profil");
        if (profil1==null){session.setAttribute("profil", "");} //wenn noch keine Session-Variable gesetzt wurde
        String login1 = (String) session.getAttribute("login");
        if (login!=null){ //wenn eine Login-Variable gesetzt wurde
            if (login=="Login"){
                //User ist ausgeloggt
            }else if(login=="Logout"){
                //User ist eingeloggt
                session.setAttribute("profil", "Mein Profil");
            }
        }

    %>

</head>


<body background="images/system/ball.jpg">
<table align="center">
    <tr>
        <td>
            <div class="row" id="main">


                <nav class="navbar navbar-inverse">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <a class="navbar-brand" href="index.jsp">Sportfest Hessen</a>
                        </div>
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="index.jsp">Home</a></li>
                            <li><a href="termine.jsp">Termine</a></li>
                            <li><a href="vereine.jsp">Vereine</a></li>
                            <li><a href="wettkaempfe.jsp">Wettkämpfe</a></li>
                            <li><a href="galerie.jsp">Galerie</a></li>
                            <li><a href="kontakt.jsp">Kontakt</a></li>
                            <li><a href="impressum.jsp">Impressum</a></li>
                        </ul>
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="userprofile.jsp?user=<%=session.getAttribute("loggedUser")%>"><%=session.getAttribute("profil")%></a></li>
                            <li><a href="/checkLogin.jsp"><%=session.getAttribute("login")%></a></li>
                        </ul>
                    </div>
                </nav>

                <!--

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
                                    <img src="images/system/50m.jpg" alt="50 Meter Lauf" style="width:200px;height:150px">
                                </a>
                            </div>
                            <div class="col-md-4">
                                <a href="100meterergebnisse.jsp" class="thumbnail">
                                    <p>100-Meter-Lauf</p>
                                    <img src="images/system/100m.jpg" alt="100 Meter Lauf" style="width:200px;height:150px">
                                </a>
                            </div>
                            <div class="col-md-4">
                                <a href="/weitsprungergebnisse.jsp" class="thumbnail">
                                    <p>Weitwurf</p>
                                    <img src="images/system/weitsprung.jpg" alt="Weitsprung" style="width:200px;height:150px">
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
