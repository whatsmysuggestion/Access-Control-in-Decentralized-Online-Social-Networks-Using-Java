<%@ page import="java.sql.*, javax.sql.*, databaseconnection.*, java.util.HashSet, java.util.ArrayList, java.util.Iterator, java.io.*"%>
<%@page import="key_distribution_center.*"%>
<%@page import="policy_hiding.*"%>
<html>
<head>
<title>kutty</title>
<script language="JavaScript">

</script>
</head>
<body background="Images/clouds_background.jpg">
<%
	
	String filename = (String)session.getAttribute("filename");

	Blob file= null;
	
	Connection con1 = null;
	PreparedStatement ps1 = null;
	ResultSet rs1 = null;
		String sql1=null;

	 sql1 = "select file from share where file_name ='"+filename+"'";
	
	try
	{
		con1 = Databasecon3.getconnection();
		ps1 = con1.prepareStatement(sql1);
		//ps1.setString(1,filename);
		rs1 = ps1.executeQuery();
		rs1.next();
		file = rs1.getBlob(1);
	}
	
	catch(Exception e)
	{
		out.println("Exception :"+e);
	}
	finally
	{
		if(con1 != null)
			con1.close();
		if(ps1 != null)
			ps1.close();
		if(rs1 != null)
			rs1.close();
	}
	session.setAttribute("resumeBlob",file);
	//out.print(file);
	//out.print(filename);
   response.sendRedirect("userview.jsp");

%>


</body>
</html>