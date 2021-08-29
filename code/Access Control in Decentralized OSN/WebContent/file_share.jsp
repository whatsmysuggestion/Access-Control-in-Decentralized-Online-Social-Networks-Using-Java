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
        <li><a href="file_share.jsp" class="selected"> Share<span class="ui_icon home"></span></a></li>
        <li><a href="myfile.jsp"> My File<span class="ui_icon home"></span></a></li>
        <li><a href="search.jsp"> Search<span class="ui_icon aboutus"></span></a></li>
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
              <h2>Share File To</h2>
			  <form name="fff" action="send_file.jsp" method="post">
			  <table width="400px" bgcolor="#FFFF99">
			  	<tr>
					<td>Attribute 1:</td>
					<td><select name="occupation" class="input_field">
                    <option value="0">Select Occupation</option>
                    <option value="10693405777432535203">Manager</option>
                    <option value="18432652745079760697">Tech Lead</option>
                    <option value="14573525453786626909">Programmer</option>                    
              		</select></td>
				</tr>
				<tr>
					<td colspan="2"><div class="cleaner_h10"></div></td>
				</tr>
				<tr>
					<td>Attribute 2:</td>
					<td><select name="location" class="input_field">
                    <option value="0">Select Location</option>
                    <option value="1">Andhra</option>
                    <option value="2">Bangalore</option>
                    <option value="3">Chennai</option>
                    <option value="4">Delhi</option>
               		</select></td>
				</tr>
				<tr>
					<td colspan="2"><div class="cleaner_h10"></div></td>
				</tr>
				<tr>
					<td>User:</td>
					<td>
						<select name="smail" class="input_field">
                    <option value="0">Select User</option>
                  
              <%		
						
										Statement st4 = null;
										ResultSet rs4=null;
												
									try{
										
											Connection con4=Databasecon.getconnection();
											st4=con4.createStatement();
											String sql4="select * from profile where name!='"+myname+"'";
											rs4=st4.executeQuery(sql4);
											while(rs4.next()){%>
											<option value="<%=rs4.getString("name")%>"><%=rs4.getString("name")%></option>
               
              <%}	
									}
									catch (Exception eq4) 
										{
											out.println(eq4.getMessage());
										}
								 %>
				 </select>
					</td>
				</tr>
				<tr>
					<td colspan="2"><div class="cleaner_h10"></div></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="submit" name="sub" value="Share" align="right">
					</td>
				</tr>
			  </table>
			 							 
			</form>
            </div>
            <div class="col_320 float_r"> <a href="#"><img src="images/share.png" alt="image" class="image_wrapper" width="300" height="250" /></a> 
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