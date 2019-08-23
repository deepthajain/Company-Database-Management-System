<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Stored Procedure</title>
<style>
body{
	background-image:url(logbg.jpg);
	height: 100vh;
	background-size:cover;
	background-position:cover;	
}
</style>



</head>
<body>
<h2><center> Stored Procedure</center></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr bgcolor="sandybrown">

<th>Employee ID</th>
<th>EMployee Name</th>
<th>Employee Post</th>
<th>Date Of Birth</th>
<th>Gender</th>


</tr>
<% 



Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/D","root","hhrpkpmcc");
CallableStatement ps=con.prepareCall("CALL user_display();");
ResultSet rs=ps.executeQuery();
while(rs.next()) {
%>
<tr bgcolor="lightgoldenrodyellow">
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td ><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>


</tr>
<%} %>

</table><br/><br/>
<center><a href ='homepage.html'><button>Back</button></a></center>
</body>
</html>