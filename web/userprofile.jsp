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
        if (con!=null){
            query = "SELECT * FROM mitglieder WHERE Email='"+user+"'";
            s= con.createStatement();
            rS = s.executeQuery(query);
            while(rS.next()){
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
                    <h2 style="padding-left: 10px">Benutzer-Informationen</h2>
                    <div style="float: left" id="container_list_user_information_editable" class="col-sm-4">
                        <ul>
                            <br>
                            <p>
                            <li>Vorname:     <input type="text" value=${vorname}></li>
                            <br>
                            <li>Nachname:    <input type="text" value=${nachname}></li>
                            <br>
                            <li>Verein:      <input type="text" value=${verein}></li>
                            </p>
                            <br>
                        </ul>
                    </div>

                    <div style="float: right" id="container_list_user_information_uneditable" class="col-sm-4">
                            <ul style="float: right">
                                <br>
                                <p>
                                <li>E-Mail: ${mail}</li>
                                <br>
                                <input type="submit" class="btn btn-default" value="E-Mail-Adresse ändern" onclick="">
                                <br>
                                <br>
                                <li>Passwort: <input type="password" value="abcdefgh" readonly></li>
                                <br>
                                </p>
                                <input type="button" class="btn btn-default" id="btn_submit" value="Password ändern" onclick="
                               /** var element = document.getElementById('passwordChange');
                                var style = window.getComputedStyle(element);
                                var state = style.getPropertyValue('display');

                                ShowPasswordChangeDiv(state)**/
                                PromptPasswordNew();
                                ">
                                <br>
                            </ul>





                    </div>

                    <div style="display: none" id="passwordChange">
                        <form action="" onsubmit="return myFunction()">
                            <br>
                            Altes Passwort eingeben: <input type="password" id="passwordOld">
                            <br>
                            Neues Passwort eingeben: <input type="password" id="pass1">
                            <br>
                            Neues Passwort wiederholen: <input type="password" id="pass2">
                            <br>
                            <br>
                            <input type="submit" value="Bestätigen">

                        </form>

                    </div>


                    <!--SCRIPT FOR CHECKING PASSWORDS-->
                    <script>
                        function myFunction() {
                            var passOld = "<%=password%>"
                            var passInput = document.getElementById("passwordOld").value;
                            if (passOld == passInput){
                                var pass1 = document.getElementById("pass1").value;
                                var pass2 = document.getElementById("pass2").value;
                                var ok = true;
                                if (pass1 != pass2) {
                                    //Passwordfelder rot markieren
                                    document.getElementById("pass1").style.borderColor = "#E34234";
                                    document.getElementById("pass2").style.borderColor = "#E34234";
                                    ok = false;
                                }


                            }else{
                                document.getElementById("passwordOld").style.borderColor = "#E34234";
                                ok = false;
                            }
                            return ok;
                        }
                    </script>
                    <!--END SCRIPT-->

                    <script>
                        function ShowPasswordChangeDiv(state){
                            if (state == 'none')
                                document.getElementById('passwordChange').style.display = 'block';
                            else
                                document.getElementById('passwordChange').style.display = 'none';

                        }

                    </script>


                    <script>
                        function PromptPasswordNew(){



                            var pass = "${passwort}";
                            while(true){
                                var passOld = prompt("Altes Passwort eingeben:");
                                var passNew = prompt("Neues Passwort eingeben:");
                                var passNewRep = prompt("Neues Passwort wiederholen:");

                                if (passOld == pass){
                                    if(passNew == passNewRep){
                                       break;
                                    }else{
                                        alert("Die neuen Passwörter stimmen nicht überein.");

                                    }
                                }else{
                                    alert("Das alte Passwort stimmt nicht.")
                                }
                            }


                        }

                    </script>

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
