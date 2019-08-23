import java.io.*;
import javax.servlet.*;
import java.sql.*;
public class update extends GenericServlet
{
	Connection con;
	public void init()throws ServletException
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/D","root","root");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}
	}
	
	
	
	
	public void service(ServletRequest request,ServletResponse response) throws ServletException,IOException
	{
		response.setContentType("text/html");
		
		PrintWriter pw=response.getWriter();
		
		
		
		String ename=request.getParameter("ename");
		String epost=request.getParameter("epost");
		String dob=request.getParameter("dob");
		String gender=request.getParameter("gender");
		String eid=request.getParameter("eid");
		
		try
		{
		String query="update employee set ename=?,epost=?,dob=?,gender=? where eid=?";
		
		PreparedStatement ps=con.prepareStatement(query);
		
		
		ps.setString(1,ename);
		ps.setString(2,epost);
		ps.setString(3,dob);
		ps.setString(4,gender);
		ps.setString(5,eid);

		
		 int i=ps.executeUpdate();
			
			if(i>0)
			{	
				pw.println("<h1>"+"Successfully Updated"+"</h1>");
			}
			else
			{
				pw.println("<h1>"+"Please try again "+"</h1>");
			}
				
			

		}
		catch(Exception e)
		{
			pw.println("ERROR"+e);
		}
		pw.print("<center><a href='company_status.html'>VIEW UPDATE</a>");
	}
}


