<%@ page import="javax.xml.crypto.Data" %>
<%@ page import="Database.DatabaseCon" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %><%--
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
    <link rel="stylesheet" href="script/styles.css">

    <title>Anmelden</title>


    <%
        //USER-INFORMATIONEN HOLEN
        String user = request.getParameter("user");
        String vorname = null;
        String nachname = null;
        String verein = null;
        String password = null;

        DatabaseCon dbCon = new DatabaseCon();
        Connection con = dbCon.getDBCon();
        ResultSet rS = null;
        Statement s = null;
        String query = null;
        if (con != null) {
            query = "SELECT * FROM mitglieder WHERE Email='" + user + "'";
            s = con.createStatement();
            rS = s.executeQuery(query);
            while (rS.next()) {
                vorname = rS.getString(1);
                nachname = rS.getString(2);
                password = rS.getString(5);
                verein = rS.getString(4);
            }
            request.setAttribute("vorname", vorname);
            request.setAttribute("nachname", nachname);
            request.setAttribute("verein", verein);
            request.setAttribute("passwort", password);
            request.setAttribute("mail", user);

            con.close();
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
                    String user3 = cookie1.getValue();
                    session.setAttribute("loggedUser", user3);
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
                    <h2 style="padding-left: 5px">Benutzerprofil</h2>
                    <div id="container_list_user_information_editable">
                        <form role="form" id="user_form" action="changeUserInformation.jsp" method="get">
                            <div id="headline">
                                <h3>Persönliche Informationen</h3>
                            </div>

                            <div class="form-group">
                                <label>Vorname:</label>
                                <input class="form-control" type="text"name="vorname" value="${vorname}">
                            </div>

                            <div class="form-group">
                                <label>Nachname:</label>
                                <input class="form-control" type="text" name="nachname" value="${nachname}">
                            </div>

                            <div class="form-group">
                                <label>Verein:</label>
                                <input class="form-control" type="text" name="verein" value="${verein}">
                            </div>

                            <div class="form-group">
                                <input type="submit" class="btn btn-default" value="Speichern">
                            </div>

                        </form>

                    </div>

                    <br>

                    <div id="container_list_user_information_uneditable">

                        <div id="head_acc">
                            <h3>Account-Informationen</h3>
                        </div>

                        <div class="form-group">
                            <label for="changemail" name="email">E-Mail: ${mail}</label>
                            <form role="form" action="" method="get">
                                <input type="submit" class="btn btn-default" id="changemail"
                                       value="E-Mail-Adresse ändern">
                            </form>
                        </div>

                        <br>

                        <div class="form-group">
                            <label>Passwort:</label>
                            <form role="form" action="http://localhost:8080/changePassword.jsp?user=${mail}"
                                  method="post">
                                <div class="form-group">
                                    <input type="password" class="btn btn-default" value="password" readonly>
                                </div>
                                <div class="form-group">
                                    <input type="submit" class="btn btn-default" id="btn-submit"
                                           value="Passwort ändern">
                                </div>
                            </form>
                        </div>

                        <!--
                                <li>E-Mail: </li>
                                <br>
                                <input type="submit" class="btn btn-default" value="E-Mail-Adresse ändern" onclick="">
                                </form>
                                <br>
                                <br>
                                <form role="form" action="http://localhost:8080/changePassword.jsp?user=${mail}" method="post">
                                <li>Passwort: <input type="password" value="abcdefgh" readonly></li>
                                <br>

                                <input type="submit" class="btn btn-default" id="btn_submit" value="Password ändern">
                                </form>
                                -->

                    </div>


                </div>

                <div id="sidebar" class="col-sm-4">
                    <div id="header_sidebar">
                        <h2 id="h2_news">Neuigkeiten</h2>
                    </div>

                    <div id="main_sidebar">
                        <div class="artikel">
                            <h3>Lorem mfka</h3>
                            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor
                                invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et
                                accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata
                                sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur
                                sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna
                                aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea
                                rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit
                                amet.</p>
                        </div>

                        <div class="artikel">
                            <h3>Lorem mfka</h3>
                            <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor
                                invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et
                                accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata
                                sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur
                                sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna
                                aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea
                                rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit
                                amet.</p>
                        </div>
                    </div>

                </div>
            </div>

        </td>
    </tr>
</table>


</body>
</html>
