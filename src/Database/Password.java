package Database;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by kipka on 12.01.2016.
 */
public class Password extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        String pw = req.getParameter("passNew");
        String user = (String) session.getAttribute("user");
        if (pw!=null&&user!=null){
            DatabaseCon dbCon = new DatabaseCon();
            Connection con = dbCon.getDBCon();
            String query = "UPDATE mitglieder SET Passwort='"+pw+"' WHERE Email='"+user+"'";
            Statement s;
            try {
                s = con.createStatement();
                s.executeUpdate(query);
                con.close();
                req.getRequestDispatcher("/userprofile.jsp?user="+user).forward(req,resp);
            }catch(SQLException e){
                try {
                    con.close();
                }catch(SQLException e1){
                    e1.printStackTrace();
                }

                req.getRequestDispatcher("/index.jsp").forward(req, resp);
            }

        }else{
            req.getRequestDispatcher("/index.jsp").forward(req,resp);
        }



    }

    public boolean matchPasswords(String old, String newP){
        if (old.equals(newP)){
            return true;
        }else{
            return false;
        }
    }

}
