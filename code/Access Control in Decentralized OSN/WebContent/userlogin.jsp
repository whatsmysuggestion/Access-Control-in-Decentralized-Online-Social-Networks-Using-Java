<%@ page import="java.sql.*"%>
<%@ page import="databaseconnection.*"%>
<html>
<head>
<title>Authenticated Key Exchange</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
<%

Statement st = null;
ResultSet rs = null;
String name = request.getParameter("name");
String password = request.getParameter("password");
if(name.equals("admin@gmail.com") && password.equals("admin")){
	response.sendRedirect("addquestion.jsp");	
}
session.setAttribute("password",password);
session.setAttribute("name",name);
try{
		
	Connection con=Databasecon.getconnection();
	st = con.createStatement();
	String qry ="select * from profile where  name='"+name+"' AND password='"+password+"'"; 
	rs = st.executeQuery(qry);
	if(!rs.next()){
	out.println("Enter correct Username, password");
	
	}
	else{
		System.out.println("---------------------");
		System.out.println("Successfully login by "+rs.getString("name"));
		System.out.println("---------------------");
		session.setAttribute("myid",Integer.toString(rs.getInt("id")));
		session.setAttribute("myname",rs.getString("name"));
		session.setAttribute("myemail",rs.getString("email"));
		
		session.setAttribute("mylocation",rs.getString("location"));
		response.sendRedirect("search.jsp");	
	}
	con.close();
	st.close();
}
catch(Exception ex){
	out.println(ex);
}
%>
</body>
</html>


