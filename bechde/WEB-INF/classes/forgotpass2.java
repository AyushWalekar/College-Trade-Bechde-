import java.sql.*;
import javax.servlet.http.*;  
import javax.servlet.*;
import java.security.MessageDigest;
import java.io.*;
public class forgotpass2 extends HttpServlet
{
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		res.setContentType("text/html;charset=UTF-8");
		
		boolean checker = false;
		String recoveryemail="";
		int quesno=0;
		String questring="";
		String ans ="";
		String sques="";
		


	recoveryemail = req.getParameter("email");
	ans = req.getParameter("ans");
	sques = req.getParameter("quesno");
	quesno = Integer.parseInt(sques);
	
	try
	{

	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bechde?useSSL=false","root","root");
	ps = con.prepareStatement("select * from user_info where email=? and security_ques_no=? and security_ans=?");
	ps.setString(1,recoveryemail);
    ps.setInt(2,quesno);
    ps.setString(3,ans);
    rs = ps.executeQuery();
    checker = rs.next();
    
    if(checker==true)
    {
    	res.sendRedirect("/bechde/ForgotPassword3.jsp?email="+recoveryemail+"");
    }
    else
    {
		res.sendRedirect("/bechde/servlets/servlet/homepage");
	}

   	//res.sendRedirect("/bechde/ForgotPassword2.jsp?email="+recoveryemail+"&quesno="+quesno+"&question="+questring+"");
	


	}
	catch(Exception e)
		{					
			System.out.println(e.toString());
		}
		
	}
}

