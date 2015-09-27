package com.bmp;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class EmailSendingServlet
 */
@WebServlet("/EmailSendingServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,   // 2MB
maxFileSize = 1024 * 1024 * 10,         // 10MB
maxRequestSize = 1024 * 1024 * 50)      // 50MB
public class EmailSendingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public EmailSendingServlet() {
        // TODO Auto-generated constructor stub
    }

    private String host;
    private String port;
    private String user;
    private String pass;
 
    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = context.getInitParameter("host");
        port = context.getInitParameter("port");
        user = context.getInitParameter("user");
        pass = context.getInitParameter("pass");
    }
 
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // reads form fields
        String sender = request.getParameter("sender");
        String subject = request.getParameter("subject");
        String content = request.getParameter("emailcontent");
 
        String resultMessage = "";
        String color = "";
 
        try {
        	String[] rec ={"register.complainbmp@gmail.com"};
 	       List<File> uploadedFiles = saveUploadedFiles(request);
 	       EmailClient.postMail(rec, subject, content, sender, uploadedFiles,host,port,user, pass);
            resultMessage = "'Mail sent successfully'";
            color="'green'";
        } catch (Exception ex) {
            ex.printStackTrace();
            resultMessage = "'Failed to Send Mail.  Please try Later.'";
            color="'red'";
        } finally {
            request.setAttribute("Message", resultMessage);
            request.setAttribute("color", color);
            getServletContext().getRequestDispatcher("/Home.jsp").forward(request, response);
        }
    }
    private List<File> saveUploadedFiles(HttpServletRequest request)
            throws IllegalStateException, IOException, ServletException {
        List<File> listFiles = new ArrayList<File>();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;
        Collection<Part> multiparts = request.getParts();
        if (multiparts.size() > 0) {
            for (Part part : request.getParts()) {
                // creates a file to be saved
                String fileName = extractFileName(part);
                if (fileName == null || fileName.equals("")) {
                    // not attachment part, continue
                    continue;
                }
                 
                File saveFile = new File(fileName);
                System.out.println("saveFile: " + saveFile.getAbsolutePath());
                FileOutputStream outputStream = new FileOutputStream(saveFile);
                 
                // saves uploaded file
                InputStream inputStream = part.getInputStream();
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }
                outputStream.close();
                inputStream.close();
                 
                listFiles.add(saveFile);
            }
        }
        return listFiles;
    }
    
    /**
     * Retrieves file name of a upload part from its HTTP header
     */
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return null;
    }
     
 
    
}
