package Database;

import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.mail.*;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.concurrent.ExecutionException;

import org.apache.commons.fileupload.FileItem;

/**
 * Created by kipka on 12.01.2016.
 */
public class ImageUpload extends HttpServlet {

    private boolean isMultiUpload;
    private String filePath;
    private int maxFileSize = 50 * 1024;
    private int maxMemSize = 4 * 1024;
    File file ;
    File uploadDir;
    String pathToFile = null;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Check that we have a file upload request
        isMultiUpload = ServletFileUpload.isMultipartContent(req);
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter( );
        if( !isMultiUpload){
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet upload</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<p>No file uploaded</p>");
            out.println("</body>");
            out.println("</html>");
            return;
        }


        FileItemFactory factory = new DiskFileItemFactory();

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);


        try {
            // Parse the request to get file items.
            List<FileItem> fileItems = upload.parseRequest(req);

            for (FileItem item:fileItems){

                uploadDir = new File("C:\\Users\\kipka\\IdeaProjects\\Sportfest\\web\\images\\galery\\");
                file = File.createTempFile("img",".jpg",uploadDir);
                pathToFile = file.getPath();
                item.write(file);

            }
            Cookie[] cookies = req.getCookies();
            String user = null;
            boolean cookieExists = false;
            if (cookies != null) {
                for (Cookie cookie1 : cookies) {
                    if (cookie1.getName().equals("user")) {
                        user = cookie1.getValue();
                    }
                }
            }
            boolean success = false;
            if (user!=null && pathToFile!=null){
                success = sendNotificationMailToAdmin(user, pathToFile, fileItems.size());
            }
            if(success){
                req.getRequestDispatcher("/success.html").forward(req,resp);
            }else
                out.print("Error");


        }catch (FileUploadException e){
            e.printStackTrace();
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    private boolean sendNotificationMailToAdmin(String user, String pathToFile, int fileAnzahl){
        String empfaengerAdmin = "sportfesthessen@gmail.com";
        String empfaenger = user;
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

        try {
            Message message = new MimeMessage(session);

            message.setFrom(new InternetAddress(absender));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(empfaengerAdmin));
            message.setSubject("Neues Foto wurde von Mitglied " + user + " hochgeladen");
            String messageText = "<h3>Hallo Admin!</h3><br><p>Das Mitglied " + user + " hat soeben " + fileAnzahl + " Foto(s) zur Galerie hinzugefügt.</p> <br>" +
                    "<p>Das neue Bild ist unter der URL <a href=\"file://" + pathToFile + "\">"+pathToFile+"</a> zu finden und kann nun von dir bearbeitet und eingebunden werden.</p><br>" +
                    "<p>Grueße, </p><br><h3>Jan vom Sportfest Hessen Team</h3>";
            message.setContent(messageText, "text/html; charset=utf-8");
            // Send message
            Transport.send(message);
            System.out.print("Mail gesendet");

            Message message2 = new MimeMessage(session);

            message2.setFrom(new InternetAddress(absender));
            message2.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user));
            message2.setSubject("Foto wurde hochgeladen");
            String messageText2 = "<h3>Hallo!</h3><br><p>Danke, dass du ein Bild zu unserer Galerie hinzufügen willst.</p> <br>" +
                    "<p>Wir haben dein Bild erhalten und werden es nun prüfen. Wenn wir dein Bild freigegeben haben, wirst du wieder von uns erfahren.</p><br>" +
                    "<p>Bis dahin viele Grüße, </p><br><h3>Jan vom Sportfest Hessen Team</h3>";
            message2.setContent(messageText2, "text/html; charset=utf-8");
            // Send message
            Transport.send(message2);
            System.out.print("Mail gesendet");

            return true;

        }catch (AddressException e){

            e.printStackTrace();
            return false;
        }catch(MessagingException e1){
            e1.printStackTrace();
            return false;
        }


    }
}
