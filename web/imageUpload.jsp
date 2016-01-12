<%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 12.01.2016
  Time: 21:07
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
    <title>Test Upload</title>


    <%
        Cookie[] cookies = request.getCookies();
        boolean cookieExists = false;
        if (cookies != null) {
            for (Cookie cookie1 : cookies) {
                if (cookie1.getName().equals("sparte")) {
                    cookieExists = true;
                    //wenn User-Cookie existiert
                    //Cookie-Informationen leeren
                    cookie1.setMaxAge(0);
                    cookie1.setPath("/");
                    //alten Cookie mit leerem Cookie überschreiben
                    response.addCookie(cookie1);
                }
            }
        }

        if (!cookieExists) {
            Cookie sparte = new Cookie("sparte", "imageUpload");
            sparte.setMaxAge(2 * 60);
            response.addCookie(sparte);
        }


    %>

    <%
        Cookie[] cookies1 = request.getCookies();
        boolean userLoggedIn = false;
        if (cookies != null) {
            for (Cookie cookie1 : cookies) {
                if (cookie1.getName().equals("user")) {
                    //wenn User-Cookie existiert
                    //Cookie-Informationen leeren
                    userLoggedIn = true;
                }
            }
        }

        if (!userLoggedIn) {
            response.sendRedirect("/login.jsp");
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
                            <li>
                                <a href="userprofile.jsp?user=<%=session.getAttribute("loggedUser")%>"><%=session.getAttribute("profil")%>
                                </a></li>
                            <li><a href="/checkLogin.jsp"><%=session.getAttribute("login")%>
                            </a></li>
                        </ul>
                    </div>
                </nav>

                <div class="col-sm-12" id="main_container">

                    <h3>Bilder-Upload</h3>

                    <div style="padding-top: 25px; padding-bottom: 25px;">
                        <form role="form" action="/imageupload" encType="multipart/form-data" method="post">
                    <label for="input_file">Zum Hochladen neuer Fotos, drücken sie auf diesen Button:</label>

                    <div style="position:relative;">
                        <a class='btn btn-primary' href='javascript:;'>
                            Choose File...
                            <input type="file" id="input_file"
                                   style='position:absolute;z-index:2;top:0;left:0;filter: alpha(opacity=0);-ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";opacity:0;background-color:transparent;color:transparent;'
                                   name="file" size="40" onchange='$("#upload-file-info").html($(this).val());'>
                        </a>
                        &nbsp;
                        <span class='label label-info' id="upload-file-info"></span>
                    </div>
                            <br>

                            <div>
                                <input type="submit" class="btn btn-default" id="btn_submit" value="Hochladen">
                            </div>

                        </form>
                    </div>






                </div>

                <script>
                    function processImage(){
                        var url =
                        alert(url);
                    }
                </script>


            </div>
        </td>
    </tr>

</body>
</html>
