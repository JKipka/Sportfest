<%--
  Created by IntelliJ IDEA.
  User: kipka
  Date: 05.12.2015
  Time: 00:51
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

    <title>Impressum</title>

    <%
        String userLog = (String) session.getAttribute("loggedUser");
        String login = (String) session.getAttribute("login");
        if (userLog==null){session.setAttribute("loggedUser", "");}
        if (login==null) {session.setAttribute("login", "");}
        login = (String) session.getAttribute("login");
        Cookie[] cookies = request.getCookies();

        boolean userLoggedIn = false;

        if (cookies!=null){
            for(Cookie cookie1 : cookies){
                if (cookie1.getName().equals("user")) {
                    //wenn User-Cookie existiert
                    userLoggedIn = true;
                    String user = cookie1.getValue();
                    session.setAttribute("loggedUser", user);
                }
            }
        }

        if (!userLoggedIn){
            session.setAttribute("login", "Login"); //Kein User kann eingeloggt sein, wenn oben geprüfter Cookie nicht existiert
        }else{
            session.setAttribute("login", "Logout");
        }



    %>

    <%
        String profil1 = (String) session.getAttribute("profil");
        if (profil1==null){session.setAttribute("profil", "");} //wenn noch keine Session-Variable gesetzt wurde
        String login1 = (String) session.getAttribute("login");
        if (login!=null){ //wenn eine Login-Variable gesetzt wurde
            if (login=="Login"){
                //User ist ausgeloggt
            }else if(login=="Logout"){
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
                            <li><a href="userprofile.jsp?user=<%=session.getAttribute("loggedUser")%>"><%=session.getAttribute("profil")%></a></li>
                            <li><a href="/checkLogin.jsp"><%=session.getAttribute("login")%></a></li>
                        </ul>
                    </div>
                </nav>

                <!--

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

                    </ul>

                  </ul>
                </div> <!--Navi Bar Ende**-->

                <div id="main_container" class="col-sm-12">
                    <div class='impressum'><h1>Impressum</h1><p>Angaben gemäß § 5 TMG</p><p>Stefan Mustermann <br>
                        Musterstrasse 1<br>
                        12345 Musterstadt <br>
                    </p><p> <strong>Vertreten durch: </strong><br>
                        Stefan Mustermann<br>
                    </p><p><strong>Registereintrag: </strong><br>
                        Eintragung im Vereinsregister.<br>
                        Registergericht: Zuckerberg<br>
                        Registernummer: 15253463<br></p><p><strong>Haftungsausschluss: </strong><br><br><strong>Haftung für Inhalte</strong><br><br>
                        Die Inhalte unserer Seiten wurden mit größter Sorgfalt erstellt. Für die Richtigkeit, Vollständigkeit und Aktualität der Inhalte können wir jedoch keine Gewähr übernehmen. Als Diensteanbieter sind wir gemäß § 7 Abs.1 TMG für eigene Inhalte auf diesen Seiten nach den allgemeinen Gesetzen verantwortlich. Nach §§ 8 bis 10 TMG sind wir als Diensteanbieter jedoch nicht verpflichtet, übermittelte oder gespeicherte fremde Informationen zu überwachen oder nach Umständen zu forschen, die auf eine rechtswidrige Tätigkeit hinweisen. Verpflichtungen zur Entfernung oder Sperrung der Nutzung von Informationen nach den allgemeinen Gesetzen bleiben hiervon unberührt. Eine diesbezügliche Haftung ist jedoch erst ab dem Zeitpunkt der Kenntnis einer konkreten Rechtsverletzung möglich. Bei Bekanntwerden von entsprechenden Rechtsverletzungen werden wir diese Inhalte umgehend entfernen.<br><br><strong>Haftung für Links</strong><br><br>
                        Unser Angebot enthält Links zu externen Webseiten Dritter, auf deren Inhalte wir keinen Einfluss haben. Deshalb können wir für diese fremden Inhalte auch keine Gewähr übernehmen. Für die Inhalte der verlinkten Seiten ist stets der jeweilige Anbieter oder Betreiber der Seiten verantwortlich. Die verlinkten Seiten wurden zum Zeitpunkt der Verlinkung auf mögliche Rechtsverstöße überprüft. Rechtswidrige Inhalte waren zum Zeitpunkt der Verlinkung nicht erkennbar. Eine permanente inhaltliche Kontrolle der verlinkten Seiten ist jedoch ohne konkrete Anhaltspunkte einer Rechtsverletzung nicht zumutbar. Bei Bekanntwerden von Rechtsverletzungen werden wir derartige Links umgehend entfernen.<br><br><strong>Urheberrecht</strong><br><br>
                        Die durch die Seitenbetreiber erstellten Inhalte und Werke auf diesen Seiten unterliegen dem deutschen Urheberrecht. Die Vervielfältigung, Bearbeitung, Verbreitung und jede Art der Verwertung außerhalb der Grenzen des Urheberrechtes bedürfen der schriftlichen Zustimmung des jeweiligen Autors bzw. Erstellers. Downloads und Kopien dieser Seite sind nur für den privaten, nicht kommerziellen Gebrauch gestattet. Soweit die Inhalte auf dieser Seite nicht vom Betreiber erstellt wurden, werden die Urheberrechte Dritter beachtet. Insbesondere werden Inhalte Dritter als solche gekennzeichnet. Sollten Sie trotzdem auf eine Urheberrechtsverletzung aufmerksam werden, bitten wir um einen entsprechenden Hinweis. Bei Bekanntwerden von Rechtsverletzungen werden wir derartige Inhalte umgehend entfernen.<br><br><strong>Datenschutz</strong><br><br>
                        Die Nutzung unserer Webseite ist in der Regel ohne Angabe personenbezogener Daten möglich. Soweit auf unseren Seiten personenbezogene Daten (beispielsweise Name, Anschrift oder eMail-Adressen) erhoben werden, erfolgt dies, soweit möglich, stets auf freiwilliger Basis. Diese Daten werden ohne Ihre ausdrückliche Zustimmung nicht an Dritte weitergegeben. <br>
                        Wir weisen darauf hin, dass die Datenübertragung im Internet (z.B. bei der Kommunikation per E-Mail) Sicherheitslücken aufweisen kann. Ein lückenloser Schutz der Daten vor dem Zugriff durch Dritte ist nicht möglich. <br>
                        Der Nutzung von im Rahmen der Impressumspflicht veröffentlichten Kontaktdaten durch Dritte zur Übersendung von nicht ausdrücklich angeforderter Werbung und Informationsmaterialien wird hiermit ausdrücklich widersprochen. Die Betreiber der Seiten behalten sich ausdrücklich rechtliche Schritte im Falle der unverlangten Zusendung von Werbeinformationen, etwa durch Spam-Mails, vor.<br>
                    </p><br>
                        Quelle: <a href="http://www.impressum-generator.de">Impressum Generator</a> der <a href="http://www.kanzlei-hasselbach.de/rechtsanwalt-koeln-rodenkirchen/">Kanzlei Hasselbach</a>
                    </div>



                </div>

            </div>
        </td>
    </tr>
</table>




</body>
</html>
