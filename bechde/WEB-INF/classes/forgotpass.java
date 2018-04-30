import java.sql.*;
import javax.servlet.http.*;  
import javax.servlet.*;
import java.security.MessageDigest;
import java.io.*;
public class forgotpass extends HttpServlet
{
	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	
	
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
		res.setContentType("text/html;charset=UTF-8");
		
		String recoveryemail="";
		int quesno=0;
		String questring="";
		PrintWriter out = res.getWriter();

	recoveryemail = req.getParameter("email");
	try
	{

	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bechde?useSSL=false","root","root");
	ps = con.prepareStatement("select * from user_info where email=?");
	ps.setString(1,recoveryemail);
    rs = ps.executeQuery();

    if (rs.next()) 
	{
    			quesno = rs.getInt("security_ques_no");
   	
   	   
	//questring = Integer.toStrin
   	
	//req.setAttribute("question",questring);
	//RequestDispatcher dispatcher = req.getRequestDispatcher("/ForgotPassword2.jsp");
	//dispatcher.forward(req,res);
   	switch(quesno)
   	{
   			case 1 :
   			{
   				questring="Pet's Name";
   				break;
   			}
   			case 2 :
   			{
   				questring="Mother's Maiden Name";
   				break;
   			}
   			case 3 :
   			{
   				questring="Name of First School";
   				break;
   			}
   			case 4 :
   			{
   				questring="On a scale of 1 to 10 how much retarded are you";
   				break;
   			}
   	}

   	res.sendRedirect("/bechde/ForgotPassword2.jsp?email="+recoveryemail+"&quesno="+quesno+"&question="+questring+"");
	}
	else
	{
			res.setContentType("text/html");  
			out.println("<script type=\"text/javascript\">");  
			out.println("alert('deadbeef');");  
			out.println("</script>");				
			res.sendRedirect("/bechde/login.jsp");
		
	}


	}
	catch(Exception e)
		{	
			
			res.setContentType("text/html");  
			out.println("<script type=\"text/javascript\">");  
			out.println("alert('deadbeef');");  
			out.println("</script>");				
			res.sendRedirect("/bechde/login.jsp");
			System.out.println(e.toString());

		}
		
	}
}

