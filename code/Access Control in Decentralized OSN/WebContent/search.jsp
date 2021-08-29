<%@ page import="java.sql.*"  import="databaseconnection.*" errorPage="" %>
<%
		String myname=(String)session.getAttribute("myname");
		String myemail=(String)session.getAttribute("myemail");
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
        <li><a href="file_share.jsp"> Share<span class="ui_icon home"></span></a></li>
        <li><a href="myfile.jsp"> My File<span class="ui_icon home"></span></a></li>
        <li><a href="#" class="selected"> Search<span class="ui_icon aboutus"></span></a></li>
        <li><a href="home.html">Logout<span class="ui_icon services"></span></a></li>
        <li></li>
        <li></li>
        <li><a> 
          <%=myname%>
          </a></li>
      </ul>
    </div>
    <div id="content"> 
      <div class="scroll"> 
        <div class="scrollContainer"> 
          <div class="panel" id="home"> 
            <div class="col_320 float_l"> 
              <h2>Search File</h2>
              <form name="f" action="search_result.jsp" method="post">
                <p align="center"> 
                  <input type="text"  name="search" style="height: 2em; width: 12em; -moz-border-radius: 1em 1em 1em 1em; border-radius: 1em 1em 1em 1em; margin-left:center; font-size:25px; background-color:#ffdce1" placeholder="Search here"  onkeypress="checkEnter(event)">
                </p>
              </form>
            </div>
            <div class="col_320 float_r"> <a href="#"><img src="images/Search.png" alt="image" class="image_wrapper" width="300" height="250" /></a> 
            </div>
          </div>
          <!-- end of home -->
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