<%@page import="java.sql.*,java.math.*,java.lang.*,databaseconnection.*,java.text.SimpleDateFormat,java.util.*,java.io.*"  errorPage="Error.jsp"%>
<%@page import="key_distribution_center.*"%>
<%@page import="policy_hiding.*"%>
<html>
<head>
</head>
<body>

<%
		//Key Generation
		KeyGeneration keygen=new KeyGeneration();
		
		
		
		String bint = KeyGeneration.generate_Primekey();
		String temp[]=bint.split(",",3);
		BigInteger b1=new BigInteger(temp[0]);
		BigInteger b2=new BigInteger(temp[1]);
				
		int y= (int)(Math.random()*200);
		
		String name=null,gender=null,email=null,password=null,status="Allow",image=null,mobile=null,location=null,mylocation=null,occupation=null;
		
		Statement st = null;
		ResultSet rs1=null;
		int id=0;
		
	try{
		
			Connection con1=Databasecon.getconnection();
			st=con1.createStatement();
			String sql1="select max(id) from profile";
			rs1=st.executeQuery(sql1);
			while(rs1.next()){
				if(rs1.getInt(1)==0)
					id=1;
				else
					id=rs1.getInt(1)+1;
				
			
		name=request.getParameter("name");
		email=request.getParameter("email");
		session.setAttribute("myemail",email);
		password=request.getParameter("password");
		occupation=request.getParameter("occupation");
		location=request.getParameter("location");
		if(location.equals("1")){
			mylocation="Andhra";
		}
		if(location.equals("2")){
			mylocation="Bangalore";
		}
		if(location.equals("3")){
			mylocation="Chennai";
		}
		if(location.equals("4")){
			mylocation="Delhi";
		}
		
		java.util.Date now = new java.util.Date();
	String date=now.toString();
	 String DATE_FORMAT = "dd-MM-yyyy";
	 SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT);
     String strDateNew = sdf.format(now) ;
			
		
		try {
			
			
			Connection con=Databasecon.getconnection(); 

			PreparedStatement ps=con.prepareStatement("INSERT INTO profile VALUES(?,?,?,?,?,?,?,?)");
				
               	ps.setInt(1,id);
				ps.setString(2,name);	
       			ps.setString(3,email);
       			ps.setString(4,password);
			    ps.setString(5,mylocation);
			    ps.setString(6,Ciphertext.get_Ciphertext(occupation));
				ps.setString(7,Ciphertext.get_Ciphertext(location));
				//ps.setString(6,occupation);
				//ps.setString(7,location);
				ps.setString(8,temp[2]);
				
			int x=ps.executeUpdate();
		
			if(x!=0)
			{
				System.out.println("******************");
				System.out.println("*** Policy Hiding Cryptographic ***");
				System.out.println(" Name: "+name);
				System.out.println(" Email: "+email);
				System.out.println(" Password: "+Ciphertext.get_Ciphertext(password));
				System.out.println(" Attribute 1: "+Ciphertext.get_Ciphertext(occupation));
				System.out.println(" Attribute 2: "+Ciphertext.get_Ciphertext(location));
				
				response.sendRedirect("register2.jsp?message=Successfully Registered&&&name="+name);
			}
			else
			{
				response.sendRedirect("home.html?message=fail");
			}
				
		} 
		catch (Exception e) 
		{
			out.println(e.getMessage());
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