<%@page import="java.sql.*,databaseconnection.*,java.util.*,java.io.*"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>
<%@page import="key_distribution_center.*"%>
<%@page import="policy_hiding.*"%>
<%	
	KeyGeneration keygen=new KeyGeneration();
		
	int y= (int)(Math.random()*500);
	String myemail=(String)session.getAttribute("myemail");
	String myname=(String)session.getAttribute("name");
	String att1=request.getParameter("occupation");
	String att2=request.getParameter("location");
	String smail=request.getParameter("smail");
	String x=null,p=null,b=null,sname=null,sc=null,myx=null;				
	Statement st4 = null;
	ResultSet rs4=null;
												
	try{
										
	Connection con4=Databasecon2.getconnection();
	st4=con4.createStatement();
	String sql4="select * from profile where name='"+smail+"'";
	rs4=st4.executeQuery(sql4);
		while(rs4.next()){
			x=rs4.getString("pkey");
			session.setAttribute("x",Ciphertext.get_Plaintext(x));
			sname=rs4.getString("name");
		}	
	}
	catch (Exception eq4) 
	{
		out.println(eq4.getMessage());
	}
%>
<%		
				
	Statement st = null;
	ResultSet rs=null;
												
	try{
										
	Connection con=Databasecon.getconnection();
	st=con.createStatement();
	String sql="select * from profile where name='"+smail+"'";
	rs=st.executeQuery(sql);
		while(rs.next()){
			p=rs.getString("primekey");
			b=rs.getString("generatorkey");
			sc=rs.getString("sc");
			session.setAttribute("p",Ciphertext.get_Plaintext(p));
			session.setAttribute("b",Ciphertext.get_Plaintext(b));
			session.setAttribute("sc",sc);
		}	
	}
	catch (Exception eq) 
	{
		out.println(eq.getMessage());
	}
%>
<%		
				
	Statement st1 = null;
	ResultSet rs1=null;
												
	try{
										
	Connection con1=Databasecon.getconnection();
	st1=con1.createStatement();
	String sql1="select * from profile where email='"+myemail+"'";
	rs1=st1.executeQuery(sql1);
		while(rs1.next()){
			myx=rs1.getString("primekey");
			session.setAttribute("myx",Ciphertext.get_Plaintext(myx));
			
		}	
	}
	catch (Exception eq1) 
	{
		out.println(eq1.getMessage());
	}
%>
<%
	Thread.sleep(100);
	
	String pkey = KeyGeneration.generate_Publickey(att1,att2,Ciphertext.get_Plaintext(x));
	session.setAttribute("c",pkey);	
	Thread.sleep(100);
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Policy-Hiding Cryptographic</title>
<meta name="keywords" content="free css templates, wooden wall, one page, wooden strips background, CSS, HTML" />
<meta name="description" content="Wooden Wall - Free CSS Template provided by freecsstemplates.in" />
<link href="style.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" href="css/coda-slider.css" type="text/css" media="screen" charset="utf-8" />

<script src="js/jquery-1.2.6.js" type="text/javascript"></script>
<script src="js/jquery.scrollTo-1.3.3.js" type="text/javascript"></script>
<script src="js/jquery.localscroll-1.2.5.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.serialScroll-1.2.1.js" type="text/javascript" charset="utf-8"></script>
<script src="js/coda-slider.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.easing.1.3.js" type="text/javascript" charset="utf-8"></script>

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
          <!-- end of home -->
          <div class="panel" id="contactus"> 
            <h1>Sharing File</h1>
            <div class="col_320 float_l"> 
              <div id="contact_form"> 
                <form method="post" name="contact" action="uploadfile.jsp" enctype="multipart/form-data"><label for="author"> 
                  <h5>Send To:</h5></label>
                  <input name="sname" type="text" class="input_field" id="name" maxlength="60" value="<%=sname%>" />
                  <div class="cleaner_h10"></div><label for="author">
                  <h5>Title:</h5></label>
                  <input name="title" type="text" class="input_field" id="email" maxlength="60" />
                  <div class="cleaner_h10"></div><label for="text">
                  <h5>Master Key:</h5></label>
                  <input name="mkey" type="text" class="input_field" id="email" maxlength="60" value="<%=y%>" />
                  <div class="cleaner_h10"></div><label for="author">
                  <h5>File:</h5></label>
                  <input name="myfile" type="file" class="input_field" id="name" maxlength="60" />
                  <div class="cleaner_h10"></div>
                  <input type="submit" class="submit_btn float_l" name="submit" id="submit" value="Share File" />
                  <input type="reset" class="submit_btn float_r" name="reset" id="reset" value="Reset" />
                </form>
              </div>
            </div>
            <div class="col_320 float_r"> 
              <%
				System.out.println("**************");
				System.out.println("Key Generation and Distribution");
				System.out.println("Keys of "+sname);
				System.out.println("Attribute 1 "+p);
				System.out.println("Attribute 2 "+b);
				System.out.println("Attribute 3 "+x);
				System.out.println("public Key "+pkey);
				System.out.println("**************");
			%>
              <img src="images/cloud-file-storage.png" alt="image" class="image_wrapper" width="300" height="250" /> 
              <!--<img src="images/file_transfer.gif" />-->
            </div>
          </div>
        </div>
      </div>
      <!-- end of scroll -->
    </div>
    <!-- end of content -->
    <div id="footer"> </div>
  </div>
  <!-- end of wrapper -->
</div>
<!-- end of slider -->

</body>
</html>