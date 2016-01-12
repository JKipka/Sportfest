<%@ page import="Database.Anmelden" %>
<%@ page import="Database.DBConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="Database.DatabaseCon" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 04.12.2015
  Time: 19:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>





<head>
    <title>Passwort ändern</title>

    <script src="script/jquery-1.12.0.min.js"></script>
    <script src="script/bootstrap.js"></script>
    <script src="script/validate.js"></script>
    <link rel="stylesheet" type="text/css" href="script/bootstrap.css">
    <link rel="stylesheet" href="script/styles.css">


    <%
        String user = (String) request.getParameter("user");
        DatabaseCon dbCon = new DatabaseCon();
        Connection con = dbCon.getDBCon();
        String query;
        Statement s;
        String pw = "";
        ResultSet rS = null;
        if (user!=null){
            session.setAttribute("user", user);
            query = "SELECT (Passwort) FROM mitglieder WHERE Email='"+user+"'";
            s = con.createStatement();
            rS = s.executeQuery(query);
            while(rS.next()){
                pw = rS.getString(1);
                request.setAttribute("pw", pw);
            }

        }
        con.close();

    %>

    <%
        String profil1 = (String) session.getAttribute("profil");
        if (profil1==null){session.setAttribute("profil", "");} //wenn noch keine Session-Variable gesetzt wurde
        String login1 = (String) session.getAttribute("login");
        if (login1!=null){ //wenn eine Login-Variable gesetzt wurde
            if (login1=="Login"){
                //User ist ausgeloggt
            }else if(login1=="Logout"){
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
                <div id="header_main">
                    <h1>Bundes-Jugend-Spiele Zuckerberg 2015</h1>
                </div>

                <div id="main_container" class="col-sm-12">
                    <div id="container_form_register">
                        <form role="form" data-toggle="validator" id="submit-form" action="/password" method="post">
                            <div class="form-group">
                                <label>Altes Passwort:</label>
                                <input type="password" class="form-control" id="pass" name="pass" value=<%=pw%> required readonly>
                                <br>
                                <label>Altes Passwort:</label>
                                <input type="password" class="form-control" name="passOld" data-match="#pass" data-match-error="Passwörter stimmen nicht überein." required>
                                <div class="help-block with-errors"></div>
                            </div>
                            <br>
                            <div class="form-group">
                                <label for="inputPassword">Neues Passwort:</label>
                                <input type="password" id="inputPassword" class="form-control" name="passNew" required>
                                <br>
                                <label for="inputPasswordConf">Neues Passwort bestätigen:</label>
                                <input type="password" class="form-control" name="passConf" id="inputPasswordConf" data-match="#inputPassword" data-match-error="Passwörter stimmten nicht überein" required>
                                <div class="help-block with-errors"></div>
                            </div>
                            <br>
                            <input class="btn btn-default" id="submit-btn" type="submit" value="Bestätigen">
                        </form>




                        <!--SCRIPT FOR CHECKING PASSWORDS-->
                            <script type="text/javascript">
                                function myFunction() {



                                    var passAct = ${pw};
                                    var passOld = document.getElementById("passOld").value();
                                    var pass1 = document.getElementById("passNew").value;
                                    var pass2 = document.getElementById("passConf").value;
                                    var ok = true;

                                    if(passAct == passOld){
                                        if (pass1 != pass2) {
                                            //Passwordfelder rot markieren
                                            document.getElementById("passNew").style.borderColor = "#E34234";
                                            document.getElementById("passConf").style.borderColor = "#E34234";
                                            ok = false;
                                        }

                                        return ok;
                                    }else{
                                        document.getElementById("passOld").style.borderColor = "#E34234";
                                        ok = false;
                                    }
                                }
                            </script>
                            <!--END SCRIPT-->




                    </div>

                </div>



            </div>
        </td>
    </tr>
</table>





</body>
</html>
