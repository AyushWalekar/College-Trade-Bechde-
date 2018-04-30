import java.sql.*;
import javax.servlet.http.*;  
import javax.servlet.*;
import java.security.MessageDigest;
import java.io.*;
public class resetpass extends HttpServlet
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


	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		res.setContentType("text/html;charset=UTF-8");
		
		String email="";
		String password="";
		

	email = req.getParameter("email");
	System.out.println(email);
	password = req.getParameter("newpass");
	System.out.println(password);
	password = sha256(password);
	System.out.println(password);


	try
	{

	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bechde?useSSL=false","root","root");
	ps = con.prepareStatement("update user_info set password=? where email=?");
	ps.setString(1,password);
	ps.setString(2,email);
    ps.executeUpdate();

   

   	res.sendRedirect("/bechde/login.jsp");
	


	}
	catch(Exception e)
		{					
			System.out.println(e.toString());
		}
		
	}
}

