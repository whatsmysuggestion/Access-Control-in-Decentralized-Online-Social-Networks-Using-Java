<%@page import="com.oreilly.servlet.*,java.sql.*,databaseconnection.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>
<%@page import="key_distribution_center.*"%>
<%@page import="policy_hiding.*"%>
<%@page import="bloomfilter.*"%>
<%
String c2=null,p=null,k1=null,sname=null,c1=null,myx=null,fname=null;
int hcNo=0;				
%>
<%	
	Elgamal_Decryption elgam=new Elgamal_Decryption();
		
	String myname=(String)session.getAttribute("myname");
	String myfile=(String)session.getAttribute("myfile");
	
	String myc2=request.getParameter("c2");
	String ckey=request.getParameter("ckey");
	
	
	Statement st4 = null;
	ResultSet rs4=null;
	Connection con=Databasecon.getconnection();											
	try{
										
	
	st4=con.createStatement();
	String sql4="select * from profile where name='"+myname+"'";
	rs4=st4.executeQuery(sql4);
		while(rs4.next()){
			p=Ciphertext.get_Plaintext(rs4.getString("primekey"));
			hcNo=Integer.parseInt(Ciphertext.get_Plaintext(rs4.getString("generatorkey")));
			session.setAttribute("hcNo",Integer.toString(hcNo));
			//session.setAttribute("p",Ciphertext.get_Plaintext(p));
			//out.println(p);
		}	
	}
	catch (Exception eq4) 
	{
		out.println(eq4.getMessage());
	}
%>
<%		
				Connection con1=Databasecon3.getconnection();											
	Statement st = null;
	ResultSet rs=null;
												
	try{
										
	
	st=con1.createStatement();
	String sql="select * from share where title='"+myfile+"'";
	rs=st.executeQuery(sql);
		while(rs.next()){
			k1=rs.getString("k");
			c1=rs.getString("c1");
			c2=rs.getString("c2");
			sname=rs.getString("share_from");
			fname=rs.getString("file_name");
			//out.println(k1);
		}	
	}
	catch (Exception eq) 
	{
		out.println(eq.getMessage());
	}
%>

<%
	Thread.sleep(100);
	
	//String m = Elgamal_Decryption.decrypt(ckey,myc2,(Ciphertext.get_Plaintext(p)));
	String m = Elgamal_Decryption.decrypt(ckey,myc2,p);
	String hashcode=Long.toString(Bloomfilter.hashCode(m,hcNo));
	session.setAttribute("mym",hashcode);
	
	System.out.println("******************");
	System.out.println("Bloom Filter");
	System.out.println("\n");
	System.out.println("Master Secret: "+m);
	System.out.println("\n");
	System.out.println("Hash Function");
	System.out.println("\n");
	System.out.println("Hashcode Value: "+hashcode);
	System.out.println("\n");
		response.sendRedirect("recover_key1.jsp");
	
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
              <h2>File Name: 
                <%=fname%>
              </h2>
              <form name="f" action="recover_key1.jsp" method="post">
                <p style=" color:#CC0000; font-size:24px">Recovered Key</p>
                <p><font style="color:#FF00FF; font-size:24px"><blink> 
                  <%=m%>
                  </blink></font></p>
                <br>
                <p style=" color:#CC0000; font-size:24px">Enetr Plain Key:</p>
                <p align="center"> 
                  <input type="text"  name="mym" value="" style="height: 2em; width: 12em; -moz-border-radius: 1em 1em 1em 1em; border-radius: 1em 1em 1em 1em; margin-left:center; font-size:25px; background-color:#ffdce1"  onkeypress="checkEnter(event)">
                </p>
                <p><br>
                </p>
                <p align="right"> 
                  <input type="submit" name="sub" value="Download File">
                </p>
              </form>
              <p><font style="color:#FF00FF; font-size:24px"><blink> </blink></font></p>
            </div>
            <div class="col_320 float_r"> <img src="images/cloud-file-storage.png" alt="image" class="image_wrapper" width="275" height="225" /> 
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
			

