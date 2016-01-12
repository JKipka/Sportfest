package Database;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.swing.*;
import java.io.IOException;
import java.sql.*;

/**
 * Created by kipka on 04.12.2015.
 */
public class Anmelden extends HttpServlet {

    boolean isLoggedIn = false;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Object mail = req.getParameter("mail");

        Object password = req.getParameter("passwort");
        HttpSession session = req.getSession();
        DatabaseCon dbCon = new DatabaseCon();
        Connection con;

        try {
            Class.forName("com.mysql.jdbc.Driver");

        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }

        try {
            con = dbCon.getDBCon();

            if (dbCon!=null){

                Cookie currentUser = new Cookie("user", (String) mail);
                currentUser.setMaxAge(60*10); //Session Länge des Users bei 15 Minuten, danach ist ein neuer Log-In nötig
                req.setAttribute("message", "Anmeldung erfolgreich!");
                req.setAttribute("mail", mail);
                session.setAttribute("login","Logout"); //Logout wird als Linktext angezeigt
                resp.addCookie(currentUser);

                String sparte = null;
                Cookie[] cookies = req.getCookies();

                if (cookies!=null){
                    for(Cookie cookie1 : cookies){
                        if (cookie1.getName().equals("sparte")) {
                            //wenn User-Cookie existiert
                            sparte = cookie1.getValue();
                        }
                    }
                }else{
                    //wenn keine Cookies da, wird nicht passieren
                    resp.sendRedirect("login.jsp");
                }
                if (sparte!=null){
                    resp.sendRedirect(sparte+".jsp");
                }else{
                    req.getRequestDispatcher("userprofile.jsp?user="+mail).forward(req,resp);
                }

            }else{
                isLoggedIn = false;
                req.setAttribute("message", "Anmeldung fehlgeschlagen. Benutzername oder Passwort ist falsch");
                req.getRequestDispatcher("login.jsp").forward(req,resp);
            }


        } catch (Exception e) {

            e.printStackTrace();
        }
    }

    private boolean checkLogIn(Connection con, Object mail, Object password){
        try {
            boolean success = false;
            Statement sT = con.createStatement();

            mail = (String) mail;

            password = (String) password;
            String sql = "SELECT * FROM mitglieder WHERE Email='"+mail+"' AND Passwort='" + password + "'";
            System.out.println(sql);
            try {
                ResultSet rS = sT.executeQuery(sql);
                if (!rS.isBeforeFirst() ) {
                   return false;
                }else{
                    return true;
                }

            }catch (SQLException e1){
                con.close();
                return success;
            }




        } catch (SQLException e){
            e.printStackTrace();
        }

        return false;
    }

}
