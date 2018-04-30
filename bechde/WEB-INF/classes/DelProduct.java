//To delete Product from the database.

import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import java.text.*; //to get date in yyyy-mm-dd format
import fetch.*;

public class DelProduct extends HttpServlet
{
	Connection con;
	PreparedStatement st;
	ResultSet rs;
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException
	{
	
		response.setContentType("text/html");
		

		PrintWriter out = response.getWriter();
	   
		try
		{

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bechde?useSSL=false","ayush","ayush");
			st = con.prepareStatement("delete from product_info where p_id = ?");

			st.setString(1,request.getParameter("p_id"));

			st.executeUpdate();
			
			con.close();
			out.println("deleted");
		}
		catch(Exception e)
		{					
			out.println(e.toString());
		}
	}
}

