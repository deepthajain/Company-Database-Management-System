import java.io.*;
import javax.servlet.*;
import java.sql.*;
public class delete_employee extends GenericServlet
{
	Connection con;
	public void init() throws ServletException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/D","root","root");
		}catch(Exception e) {
			System.out.println(e);
		}
	}
		public void service (ServletRequest request,ServletResponse response) throws ServletException,IOException
	{
		response.setContentType("text/html");
		PrintWriter pw=response.getWriter();
		String eid=request.getParameter("eid");
		
		try{
			PreparedStatement st=con.prepareStatement("delete from employee where eid=?");
		   st.setString(1,eid);

		int i=st.executeUpdate();
		if(i!=0)
		{
			 RequestDispatcher rd=request.getRequestDispatcher("de.html");
             rd.forward(request, response);
		}
			
		else{
			
			pw.println("Nothing to delete ");
		}
		}catch(Exception e)
		{
			
			pw.println(e);
		}
	
		pw.print("<center><a href='delete.html'>BACK</a>");
		pw.close();
	}
}
	
	