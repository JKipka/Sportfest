<%@ page import="Database.DatabaseCon" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 12.01.2016
  Time: 00:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Check</title>

    <%
        String user = request.getParameter("user");
        String pwOld = request.getParameter("passOld");
        String pwAct = request.getParameter("pw");
        String pwNew = request.getParameter("passNew");
        String pwConf = request.getParameter("passConf");

        if (pwOld == pwAct){
            if (pwNew == pwConf){
                request.getRequestDispatcher("/confirmPasswort.jsp?user="+user).forward(request,response);
            }else{

            }
        }




    %>

</head>
<body>

</body>
</html>
