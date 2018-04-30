import java.sql.*;
import javax.servlet.http.*;  
import javax.servlet.*;
import java.security.MessageDigest;
import java.io.*;
public class login extends HttpServlet
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

boolean checkUser(String uname,String pass) 
{
     	boolean check = false;
     	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bechde?useSSL=false","root","root");
	         PreparedStatement ps = con.prepareStatement("select * from user_info where user_id=? and password=?");
        	ps.setString(1,uname);
     	    	ps.setString(2,pass);
     	   	ResultSet rs = ps.executeQuery();
      	   	check = rs.next();
        
      	}
	catch(Exception e)
      	{
        	e.printStackTrace();
      	}
        return check;                 
}   

	


	Connection con;

	public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException{
	res.setContentType("text/html;charset=UTF-8");

	String uname;
	String pass;

	uname = req.getParameter("uname");
	pass = req.getParameter("pass");
	pass = sha256(pass);
	




		
	if(checkUser(uname,pass))
       	{		
			HttpSession session=req.getSession();  
        		session.setAttribute("session",uname); 
			res.sendRedirect("/bechde/servlets/servlet/homepage");
			
	}	
        else
        {	
        	PrintWriter out = res.getWriter();
        	out.println("");
        	//out.println("<body onload=\" javascript:window.alert(\"Invalid Username or Password\"); window.location.href=\"localhost:8080/bechde/login.jsp\"; \"></body>");
        	out.println("<body style=\"color : blue;\" onload=\"alert(\"Invalid Username or Password\");\">Invalid username or password</body>");
        	res.sendRedirect("/bechde/login_error.jsp");
			///res.sendRedirect("/bechde/login.jsp");	
		
	}
	}
}
