<%@page import="java.sql.*,java.math.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*"  errorPage="Error.jsp"%>
<%@page import="key_distribution_center.*"%>
<%
int y= 10 + (int)(Math.random()*100);
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Policy-Hiding Cryptographic</title>
<meta name="keywords" content="free css templates, wooden wall, one page, wooden strips background, CSS, HTML" />
<meta name="description" content="Wooden Wall - Free CSS Template provided by freecsstemplates.in" />
<link href="style.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="css/coda-slider.css" type="text/css" media="screen" charset="utf-8" />



</head>

<body>
	
    
<div id="slider"> 
  <div id="wrapper"> 
    <div> 
      <h1 align="center">Access Control in Decentralized Online Social</h1>
      <h1 align="center">Networks: Applying a Policy-Hiding Cryptographic</h1>
      <h1 align="center">Scheme and Evaluating Its Performance</h1>
    </div>
    <div id="menu"> 
      <ul class="navigation">
        <li><a href="home.html">Home<span class="ui_icon home"></span></a></li>
        <li><a href="#" class="selected">Registration<span class="ui_icon aboutus"></span></a></li>
      </ul>
    </div>
    <div id="content"> 
      <div class="scroll"> 
        <div class="scrollContainer"> 
          <!-- end of home -->
          <div class="panel" id="contactus"> 
            <h1> Registration</h1>
            <div class="col_320 float_l"> 
              <div id="contact_form"> 
                <form method="post" name="contact" action="insertprofile2.jsp">
                  <h4>Name:</h4>
                  <input name="name" type="text" class="input_field" id="name" maxlength="60" value="<%=request.getParameter("name")%>" />
                  <div class="cleaner_h10"></div>
                  <h4>Secret Key:</h4>
                  <input name="pkey" type="text" class="input_field" id="name" maxlength="60" value="<%=y%>" />
                  <div class="cleaner_h10"></div>
                  <input type="submit" class="submit_btn float_l" name="submit" id="submit" value="Register" />
                  <input type="reset" class="submit_btn float_r" name="reset" id="reset" value="Reset" />
                </form>
              </div>
            </div>
            <div class="col_320 float_r"> <img src="images/register.png" /> </div>
          </div>
        </div>
      </div>
      <!-- end of scroll -->
    </div>
    <!-- end of content -->
  </div>
  <!-- end of wrapper -->
</div>
<!-- end of slider -->

</body>
</html>