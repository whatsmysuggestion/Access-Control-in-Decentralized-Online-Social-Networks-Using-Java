<%@ page import="java.sql.*"  import="databaseconnection.*" errorPage="" %>
<%@page import="policy_hiding.*"%>
<%
		String myname=(String)session.getAttribute("myname");
		String myemail=(String)session.getAttribute("myemail");
		String myfile=(String)session.getAttribute("myfile");
		
		String c1=null;
%>
<%		
			
		Statement st4 = null;
		ResultSet rs4=null;
												
		try{
										
		Connection con4=Databasecon3.getconnection();
		st4=con4.createStatement();
		String sql4="select * from share where title='"+myfile+"' and share_to='"+myname+"' ";
		rs4=st4.executeQuery(sql4);
			if(rs4.next()){
				c1=rs4.getString("c1");	
			}
			else{
				c1=Ciphertext.get_Ciphertext(c1);
			}	
		}
		catch (Exception eq4) 
		{
			out.println(eq4.getMessage());
		}
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
        <li><a href="file_share.jsp" class="selected"> Share<span class="ui_icon home"></span></a></li>
        <li><a href="myfile.jsp"> My File<span class="ui_icon home"></span></a></li>
        <li><a href="search.jsp"> Search<span class="ui_icon aboutus"></span></a></li>
        <li><a href="home.html">Logout<span class="ui_icon services"></span></a></li>
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
              <h2>Decryption by Receiver:</h2>
              <form name="f" action="diffie_hellman.jsp" method="post">
                <p style=" color:#CC0000; font-size:24px">Cipher Key</p>
                <p align="center"> 
                  <input type="text"  name="c1" style="height: 2em; width: 12em; -moz-border-radius: 1em 1em 1em 1em; border-radius: 1em 1em 1em 1em; margin-left:center; font-size:25px; background-color:#ffdce1" placeholder="C1"  onkeypress="checkEnter(event)">
                </p>
                <br>
                <p style=" color:#CC0000; font-size:24px">Secret Key</p>
                <p align="center"> 
                  <input type="text"  name="privatekey" style="height: 2em; width: 12em; -moz-border-radius: 1em 1em 1em 1em; border-radius: 1em 1em 1em 1em; margin-left:center; font-size:25px; background-color:#ffdce1" placeholder="Private Key"  onkeypress="checkEnter(event)">
                </p>
                <p><br>
                </p>
                <p align="right"> 
                  <input type="submit" name="sub" value="Decrypt">
                </p>
              </form>
              <p><blink>Cipher Key</blink><font style="color:#FF00FF; font-size:24px"> 
                <%=c1%>
                </font></p>
            </div>
            <div class="col_320 float_r"> <img src="images/6.png" alt="image" class="image_wrapper" width="275" height="225" /> 
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