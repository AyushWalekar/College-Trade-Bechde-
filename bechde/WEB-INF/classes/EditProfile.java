import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.text.*; //to get date in yyyy-mm-dd format
import fetch.*;

public class EditProfile extends HttpServlet
{
	Connection con;
	PreparedStatement st;
	ResultSet rs;
	//String s1, s2, s3, s4, s5, s6, s7, s8;	
	String ses = "";	
	String user_id, name, phone_no, email, dob, college, branch, about, s8;	
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{

		HttpSession session = request.getSession();
		if( session != null)
		{
			ses = session.getAttribute("session").toString();
		}
		else 
		{
			response.sendRedirect("/bechde/login.jsp");
		}

	
		response.setContentType("text/html");
		

		PrintWriter out = response.getWriter();


	    user_id = request.getParameter("user_id");
	    name = request.getParameter("name");
	    phone_no = request.getParameter("phone_no");
	    email = request.getParameter("email");
	    dob = request.getParameter("dob");
	    college = request.getParameter("college");
	    branch = request.getParameter("branch");
	    about = request.getParameter("about");
	   
		try
		{

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bechde?useSSL=false","ayush","ayush");
			st = con.prepareStatement("update user_info set name = ? , phone_no = ?, email = ?,dob = ?,college = ?,branch = ?,about = ? where user_id = ?");

			st.setString(1,name);
			st.setString(2,phone_no);
			st.setString(3,email);
			st.setString(4,dob);
			st.setString(5,college);
			st.setString(6,branch);
			st.setString(7,about);

			//this "user_id" will be replaced by sessionID
			st.setString(8,ses);

			st.executeUpdate();
			


			con.close();
			
			out.println("successfull  + user_id "+ user_id);
			//its is temp success show krme k lye


		}
		catch(Exception e)
		{					
			out.println(e.toString());
		}
	}
}

