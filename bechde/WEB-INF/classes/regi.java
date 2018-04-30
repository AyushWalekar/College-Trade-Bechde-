import java.sql.*;
import javax.servlet.http.*;  
import javax.servlet.*;
import java.security.MessageDigest;
import java.io.*;
public class regi extends HttpServlet
{

static String sha256(String base) 
{
	try
	{
        	MessageDigest digest = MessageDigest.getInstance("SHA-256");
        	byte[] hash = digest.digest(base.getBytes("UTF-8"));
        	StringBuffer hexString = new StringBuffer();
		for (int i = 0; i < hash.length; i++) 
		{
            		String hex = Integer.toHexString(0xff & hash[i]);
            		if(hex.length() == 1) hexString.append('0');
            		hexString.append(hex);
		}
		return hexString.toString();
    	}
	catch(Exception ex)
	{
       		throw new RuntimeException(ex);
   	}
}


	boolean checkUserId(String user_id)
	{
		try
		{
			st = con.prepareStatement("select user_id from user_info where user_id = ?");
			st.setString(1,user_id);
			rs = st.executeQuery();
			if(rs.next())
				return false;
			else
				return true;
		}
		catch(Exception e)
		{
			out.println(e.toString());
			return false;
		}
	}


	Connection con;
	PreparedStatement st;
	ResultSet rs;
	PrintWriter out;
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		res.setContentType("text/html");
		String s1;
		String s2;
		String s3;
		String s4;
		String s5;
		String s6;
		String s7;
		String s8;
		String s9;
		String s10;	
		String s11;	

		s1 = req.getParameter("usern");

		s2 = req.getParameter("name");
		s3 = req.getParameter("phn");
		s4 = req.getParameter("email");
		s5 = req.getParameter("dob");
		s6 = req.getParameter("clg");
		s7 = req.getParameter("branch");
		s8 = req.getParameter("about");
		s9 = req.getParameter("pass");
		s10 = req.getParameter("ans");
		s11 = req.getParameter("que");

	        s9 = sha256(s9);
			//to encrypt the password field.


			out = res.getWriter();
			out.println("Trying...");
		try
		{

			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bechde?useSSL=false","ayush","ayush");
			

			if(!checkUserId(s1))
			{
				RequestDispatcher rd = req.getRequestDispatcher(req.getParameter("source_page"));
				
				req.setAttribute("error",true);
				
				out.println("<body><script type=\"text/javascript\">window.onload = alert(\"This UserName Already Exists\");</script></body>");

				//rd.forward(req, res);	
			}
			//to check if the user name already exists in the database.
			else
			{

				st = con.prepareStatement("insert into user_info values(?,?,?,?,?,?,?,?,?,?,?)");

				st.setString(1,s1);
				st.setString(2,s2);
				st.setString(3,s3);
				st.setString(4,s4);
				st.setString(5,s5);
				st.setString(6,s6);
				st.setString(7,s7);
				st.setString(8,s8);
				st.setString(9,s9);
				st.setString(10,s10);
				st.setInt(11,Integer.parseInt(s11));
				
				st.executeUpdate();
				con.close();
			out.println("Successful...");

			req.getSession().setAttribute("user_id",s1);
			
			RequestDispatcher rd = req.getRequestDispatcher("/add_user_image.jsp");	
			rd.forward(req,res);
			}
		}
		catch(Exception e)
		{					
			out.println(e.toString());
		}
			
	}
}
