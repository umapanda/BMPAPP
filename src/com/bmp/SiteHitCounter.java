package com.bmp;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

/**
 * Servlet Filter implementation class SiteHitCounter
 */
@WebListener
public class SiteHitCounter implements ServletContextListener,HttpSessionListener {

	ServletContext ctx;
	HttpSession ses;
	  
    public void contextInitialized(ServletContextEvent sce) {
    	
     ctx=sce.getServletContext();
     ctx.setAttribute("total",new Integer(100));
     System.out.println("init----"+ctx.getAttribute("total"));
  }

  public void contextDestroyed(ServletContextEvent sce) {
     // throw new UnsupportedOperationException("Not supported yet.");
	  
  }

  public void sessionCreated(HttpSessionEvent se) {
      Integer t=(Integer)ctx.getAttribute("total");
      int tot=t.intValue();
      tot++;
      ctx.setAttribute("total", tot);
      System.out.println("ses create----"+ctx.getAttribute("total"));
  }

  public void sessionDestroyed(HttpSessionEvent se) {
     
  }

}
