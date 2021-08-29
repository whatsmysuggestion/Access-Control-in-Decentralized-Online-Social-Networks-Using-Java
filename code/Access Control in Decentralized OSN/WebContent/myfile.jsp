<%@ page import="java.sql.*"  import="databaseconnection.*" errorPage="" %>
<%@page import="policy_hiding.*"%>
<%
		String myname=(String)session.getAttribute("myname");
		String myemail=(String)session.getAttribute("myemail");
		String search=request.getParameter("search");
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
        <li><a href="myfile.jsp" class="selected"> My File<span class="ui_icon home"></span></a></li>
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
              <h2>My File</h2>
              <table border="1" width="450px" bgcolor="#FFCCFF">
                <tr> 
                  <td width="150" align="center">From</td>
                  <td width="150" align="center">File Name</td>
                  <td width="150" align="center">Download</td>
                </tr>
                <%		
						
										Statement st4 = null;
										ResultSet rs4=null;
												
									try{
										
											Connection con4=Databasecon3.getconnection();
											st4=con4.createStatement();
											String sql4="select * from share where share_to='"+myname+"'";
											rs4=st4.executeQuery(sql4);
											while(rs4.next()){%>
                <tr> 
                  <td align="center"> 
                    <%=rs4.getString("share_from")%>
                  </td>
                  <td align="center"> 
                    <%=rs4.getString("file_name")%>
                  </td>
                  <td align="center"><a href="check_key.jsp?myfile=<%=rs4.getString("title")%>"> 
                    <%=rs4.getString("title")%>
                    </a></td>
                </tr>
                <%}	
									}
									catch (Exception eq4) 
										{
											out.println(eq4.getMessage());
										}
							%>
              </table>
            </div>
            <div class="col_320 float_r"> </div>
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