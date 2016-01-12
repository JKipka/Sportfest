<%@ page import="Database.DatabaseCon" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %><%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 12.01.2016
  Time: 23:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change</title>

    <%
        DatabaseCon dbCon = new DatabaseCon();
        Connection con = dbCon.getDBCon();
        String user = (String) session.getAttribute("loggedUser");
        String vorname = request.getParameter("vorname");
        String nachname = request.getParameter("nachname");
        String verein = request.getParameter("verein");
        String query = "UPDATE mitglieder SET Vorname='"+vorname+"', Nachname='"+nachname+"', Verein='"+verein+"' WHERE Email='"+user+"'";
        Statement s = con.createStatement();
        s.execute(query);
        con.close();

        request.getRequestDispatcher("/userprofile.jsp?user="+user).forward(request,response);

    %>
</head>
<body>

</body>
</html>
