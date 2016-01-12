package Database;

import com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import javax.activation.*;
import java.io.IOException;
import javax.mail.*;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

/**
 * Created by kipka on 04.12.2015.
 */
public class DBConnection extends HttpServlet {
    String token;
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        Object vorname = req.getParameter("vorname");
        Object nachname = req.getParameter("nachname");
        Object mail = req.getParameter("mail");
        Object verein = req.getParameter("verein");
        Object password = req.getParameter("passwort");
        System.out.println(vorname + "," + nachname + "," + mail + "," + verein + "," + password);

        try {
            Class.forName("com.mysql.jdbc.Driver");

        }catch (ClassNotFoundException e){
            e.printStackTrace();
        }

        try {

            Connection connection = null;

            try {

            } catch (Exception e) {

                // TODO Auto-generated catch block
                e.printStackTrace();
                JOptionPane
                        .showMessageDialog(
                                null,
                                "Error while connecting to SQL Database. Check your database choice from the dropdown list.\n Description: "
                                        + e.toString());
            }
            connection = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/sportfest", "root", "");
            updateDatabase(connection, nachname, vorname, mail, verein, password, req, resp);
            sendConfirmationMail(mail, vorname, token);
            req.setAttribute("message", "Registrierung erfolgreich! <br> Check deine Mails, um deinen Account zu bestätigen!");
            req.getRequestDispatcher("register_erfolgreich.jsp").forward(req, resp);

        } catch (Exception e) {

            e.printStackTrace();
        }

    }

    private void updateDatabase(Connection con, Object nachname, Object vorname, Object mail, Object verein, Object password, HttpServletRequest req, HttpServletResponse resp) {
        try {
            Statement sT = con.createStatement();
            nachname = (String) nachname;
            vorname = (String) vorname;
            mail = (String) mail;
            verein = (String) verein;
            password = (String) password;
            token = generateToken();
            String sql = "INSERT INTO mitglieder (Vorname, Nachname, Email, Verein, Passwort, code, confirmed) VALUES ('" + vorname + "','" + nachname + "','" + mail + "','" + verein + "','" + password + "','"+token+"','0')";
            System.out.println(sql);
            sT.executeUpdate(sql);
            con.close();
        } catch (SQLException e){
            e.printStackTrace();
            if(e.toString().contains("key")){
                req.setAttribute("vorname", vorname);
                req.setAttribute("nachname", nachname);
                req.setAttribute("mail", mail);
                req.setAttribute("password", password);
                req.setAttribute("verein", verein);
                try {
                    req.getRequestDispatcher("registrieren_error.jsp").forward(req,resp);
                } catch (ServletException e1) {
                    e1.printStackTrace();
                } catch (IOException e1) {
                    e1.printStackTrace();
                }
            }
        }


    }

    public DBConnection(){

    }

    private void sendConfirmationMail(Object mail, Object vorname, String token){
        try {
            String empfaenger = (String) mail;
            String name = (String) vorname;
            String absender = "sportfesthessen@gmail.com";
            String password = "peterlustig12";
            Properties properties = new Properties();
            properties.put("mail.smtp.auth", "true");
            properties.put("mail.smtp.starttls.enable", "true");
            properties.put("mail.smtp.host", "smtp.gmail.com");
            properties.put("mail.smtp.port", "587");
            Session session = Session.getInstance(properties, new javax.mail.Authenticator(){
                protected PasswordAuthentication getPasswordAuthentication(){
                    return new PasswordAuthentication(absender,password);
                }
            });


            Message message = new MimeMessage(session);


            message.setFrom(new InternetAddress(absender));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(empfaenger));
            message.setSubject("Registrierung abschließen");
            String link = "\"http://www.localhost:8080/activate.jsp?token="+token+"&user="+empfaenger+"\"";
            String messageText = "<h2>Hey " + name + "!</h2><br><h4>Du hast dich für das Sportfest registriert.<br>" +
                    "Um die Registrierung abzuschließen, klicke auf den folgenden Link: <br>" +
                    "<a href="+link+">http://www.localhost:8080/activate.jsp?token="+token+"&user="+empfaenger+"</a> <br> " +
                    "<br>" +
                    "Beste Grüße, <br> " +
                    "Jan vom Sportfest Hessen";


            message.setContent(messageText, "text/html; charset=utf-8");

            // Send message
            Transport.send(message);
            System.out.print("Mail gesendet");


        }catch (AddressException e) {
            e.printStackTrace();
        } catch (javax.mail.MessagingException e) {
            e.printStackTrace();
        }

    }

    private String generateToken(){
        String range = "123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefgh";
        String token = "";
        int n = range.length();
        char placeholder;
        Random r = new Random();

        for (int i = 0; i < 11; i++) {
            placeholder = range.charAt(r.nextInt(n));
            token += placeholder;
        }

        System.out.println(token);



        return token;
    }
}
