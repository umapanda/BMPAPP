package com.bmp;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SMSServlet
 */
@WebServlet("/SMSServlet")
public class SMSServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String receiverMobile;
	private String smsUser;
	private String smsPassword;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SMSServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    
    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        smsUser = context.getInitParameter("smsUser");
        smsPassword = context.getInitParameter("smsPassword");
        receiverMobile = context.getInitParameter("rcvrMobile");
       
    }
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//System.out.println(smsUser+"===inside post sms==="+smsPassword+"====="+receiverMobile);
		try {
				String message = request.getParameter("smsText");
				//System.out.println("===inside post sms==="+message);
				String encoded = URLEncoder.encode(message, "UTF-8");
				String success = new SendSMS().sendLoginRequest(smsUser,smsPassword,receiverMobile,encoded);
				//System.out.println("servlet>>"+success);
				
				if("success".equalsIgnoreCase(success)){
				
					request.setAttribute("smsMessage", "'SMS sent successfully'");
					request.setAttribute("smscolor", "'green'");
				}else{
					request.setAttribute("smsMessage", "'Failed to send SMS,Please try later'");
					request.setAttribute("smscolor", "'red'");
				}
			
		} catch (Exception ex) {
            ex.printStackTrace();
            request.setAttribute("smsMessage", "'Failed to send SMS,Please try later'");
			request.setAttribute("smscolor", "'red'");
            
        } finally {
        	
            getServletContext().getRequestDispatcher("/Home.jsp").forward(request, response);
        }
	}

}
