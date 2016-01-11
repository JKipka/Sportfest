<%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 04.12.2015
  Time: 15:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sportfest Zuckerberg 2016</title>
    <script type="text/javascript">
      function oeffnefenster (url) {
        fenster = window.open(url, "fenster1", "width=900,height=400,status=yes,scrollbars=yes,resizable=yes");
        fenster.focus();
      }
    </script>

    <%
      Cookie[] cookies = request.getCookies();
      boolean userLoggedIn = false;
      if (cookies!=null){
        for(Cookie cookie1 : cookies){
          if (cookie1.getName().equals("user")) {
            //wenn User-Cookie existiert
            userLoggedIn = true;
          }
        }
      }

      if (!userLoggedIn){
        session.setAttribute("login", "Login"); //Kein User kann eingeloggt sein, wenn oben geprüfter Cookie nicht existiert
      }
    %>
  </head>
  <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">

  <!-- Optional theme -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">

  <!-- Latest compiled and minified JavaScript -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="http://localhost:8080/styles.css">

  <body>
  <table align="center">
    <tr>
      <td>
        <div class="main">
          <div id="header_main">
            <h1>Sportfest Zuckerberg 2016</h1>
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
            <div id="main_artikel_container">
              <div class="artikel_main">
                <h3>Lorem mfka</h3>
               <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>
              </div>

              <div class="artikel_main">
               <h3>Lorem mfka</h3>
                <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>
              </div>

              <div class="artikel_main">
                <h3>Lorem mfka</h3>
                <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>
              </div>

              <div class="artikel_main">
                <h3>Lorem mfka</h3>
                <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>
              </div>

              <div class="artikel_main">
                <h3>Lorem mfka</h3>
                <p>Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.</p>
              </div>

            </div> <!--Main Artikel Container Ende-->

          </div>

          <div id="sidebar" class="col-sm-4">
            <div id="header_sidebar">
              <h2 id="h2_news">Neuigkeiten</h2>
            </div>
            <div id="main_sidebar">
              <a class="twitter-timeline" href="https://twitter.com/SportfestHessen" data-widget-id="685467925436854272">Tweets von @SportfestHessen </a>
              <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+"://platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>

            </div>

          </div>
      </td>
    </tr>
  </table>




  </body>
</html>
