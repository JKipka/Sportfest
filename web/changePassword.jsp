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
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
<link rel="stylesheet" href="http://localhost:8080/styles.css">
<head>
    <title>Anmeldung erfolgreich</title>
    <script type="text/javascript">
        function oeffnefenster (url) {
            fenster = window.open(url, "fenster1", "width=900,height=400,status=yes,scrollbars=yes,resizable=yes");
            fenster.focus();
        }
    </script>



    <%
        String user = (String) request.getParameter("user");
        DatabaseCon dbCon = new DatabaseCon();
        Connection con = dbCon.getDBCon();
        String query;
        Statement s;
        String pw;
        ResultSet rS = null;
        if (user!=null){
            request.setAttribute("user", user);
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

    <!--SCRIPT FOR CHECKING PASSWORDS-->
    <script>
        function myFunction() {
            var passAct = ${pw};
            var passOld = document.getElementById("passOld").value();
            var pass1 = document.getElementById("passNew").value;
            var pass2 = document.getElementById("passConf").value;
            var ok = true;

            if(passAct == passOld){
                if (pass1 != pass2) {
                    //Passwordfelder rot markieren
                    document.getElementById("pass1").style.borderColor = "#E34234";
                    document.getElementById("pass2").style.borderColor = "#E34234";
                    ok = false;
                }

                return ok;
            }else{
                document.getElementById("passOld").style.borderColor = "#E34234";
                ok = false;
            }
            return ok;


        }
    </script>
    <!--END SCRIPT-->

</head>
<body>
<table align="center">
    <tr>
        <td>
            <div class="main">
                <div id="header_main">
                    <h1>Bundes-Jugend-Spiele Zuckerberg 2015</h1>
                </div>

                <div id="main_container" class="col-sm-12">
                    <div id="container_form_register">
                        <form role="form" action="/check.jsp?user=<%=user%> method="post">
                            <div class="form-group">
                                <label>Altes Passwort:</label>
                                <input type="password" class="form-control" name="passOld">
                            </div>
                            <br>
                            <div class="form-group">
                                <label>Neues Passwort:</label>
                                <input type="password" class="form-control" name="passNew">
                            </div>
                            <br>
                            <div class="form-group">
                                <label>Neues Passwort bestätigen:</label>
                                <input type="password" class="form-control" name="passConf">
                            </div>
                            <br>
                            <input class="btn btn-default" type="submit" value="Bestätigen">


                        </form>

                    </div>

                </div>

            </div>
        </td>
    </tr>
</table>





</body>
</html>
