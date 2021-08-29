<%@page import="com.oreilly.servlet.*,java.sql.*,databaseconnection.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<%@page import=" java.security.MessageDigest"%>
<%@page import=" java.security.*"%>
<%@page import="javax.crypto.*"%>
<%@page import="key_distribution_center.*"%>
<%@page import="policy_hiding.*"%>
<html>
<head>
</head>
<body>
<%

Elgamal_Encryption elgamal=new Elgamal_Encryption();

String p=(String)session.getAttribute("p");
String b=(String)session.getAttribute("b");
String sc=(String)session.getAttribute("sc");
String myx=(String)session.getAttribute("myx");
String c=(String)session.getAttribute("c");

Thread.sleep(100);
ArrayList list = new ArrayList();
		ServletContext context = getServletContext();

		String dirName =context.getRealPath("\\Gallery\\");
		
		String paramname=null;
	     
		String sname=null,title=null,mkey=null,myfile=null,myimagename=null,emkey=null;
		String temp[]=null;
		
		String myid=(String)session.getAttribute("myid");
		String myname=(String)session.getAttribute("myname");
		String myemail=(String)session.getAttribute("myemail");
	
   		  File file1 = null;
		  int pid=0,s=0;
 
	Statement st2=null;
	ResultSet rs2=null;
	String sql="select max(id) from share ";
	try
	{
		Connection con2=Databasecon3.getconnection(); 
		st2=con2.createStatement();
		rs2=st2.executeQuery(sql);
		if(rs2.next())
		{
		if(rs2.getInt(1)==0)
		pid=1;
		else
		pid=rs2.getInt(1)+1;
		
		session.setAttribute("pid",Integer.toString(pid));
		
			try {
			 
			MultipartRequest multi = new MultipartRequest(request, dirName,	10 * 1024 * 1024); // 10MB

			Enumeration params = multi.getParameterNames();
			while (params.hasMoreElements()) 
			{
				paramname = (String) params.nextElement();
				
				if(paramname.equalsIgnoreCase("sname"))
				{
					sname=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("title"))
				{
					title=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("mkey"))
				{
					mkey=multi.getParameter(paramname);
				}
				if(paramname.equalsIgnoreCase("myfile"))
				{
					myfile=multi.getParameter(paramname);
				}
				}
					
			int f = 0;
	Enumeration files = multi.getFileNames();	
	while (files.hasMoreElements()) 
	{
		paramname = (String) files.nextElement();
		if(paramname.equals("d1"))
		{
			paramname = null;
		}
		
		if(paramname != null)
		{
			f = 1;
			myfile = multi.getFilesystemName(paramname);
			String fPath = context.getRealPath("\\Gallery\\"+myfile);
			file1 = new File(fPath);
			myimagename=file1.getName();
			
						
			
			FileInputStream fs = new FileInputStream(file1);
			list.add(fs);
		}		
	}
	        FileInputStream fs1 = null;
            
			emkey=elgamal.encrypt(myx, c, p, b, mkey);
			
			temp=emkey.split(",");
			
			Connection con=Databasecon3.getconnection(); 

			PreparedStatement ps=con.prepareStatement("insert into share values(?,?,?,?,?,?,?,?,?,?)");
			    
       			ps.setInt(1,pid);
				ps.setString(2,myname);
				ps.setString(3,title);
				ps.setString(4,sname);
				ps.setString(5,Ciphertext.get_Ciphertext(mkey));
				ps.setString(6,myfile);
				ps.setString(7,myimagename);
				ps.setString(8,temp[0]);
				ps.setString(9,temp[1]);
				ps.setString(10,temp[2]);
				
				
       if(f == 0)
			ps.setObject(6,null);
		else if(f == 1)
		{
			fs1 = (FileInputStream)list.get(0);
			ps.setBinaryStream(6,fs1,fs1.available());
		}	
			int x=ps.executeUpdate();
		
			if(x!=0)
			{
				System.out.println("**************");
				System.out.println("Encryption by sender");
				System.out.println("Ciphertext C "+temp[1]);
				System.out.println("Ciphertext C "+temp[2]);
				System.out.println("Attribute based signature scheme "+temp[0]);
				System.out.println("**************");
				response.sendRedirect("search.jsp?message=success");
			}
			else
			{
				response.sendRedirect("search.jsp?message=fail");
			}
				
		} 
		catch (Exception e) 
		{
			out.println(e.getMessage());
		}
		}
	
		}
catch(Exception ex)
	{
		System.out.println(ex);
	}		
	
 %>
</body>
</html>