<%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 10.01.2016
  Time: 21:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        //checkLogin.jsp
        String loginSession = (String) session.getAttribute("login");
        if (loginSession == "Login"){
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }else if(loginSession == "Logout"){
            request.getRequestDispatcher("/servlets/logout.jsp").forward(request,response);
        }else{
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }
    %>
</head>
<body>

</body>
</html>
