<%@ page import="Database.Anmelden" %>
<%@ page import="Database.DatabaseCon" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 04.12.2015
  Time: 19:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
    <script src="script/jquery-1.12.0.min.js"></script>
    <script src="script/bootstrap.js"></script>
    <script src="script/validate.js"></script>
    <link rel="stylesheet" type="text/css" href="script/bootstrap.css">
    <link rel="stylesheet" href=script/styles.css">

    <title>Anmeldung erfolgreich</title>
    <script type="text/javascript">
        function oeffnefenster (url) {
            fenster = window.open(url, "fenster1", "width=900,height=400,status=yes,scrollbars=yes,resizable=yes");
            fenster.focus();
        }
    </script>

    <%
        String token = request.getParameter("token");
        String user = request.getParameter("user");
        if (token!=null){
            DatabaseCon dbCon = new DatabaseCon();
            Connection con = dbCon.getDBCon();
            if (con!=null){
                String query = "UPDATE mitglieder SET confirmed='1' WHERE code='"+token+"' AND Email='"+user+"'";
                Statement s = con.createStatement();
                try {
                    s.executeUpdate(query);
                    request.setAttribute("headline", "Registrierung");
                    request.setAttribute("nachricht","Registrierung erfolgreich abgeschlossen");
                }catch (SQLException e){
                    e.printStackTrace();
                    request.setAttribute("nachricht", "Registrierung fehlgeschlagen!");
                }

            }
        }
    %>

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
                    <div id="container_form_register">
                        <h2>${headline}</h2>
                        <br>
                        <p></p>
                        <p>${nachricht}</p>

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

            </div>
        </td>
    </tr>
</table>




</body>
</html>
