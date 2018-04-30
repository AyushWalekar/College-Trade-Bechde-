import java.sql.*;
import javax.servlet.http.*;  
import javax.servlet.*;
import java.security.MessageDigest;
import java.io.*;




public class homepage extends HttpServlet
{
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	
	public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		res.setContentType("text/html;charset=UTF-8");

		String ses="";
		String name="";
        String username="";
        String email="";
        String phone="";
		String dob="";
        String college="";
 		String branch=""; 
		String about="";		
		

		HttpSession session = req.getSession();
		if( session != null)
		{
			ses = session.getAttribute("session").toString();
		}
		else 
		{
			res.sendRedirect("/bechde/login.jsp");
		}
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bechde?useSSL=false","root","root");
		        ps = con.prepareStatement("select * from user_info where user_id=?");
		        ps.setString(1,ses);
       		 	rs = ps.executeQuery();

				

			if (rs.next()) 
			{
          			name = rs.getString("name");
            			username = rs.getString("user_id");
            			email = rs.getString("email");
            			phone = rs.getString("phone_no");
				dob = rs.getString("dob");
            			college = rs.getString("college");
 				branch = rs.getString("branch"); 
				about = rs.getString("about");
			}        
			res.sendRedirect("/bechde/HomePage.jsp?name="+name+"&username="+username+"&email="+email+"&phone="+phone+"&dob="+dob+"&college="+college+"&branch="+branch+"&about="+about+"");
		}

		catch(Exception e)
      		{
			
        		e.printStackTrace();
      		}



		
	
	}
}
