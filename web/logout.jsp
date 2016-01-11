<%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 08.01.2016
  Time: 22:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Logged out</title>
</head>
<body>

<%
    Cookie[] cookies = request.getCookies();
    if (cookies!=null){
        for(Cookie cookie1 : cookies){
            if (cookie1.getName().equals("user")) {
                //wenn User-Cookie existiert
                //Cookie-Informationen leeren
                cookie1.setMaxAge(0);
                cookie1.setPath("/");
                //alten Cookie mit leerem Cookie überschreiben
                response.addCookie(cookie1);
                System.out.println("Ausgeloggt");
            }
        }
    }

    session.setAttribute("login", "Login"); //Login wird angezeigt
    request.getRequestDispatcher("/login.jsp").forward(request,response);

%>

</body>
</html>
