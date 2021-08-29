<%@page import="java.sql.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*"  errorPage="Error.jsp"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>
<%@page import="key_distribution_center.*"%>
<%@page import="policy_hiding.*"%>
<%@page import="bloomfilter.*"%>

<html>
<head>
</head>
<body>

<%
		String myname=(String)session.getAttribute("myname");
		String myfile=(String)session.getAttribute("myfile");
		String hcNo=(String)session.getAttribute("hcNo");
		String mym=(String)session.getAttribute("mym");
		String filename =null;
		String m=null;
		
		Statement st = null;
		ResultSet rs1=null;
		int count=0;
		
	try{
		
			Connection con=Databasecon3.getconnection();
			st=con.createStatement();
			String sql1="select * from share where title='"+myfile+"' ";
			rs1=st.executeQuery(sql1);
			if(rs1.next()){
				m=rs1.getString("message_key");
				String hashcode=Long.toString(Bloomfilter.hashCode(Ciphertext.get_Plaintext(m),Integer.parseInt(hcNo)));
				filename=rs1.getString("file_name");
				session.setAttribute("filename",filename);
				if(mym.equals(hashcode)){
					System.out.println("Hashcode Value contains: "+Ciphertext.get_Plaintext(m));
					System.out.println("\n");
					System.out.println("True");
					System.out.println("\n");
					System.out.println("******************");
					response.sendRedirect("userfileview.jsp");
				}
				else{
					out.println("Enter Correct Key");
				}
				
			}	
	}
	catch (Exception eq) 
		{
			out.println(eq.getMessage());
		}
		
	
 %>

</body>
</html>