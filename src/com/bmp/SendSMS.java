package com.bmp;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.HttpVersion;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.CoreProtocolPNames;
import org.apache.http.protocol.BasicHttpContext;
import org.apache.http.protocol.ExecutionContext;
import org.apache.http.util.EntityUtils;

public class SendSMS {

    Header[] cookie = null;

    public String sendLoginRequest(String login_number,String login_passwd,String receivingNo,String msg) {
    	
    	String sendSmsFlag = null;

        try {
        	List<String> logInUrlList = new ArrayList<String>();
        	logInUrlList.add(0, "http://site24.way2sms.com/");
        	logInUrlList.add(1, "http://site23.way2sms.com/");
        	logInUrlList.add(2, "http://site21.way2sms.com/");
        	logInUrlList.add(3, "http://site5.way2sms.com/");
        	
        	HttpGet httpget = null;
        	HttpResponse response = null;

        	String loginUrlAction = "Login1.action?username=";
        	String passwd = "&password=";
        	
            HttpClient httpclient = new DefaultHttpClient();
            BasicHttpContext context = new BasicHttpContext(); 

            httpclient.getParams().setParameter(CoreProtocolPNames.PROTOCOL_VERSION, HttpVersion.HTTP_1_1);
            for(String url :logInUrlList){
                httpget = new HttpGet(url + loginUrlAction+login_number+passwd+login_passwd);
                
                response = httpclient.execute(httpget,context);
                if(response.getStatusLine().getStatusCode() != 200){
                	
                	continue;
                }else{
                	break;
                }
                	

            }

            System.out.println("executing request for login:" + httpget.getRequestLine());
            
//            System.out.println("response String:"+response.toString());
            
            //retrieve the sessionid and token id from response URL
            HttpUriRequest currentReq = (HttpUriRequest) context.getAttribute(ExecutionContext.HTTP_REQUEST);
            HttpHost currentHost = (HttpHost)  context.getAttribute(ExecutionContext.HTTP_TARGET_HOST);
            String responseURL = (currentReq.getURI().isAbsolute()) ? currentReq.getURI().toString() : (currentHost.toURI() + currentReq.getURI());
            
            System.out.println("*****************"+currentHost.toURI());
            System.out.println("log in responseURL>>"+responseURL);
            
            String tokenID = currentReq.getURI().getQuery();
            
            tokenID = tokenID.replaceFirst("id=", "Token=");
            System.out.println("token ID>>>"+tokenID);

            //END 

            HttpEntity resEntity = response.getEntity();

            System.out.println(response.getStatusLine());
            if (resEntity != null) {
//                System.out.println(EntityUtils.toString(resEntity));
                System.out.println("Hu ha ha...");

            }
            if (resEntity != null) {
                resEntity.consumeContent();
            }

            cookie = (Header[]) response.getHeaders("Set-Cookie");
            for(int h=0; h<cookie.length; h++){
                System.out.println("Cookie:"+cookie[h]);
            }

//            httpclient.getConnectionManager().shutdown();

            sendSmsFlag = sendSms(currentHost.toURI(),receivingNo,tokenID,httpclient,msg);
            logoutSMS(currentHost.toURI(),httpclient);
        } catch (IOException ex) {
            //Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        	System.out.println("Error while login:");
        	ex.printStackTrace();
        }
        return sendSmsFlag;
    }

    public String sendSms(String responseURL,String receivingNo,String tokenID,HttpClient httpclient,String msg){
    	String smsStatus = null;
        try {
        	StringBuffer msgBuffer = new StringBuffer();
//            HttpClient httpclient = new DefaultHttpClient();
            httpclient.getParams().setParameter(CoreProtocolPNames.PROTOCOL_VERSION, HttpVersion.HTTP_1_1);

//            String restUrl =URLEncoder.encode("http://site24.way2sms.com/smstoss.action?"+tokenID+"&mobile=9701789250&message="+msg+"", "UTF-8");
            
            HttpPost httppost = new HttpPost(responseURL+"/smstoss.action?"+tokenID+"&mobile="+receivingNo+"&message="+msg+"");
            httppost.setHeaders(cookie);
            System.out.println("send sms executing request:" + httppost.getRequestLine());
            HttpResponse response = httpclient.execute(httppost);
            HttpEntity resEntity = response.getEntity();

            System.out.println("REEAEAEEAE:"+response.getStatusLine().getReasonPhrase());
            
            if(response.getStatusLine().getReasonPhrase().contains("Found") || response.getStatusLine().getReasonPhrase().contains("OK")){
            	smsStatus = "success";
            }
            
            if (resEntity != null) {
                System.out.println(EntityUtils.toString(resEntity));
                System.out.println("good for me!!!");

            }
            if (resEntity != null) {
                resEntity.consumeContent();
            }

//            httpclient.getConnectionManager().shutdown();
        } catch (IOException ex) {
        	System.out.println("Error while sending message:");
//            Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
        	smsStatus = "Failed";
        	ex.printStackTrace();
        }
        return smsStatus;
    }
    private void logoutSMS(String url,HttpClient httpclient){
    	try{
        httpclient.getParams().setParameter(CoreProtocolPNames.PROTOCOL_VERSION, HttpVersion.HTTP_1_1);

//        String restUrl =URLEncoder.encode("http://site24.way2sms.com/smstoss.action?"+tokenID+"&mobile=9701789250&message="+msg+"", "UTF-8");
        
        HttpGet httppost = new HttpGet(url+"/entry?ec=0080&id=2gxf");
       //smstoss.action?
        httppost.setHeaders(cookie);
//        httppost.

//        File file = new File("somefile.jpg");
//
//        MultipartEntity mpEntity = new MultipartEntity();
//        ContentBody cbFile = new FileBody(file, "image/jpeg");
//        mpEntity.addPart("Filedata", cbFile);
//        mpEntity.addPart("MAX_FILE_SIZE", new StringBody("268435456"));
//        httppost.setEntity(mpEntity);
        
        System.out.println("log out executing request:" + httppost.getRequestLine());
        HttpResponse response = httpclient.execute(httppost);
        HttpEntity resEntity = response.getEntity();

        System.out.println(response.getStatusLine());
        if (resEntity != null) {
//            System.out.println(EntityUtils.toString(resEntity));
            System.out.println("logging out for me!!!");

        }
        if (resEntity != null) {
            resEntity.consumeContent();
        }

        httpclient.getConnectionManager().shutdown();
    } catch (IOException ex) {
    	System.out.println("Error while logout:");
        //Logger.getLogger(Main.class.getName()).log(Level.SEVERE, null, ex);
    	ex.printStackTrace();
    }
    	
    }

    public static void main(String[] args) {
        //new SendSMS().sendLoginRequest("8686298138","passw0rd","8280382804","Please-chk-the-site-now-just-for-content-in-every-page");
    }
}