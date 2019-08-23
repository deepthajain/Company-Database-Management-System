<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="java.sql.*" %>
      <%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<style>
body{


     font-family:sans-serif;
     font-size:1em;
    }
table{
      width:60%;
     }    
table,th,td{
      border:1px solid black;
      border-collapse:collapse;
      opacity:0.95;
     }    
th,td{
      padding:10px;
      text-align:center;
     }  
th{
   background-color:pink;
   color:black;
  }   
tr:nth-child(even)
    {
      background-color:;
    }  
tr:nth-child(odd)
    {
      background-color:white;
    }
        .form1 {
  width:200px;
  position:absolute;
  height:500px;
  top:200px;
  right:200px;
  opacity:0.9;
  border:none;
  border-radius:20px;
}
.button {
  width:100px;
  padding:15px 20px;
  font-size:20px;
  text-align:center;
  cursor:pointer;
  outline:none;
  color:#fff;
  position:relative;
  top:500px;
  left:50px;
  background-color:grey;
  border:none;
  border-radius:12px;
  box-shadow:0 9px #999;
  color:cyan;
}
               
</style>
</head>
<body bgcolor="gray">
	<%
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/D", "root", "root");
	%>

<table align="center">
      <tr>
      <td colspan="8"><h1>EMPLOYEE DETAILS</h1></td>
      </tr>
      <tr>
          
           <th>Employee Id</th>
            <th>Employee Name</th>
             <th>Employee Post</th>
               <th>DOB</th>
           <th>Gender</th> 
      </tr>
<%
	PreparedStatement ps = con.prepareStatement( "select * from employee");
	
	
	ResultSet rs = ps.executeQuery();
	while (rs.next()) {
%>
<tr bgcolor="white">
	<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td ><%=rs.getString(5) %></td>

</tr>
<%
	}
%>
<form class ="form1">

</form>
<a href="adminpage.html" class="button">BACK</a></br></br>
</body>
</html>




