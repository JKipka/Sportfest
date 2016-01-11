package Database;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by kipka on 05.12.2015.
 */
public class CreateCookie extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Object sparte = req.getParameter("button"); //Wert des Buttons einholen, der gedrückt wurde
        /**
        if (sparte==null){
            sparte = req.getParameter("100meterlauf");
            if (sparte==null){
                sparte = req.getParameter("weitsprung");
            }
        }
         **/

        System.out.print(sparte);
        Cookie spartenCookie = new Cookie("sparte",(String) sparte); //Sparten Cookie definieren
        spartenCookie.setMaxAge(60*5); //Laufzeit 5 Minuten
        resp.addCookie(spartenCookie); //Cookie hinzufügen
        boolean userIsLoggedIn = false;
        Cookie[] cookies = req.getCookies();

        if (cookies!=null){
            for(Cookie cookie1 : cookies){
                if (cookie1.getName().equals("user")) {
                    //wenn User-Cookie existiert
                    userIsLoggedIn = true;
                 }
            }
        }else{
            //wenn keine Cookies da
            resp.sendRedirect("login.jsp");
        }
        if (userIsLoggedIn){
            resp.sendRedirect(sparte+".jsp");
        }else{
            resp.sendRedirect("login.jsp");
        }
    }
}
