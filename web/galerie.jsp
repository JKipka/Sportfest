<%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 05.12.2015
  Time: 00:51
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

    <title>Galerie</title>

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

                <div id="main_container" class="col-sm-8">
                    <div id="main_picture_container">
                       <div class="row" id="1">
                           <div class="col-sm-3">
                               <a href="" class="thumbnail">
                                   <img src="images/galery/50m.jpg" alt="50 Meter Lauf" style="width: 150px;height: auto;">
                               </a>
                           </div>
                           <div class="col-sm-3">
                               <a href="" class="thumbnail">
                                   <img src="images/galery/kids.JPG" alt="Kinder" style="width: 150px;height: auto;">
                               </a>
                           </div>
                           <div class="col-sm-3">
                               <a href="" class="thumbnail">
                                   <img src="images/galery/lauf.jpg" alt="Lauf" style="width: 150px;height: auto;">
                               </a>
                           </div>
                           <div class="col-sm-3">
                               <a href="" class="thumbnail">
                                   <img src="images/galery/sprung.jpg" alt="Sprung" style="width: 150px;height: auto;">
                               </a>
                           </div>

                       </div>

                        <div class="row" id="2">
                            <div class="col-sm-3">
                                <a href="" class="thumbnail">
                                    <img src="images/galery/50m.jpg" alt="50 Meter Lauf" style="width: 150px;height: auto;">
                                </a>
                            </div>
                            <div class="col-sm-3">
                                <a href="" class="thumbnail">
                                    <img src="images/galery/kids.JPG" alt="Kinder" style="width: 150px;height: auto;">
                                </a>
                            </div>
                            <div class="col-sm-3">
                                <a href="" class="thumbnail">
                                    <img src="images/galery/lauf.jpg" alt="Lauf" style="width: 150px;height: auto;">
                                </a>
                            </div>
                            <div class="col-sm-3">
                                <a href="" class="thumbnail">
                                    <img src="images/galery/sprung.jpg" alt="Sprung" style="width: 150px;height: auto;">
                                </a>
                            </div>
                        </div>

                    </div> <!--Main Artikel Container Ende-->

                </div>

                <div id="sidebar" class="col-sm-4">
                    <div id="main_sidebar">
                        <div class="artikel" style="padding-top: 25px">
                       <form role="form" action="/createcookie">
                           <label for="button">Lade Bilder vom Sportfest hoch:</label>
                           <button id="button" name="button" class="btn btn-default" value="imageUpload">Zum Bilder-Upload</button>
                       </form>
                        </div>
                    </div>

                </div>
            </div>
        </td>
    </tr>
</table>




</body>
</html>
