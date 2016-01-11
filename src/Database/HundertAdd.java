package Database;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by kipka on 10.01.2016.
 */
public class HundertAdd extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Object vorname = req.getParameter("vorname");
        Object nachname = req.getParameter("nachname");
        Object zeit = req.getParameter("zeit");
        Object verein = req.getParameter("verein");

        DatabaseCon con = new DatabaseCon();
        Connection connection = con.getDBCon();
        String query;
        try {
            Statement s = connection.createStatement();
            query = "INSERT INTO 100meterlauf (Vorname, Nachname, Zeit, Verein) VALUES ('"+vorname+"','"+nachname+"','"+zeit+"','"+verein+"')";
            s.execute(query);
            req.getRequestDispatcher("/50meterergebnisse.jsp").forward(req,resp);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
