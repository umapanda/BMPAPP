<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.io.*,java.util.*" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--
Green Ray Template is provided by www.tooplate.com
-->
<title>Brahmapur Police</title>

<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css/nivo-slider.css" type="text/css" media="screen" />
<script src="js/jquery-1.2.6.js" type="text/javascript"></script>
<script src="js/jquery.nivo.slider.js" type="text/javascript"></script>
<script src="js/google-maps.js" type="text/javascript"></script>


 <style>
   html, body {
     height: 100%;
     margin: 0;
     padding: 0;
   }
   #map {
     width: 400px;
     height: 250px;
     margin-top: 10px;
   }
   
   ul.a {
    list-style-type: circle;
	}
 </style>


</head>
<body>
   <div id="slider">
    <div class="headerDiv"><img src="images/rsz_bmp_police_logo.jpg" height="180px;" width="500px" border="0" /></div>
    <div style="width: 100%;">
    <div class="mainPanel">
            <div id="menu">
           		
            	 <ul class="navigation">
            	 	 <li><h2 style="margin-top:10px;">Contact Us:</h2></li>
                     <li><input type="button" value="Call" class="callnow_button" id="callLink" onclick="showHideDiv(this)"/></li>
                     <li><input type="button" value="SMS" class="smsnow_button" id="smsLink" onclick="showHideDiv(this)"/></li>
                     <li><input type="button" value="e-mail" class="emailnow_button" id="emailLink" onclick="showHideDiv(this)"/></li>
                     <li><input type="button" value="Facebook" class="fbnow_button" id="fbLink" onclick="showHideDiv(this)"/></li>
                </ul>
               
            </div>
       
        <div id="content">
        <table width="100%" style="table-layout: fixed;overflow: hidden;background-color: #484848;border-radius:25px; ">
        	<tr>
        	<td width="65%" style="vertical-align: top;">
	        	<div id="about" class="firstPanel">
		                <h1>Message</h1>
		                <div class="image_wrapper image_fl">
		                	<img src="images/IMG-20150827-WA0011.jpg" alt="image" width="225px" height="225px"/>
		                	<span class="caption">DR. Sarthak Sarangi, IPS,<br>Superintendent of Police</br></span>
		                	
		                </div>
		                <p><em>Brahmapur police district is carved out from erstwhile Ganjam district in 1984.Since then it is engaged in controlling the criminal activity,law & order,traffic effectively.
		                	With a manpower strength of around 1000,Brahmapur police is striving hard to make the city better place to live in.</em></p>
		                <p>Being leader of the force for last one year,my endevour has been to curb criminal activity and regulating the traffic 
		                in the city.I congratulate the citizens of Brahmapur for all their help and support to achieve this.</p>
		                <p>To make Brahmapur police more responsive,people friendly and accountable, this website is launched today i.e on 01.09.2015
		                	by which people can communicate to me freely and directly.
		                	This is a platform designed to contact district police through all possible means like CALL,SMS,E-MAIL & FACEBOOK without revealing identity.</p>
		                	<p>The information shared shall be kept strictly confidential.People are welcome to share their views,suggestions and register complain through this portal which shall be
		                	   immediately attended to.</p>
		                	   <p>At the end I express my gratitude for the help and co-operation rendered by all the staff for a satisfying tenure and expect the same for future.</p>
		                	   
		        </div>
	        </td>
        	<td width="35%" style="vertical-align: top;">
        	
        		<div id="instruction" class="secondPanel">   
                	<h3 style="font-size:170%">Instructions</h3>
                	<ul class="a">
					  <li>While calling please use the phone number in the international format i.e 919437582100</li>
					  <li>Please give some information about yourself while sending an e-mail.</li>
					  <li>Log in to share anything on facebook page</li>
					</ul>
                <!-- Added for google map Start -->
              <h3 style="font-size:170%">Location</h3>
              <div id="map"></div>
              <script src="https://maps.googleapis.com/maps/api/js?signed_in=true&libraries=places&callback=initMap" async defer></script>
			  <!-- Added for google map End -->
                	
              </div>
        	  <div id="call" style="display: none;" class="secondPanel">   
        			<h2>Feel free to call us.</h2>
                     
                     	<table align="center">
                     		<tr>
                     			<td style="vertical-align: top"><a href="https://call2friends.com/" target="_blank" style="text-decoration: none;"><input type="button" value="Call now" class="call_button"></input></a></td>
                     			<td style="vertical-align: top;"><input type="button" value=" Back " class="back_button" onclick="cancel();"></input></td>
                     		
                     		</tr>
                     
                     	</table>
                     
              </div>
        		<div id="sms" style="display: none;" class="secondPanel">
        		
        			  <div id="contact_form">
                     	<h2>Feel free to send us SMS</h2>
                     	<form method="post" name="sms" action="SMSServlet">
                                <br/>
                                <label for="text">Message:</label><label id="charLeft" style="display: none"></label> <textarea id="smsText" name="smsText" maxlength="140" rows="0" cols="0" class="required" onkeydown="javascript:countChars('smsText', 'msgLen', 140)" onkeyup="javascript:countChars('smsText', 'msgLen', 140)"></textarea>
                                <br/>
                                <div id="smserrorDiv" style="display: none;font-weight: bold"></div>
                                <div class="cleaner_h10"></div>
                                <input type="submit" class="submit_btn" name="sendMessage" id="sendMessage" value="Send" onclick="return validateSms();"/>
                                <input type="reset" class="submit_btn" name="reset" id="reset" value="Back" onclick="cancel();"/>
                                 
                            
                            </form>
                     </div>
        		
        		</div>
        		<div id="email" style="display: none;" class="secondPanel">
        		
        			 <div id="contact_form">
                       <form action="EmailSendingServlet" method="post" enctype="multipart/form-data" id="EmailForm">
    
						    <table border="0" width="100%" align="center" id="emailTemplate">
						            <caption><h2>Feel free to mail us</h2></caption>
						            <tr><td colspan="2"> <div id="resultDiv" style="display: none;font-weight: bold"></div></td></tr>
						            <!-- <tr>
						                <td width="50%">Email ID:</td>
						                <td><input type="text" name="sender" size="50" class="required input_field" id="senderText"/></td>
						            </tr>
						            <tr>
						                <td>Subject:</td>
						                <td><input type="text" name="subject" size="50" id="subject" class="required input_field"/></td>
						            </tr> -->
						            <tr>
						                <td>Message:</td>
						                <td><textarea rows="10" cols="39" name="emailcontent" id="emailcontent" class="required"></textarea>
						                	<div id="errorDiv" style="display: none;color:red;font-weight: bold"></div> </td>
						            </tr>
						             <tr>
						                <td width="50%">Attach file:</td>
						                <td><input type="file" name="attachment" id="attachment" onchange="document.getElementById('moreUploadsLink').style.display = 'block';"/>
											<div id="moreUploads"></div>
											<div id="moreUploadsLink" style="display:none;"><a href="javascript:addFileInput();">Attach another File</a></div>
						
						                
						                </td>
						            </tr>
						            <tr></tr>
						            <tr>
						                <td colspan="2" align="center">
						                <input type="submit" value="Send" style="background-color:#a7cce5" onclick="return validateForm();"/>
						                <input type="reset" value="Back" style="background-color:#a7cce5" onclick="cancel();"/>
						                </td>
						               
						            </tr>
						            
						        </table>
						        <br/>
						       
 					</form>
                             
						</div>
        
        		</div>
        		<div id="fb" style="display: none;" class="secondPanel">
        			     <h2>Feel free to send us a message</h2>
                        <div >
                               <table border="0" width="100%" align="center" id="emailTemplate">
					            <tr>
					                <td width="50%"><div id="status" style="margin-left:30px;font-size: 100%;font-weight: bold;"></div></td>
					            </tr>
					            <tr>
					             <td colspan="3" align="center">
					                <input type="button" value="Post Message" onclick="postMessageFB();" class="facebook_button" id="fbPost"/>
					                <input type="button" value="Back" class="fbback_button" id="fbBackBtn" onclick="cancel();"/>
					                <input type="button" value="Logout" id="fbLogout" onclick="logoutFB();" class="facebook_button" style="display: none;"/>
					                </td>
					               </tr>
          						 </table>
						</div>
        		</div>
        	</td>
        	
        	</tr>
        	<tr>
        		<td colspan="2">
      				 <div style="width: 1200px;height:450px;border-radius: 25px;border : 1px solid gray;padding: 10px;margin-left: 35px;">
                 		<h2>Photo Gallery</h2>
                           <div id="sliderImage">
						        <a href="#"><img src="images/IMG-20150827-WA0002.jpg" alt="slideshow 01" height="400px" width="970px"/></a>
						        <a href="#"><img src="images/IMG-20150827-WA0003.jpg" alt="slideshow 02" height="400px" width="970px"/></a>
						        <a href="#"><img src="images/IMG-20150827-WA0004.jpg" alt="slideshow 03" height="400px" width="970px"/></a>
						        
						        <a href="#"><img src="images/IMG-20150827-WA0005.jpg" alt="slideshow 04" height="400px" width="970px"/></a>
						        <a href="#"><img src="images/IMG-20150827-WA0006.jpg" alt="slideshow 05" height="400px" width="970px"/></a>
						        <a href="#"><img src="images/IMG-20150827-WA0008.jpg" alt="slideshow 06" height="400px" width="970px"/></a>
						        <a href="#"><img src="images/IMG-20150827-WA0009.jpg" alt="slideshow 07" height="400px" width="970px"/></a>
						       	<a href="#"><img src="images/IMG-20150827-WA0010.jpg" alt="slideshow 08" height="400px" width="970px"/></a>
   							 </div>
   						 </div>
   						 
        		</td>
        	</tr>
        	
        	<tr>
        		<td colspan="2">	
        			<div style="margin: 10px 0px 0px 10px;background: url(images/tooplate_footer.png) top center no-repeat;"><img src="images/tooplate_footer.png" /><br/>
						<span style="margin-left:210px;">Copyright © 2015 Brahmapur Police | All rights reserved by SP Brahmapur | Free Support +91.9437582100 |
							<%
							ServletContext sc = request.getServletContext();
							out.println("Visitor:"+sc.getAttribute("total"));
							%>
						 </span>
					</div>
						</td>
        		</tr>
        	
        	
        
        </table>
       
		</div> 
        
    </div> 
    </div>
    </div>

    
    <script language="javascript">
	
    window.fbAsyncInit = function() {
  	 
      FB.init({
       // appId      : '697389090391271',
       	 appId 		 : '1487975884850871',
        xfbml      : true,
        version    : 'v2.4'
      });
        
    };

    (function(d, s, id){
  	 var js, fjs = d.getElementsByTagName(s)[0];
       if (d.getElementById(id)) {return;}
       js = d.createElement(s); js.id = id;
       js.src = "//connect.facebook.net/en_US/sdk.js";
       fjs.parentNode.insertBefore(js, fjs);
     }(document, 'script', 'facebook-jssdk'));
    
    
    $('#sliderImage').nivoSlider({
		effect:'random',
		slices:12,
		animSpeed:900,
		pauseTime:7000,
		startSlide:0, //Set starting Slide (0 index)
		directionNav:false,
		directionNavHide:false, //Only show on hover
		controlNav:false, //1,2,3...
		controlNavThumbs:false, //Use thumbnails for Control Nav
		pauseOnHover:true, //Stop animation while hovering
		manualAdvance:false, //Force manual transitions
		captionOpacity:0.7, //Universal caption opacity
		beforeChange: function(){},
		afterChange: function(){},
		slideshowEnd: function(){} //Triggers after all slides have been shown
	});
    
    document.getElementById("smsText").value="";
    /* document.getElementById("senderText").value="";
    document.getElementById("subject").value=""; */
    document.getElementById("emailcontent").value="";
    
    function showHideDiv(divId){
    	
    	if(divId.id == 'callLink'){
    		document.getElementById("call").style.display='block';
    		document.getElementById("sms").style.display='none';
    		document.getElementById("email").style.display='none';
    		document.getElementById("fb").style.display='none';
    		document.getElementById("instruction").style.display='none';
    	}
		if(divId.id == 'smsLink'){
			document.getElementById("call").style.display='none';
    		document.getElementById("sms").style.display='block';
    		document.getElementById("email").style.display='none';
    		document.getElementById("fb").style.display='none';
    		document.getElementById("instruction").style.display='none';
		    		
		}
		if(divId.id == 'emailLink'){
			document.getElementById("call").style.display='none';
    		document.getElementById("sms").style.display='none';
    		document.getElementById("email").style.display='block';
    		document.getElementById("fb").style.display='none';
    		document.getElementById("instruction").style.display='none';
			
		}
		if(divId.id == 'fbLink'){
			document.getElementById("call").style.display='none';
    		document.getElementById("sms").style.display='none';
    		document.getElementById("email").style.display='none';
    		document.getElementById("fb").style.display='block';
    		document.getElementById("instruction").style.display='none';
		}
    }
    
     var msg = <%=request.getAttribute("Message")%>
     var col = <%=request.getAttribute("color")%>
     var smsResponse = <%=request.getAttribute("smsMessage")%>
     var smscol = <%=request.getAttribute("smscolor")%>
     if(col == 'green' || col == 'red' ){
    	 document.getElementById("emailLink").click();
    	 document.getElementById("resultDiv").style.display='block';
    	 document.getElementById("resultDiv").innerHTML=msg;
    	 document.getElementById("resultDiv").style.color=col;
    	 color = "black";
     }
     
     if(smscol == 'green' || smscol == 'red' ){
    	 document.getElementById("smsLink").click();
    	 document.getElementById("smserrorDiv").style.display='block';
    	 document.getElementById("smserrorDiv").innerHTML=smsResponse;
    	 document.getElementById("smserrorDiv").style.color=smscol;
    	 smscol = "black";
    	 
     }
           
      function postMessageFB() {
    	  
    	
    		    FB.ui({
    	    	       // app_id:'697389090391271',
    	    	        app_id:'1487975884850871',
    	    	        method: 'send',
    	    	        link: 'http://www.brahmarakhyak.in/images/sms.png',
    	    	        to:'100010347452954'
    	    	     //   to:'151942618475535'
    	    	       
    	    	        
    	    	    });
    			  
    			  document.getElementById('status').innerHTML ='Thanks for logging in and Sending message! Please Logout before you leave. ';
    			  document.getElementById("status").style.color = "green";
    			  document.getElementById("status").style.display = 'block';
    			  document.getElementById("fbBackBtn").style.display = 'none';
    			  document.getElementById("fbLogout").style.display = 'inline';
      }
      
     function validateForm(){
    	  document.getElementById("resultDiv").style.display = 'none';
    	  if(document.getElementById("emailcontent")!= null){
    		  if(document.getElementById("emailcontent").value != ""){
    			  document.getElementById("errorDiv").style.display = 'none';
    			  return true;
    		  }else{
    			  document.getElementById("errorDiv").innerHTML="Please enter message."
    			  document.getElementById("errorDiv").style.display = 'inline';
    			  return false;
    		  }
    	  }
    	  
      }
      
     function cancel(){
    	//window.location.href = "http://localhost:8080/BMPAPP/";
    	//window.location.href = "http://www.brahmarakhyak.in/";
    	 document.getElementById("call").style.display='none';
 		document.getElementById("sms").style.display='none';
 		document.getElementById("email").style.display='none';
 		document.getElementById("fb").style.display='none';
 		document.getElementById("instruction").style.display='block';
 		document.getElementById("errorDiv").style.display = 'none';
 		document.getElementById('status').style.display = 'none';
 		document.getElementById("fbBackBtn").style.display = 'inline';
		document.getElementById("fbLogout").style.display = 'none';
		document.getElementById("smserrorDiv").style.display='none';
		document.getElementById("resultDiv").style.display='none';
    	
      }
    
      
      var upload_number = 2;
      function addFileInput() {
       	var d = document.createElement("div");
       	var file = document.createElement("input");
       	file.setAttribute("type", "file");
       	file.setAttribute("name", "attachment"+upload_number);
       	d.appendChild(file);
       	document.getElementById("moreUploads").appendChild(d);
       	upload_number++;
      }
      
      function logoutFB() {
    	    	 window.open("http://www.facebook.com");
			     cancel();
    	  }
      
      function validateSms(){
    	  if(document.getElementById("smsText")!= null){
    		  if(document.getElementById("smsText").value != ""){
    			  document.getElementById("smserrorDiv").style.display = 'none';
    			  return true;
    		  }else{
    			  document.getElementById("smserrorDiv").innerHTML="Please enter message."
    			  document.getElementById("smserrorDiv").style.display = 'inline';
    			  document.getElementById("smserrorDiv").style.color='red';
    			  return false;
    		  }
    	  }
    	  return false;
      }
     
     String.prototype.count = function(s1) {
         return (this.length - this.replace(new RegExp(s1, "g"), '').length) / s1.length;
     }
     function countChars(obj, charObj, maxLen) {
         var text = document.getElementById(obj).value;
         var len = text.length;
         var commas;
         var dsr = navigator.userAgent.split("MSIE");
         if (dsr[1] != undefined) {
             commas = trim(document.getElementById(obj).value).count('\n');
         }
         else {
             commas = document.getElementById(obj).value.count('\n');
             len = len + commas;
         }
         if (len <= maxLen) {
             var mLen = maxLen - len;
             document.getElementById("smserrorDiv").innerHTML="Characters left : "+ mLen;
   			 document.getElementById("smserrorDiv").style.display = 'inline';
   			 document.getElementById("smserrorDiv").style.color='white';
         }
         else {
             document.getElementById(obj).value = text.substr(0, text.length - 1);
         }
     }
            
    </script>

</body>
</html>