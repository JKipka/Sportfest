<%@ page import="Database.DatabaseCon" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="javax.swing.*" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 11.01.2016
  Time: 23:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Passwort bestätigen</title>
    <%
        String pw = request.getParameter("passNew");
        String user = request.getParameter("user");
        if (pw!=null&&user!=null){
            DatabaseCon dbCon = new DatabaseCon();
            Connection con = dbCon.getDBCon();
            String query = "UPDATE mitglieder SET Passwort='"+pw+"' WHERE Email='"+user+"'";
            Statement s = con.createStatement();
            try {
                s.executeUpdate(query);
                con.close();
                request.getRequestDispatcher("/userprofile.jsp").forward(request,response);
            }catch(SQLException e){
                con.close();
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }

        }

    %>
</head>
<body>

</body>
</html>
