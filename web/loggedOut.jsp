<%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 05.12.2015
  Time: 00:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="http://localhost:88/sportfest/styles.css">
    <title>Title</title>
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

                <div id="main_container">
                    <div id="container_form_register">
                        <h2>Erfolgreich abgemeldet.</h2>
                        <p>Sie wurden erfolgreich abgemeldet.</p>

                    </div>

                </div>

                <div id="sidebar">
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