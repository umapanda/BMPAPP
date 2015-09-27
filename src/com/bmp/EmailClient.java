package com.bmp;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.*;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;


import java.util.*;
public class EmailClient {
	
	    public static void postMail(String recipients[], String subject, String message, String from,List<File> attachments,String host,String port,String smtpUser,String smtpPassword) throws MessagingException {

	        //boolean debug = false;

	        //Set the host smtp address
	        Properties props = new Properties();
	        props.put("mail.smtp.host", host);
	        props.put("mail.smtp.auth", "true");
	       props.put("mail.smtp.starttls.enable","true");
	       props.put("mail.smtp.port", port); // as required by Gmail

	        Authenticator auth = new Authenticator(){
	        	 public PasswordAuthentication getPasswordAuthentication() {
	 	            return new PasswordAuthentication(smtpUser, smtpPassword);
	 	        }
	        };
	        
	        Session session = Session.getDefaultInstance(props, auth);

	        //session.setDebug(debug);

	        // create a message
	        Message msg = new MimeMessage(session);

	        // set the from and to address
	        InternetAddress addressFrom = new InternetAddress(smtpUser);
	        msg.setFrom(addressFrom);

	        InternetAddress[] addressTo = new InternetAddress[recipients.length];
	        for (int i = 0; i < recipients.length; i++) {
	            addressTo[i] = new InternetAddress(recipients[i]);
	        }
	        msg.setRecipients(Message.RecipientType.TO, addressTo);

	        // Setting the Subject and Content Type
	        msg.setSubject(subject+" @ "+from);
	       // msg.setContent(message, "text/plain");
	        
	        //use a MimeMultipart as we need to handle the file attachments
	        Multipart multipart = new MimeMultipart();        
	        //add the message body to the mime message
	        BodyPart messageBodyPart = new MimeBodyPart();
	        messageBodyPart.setText(message);
	        multipart.addBodyPart(messageBodyPart);        
	        // add any file attachments to the message
	      //  addAtachments(attachments, multipart);
	        if (attachments != null && attachments.size() > 0) {
	            for (File aFile : attachments) {
	                MimeBodyPart attachPart = new MimeBodyPart();
	 
	                try {
	                    attachPart.attachFile(aFile);
	                } catch (IOException ex) {
	                    ex.printStackTrace();
	                }
	 
	                multipart.addBodyPart(attachPart);
	            }
	        }
	 
	        // sets the multi-part as e-mail's content
	        msg.setContent(multipart);
	        Transport.send(msg);

	    }

}
