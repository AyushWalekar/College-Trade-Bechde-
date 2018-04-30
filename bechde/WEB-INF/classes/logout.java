import java.sql.*;
import javax.servlet.http.*;  
import javax.servlet.*;
import java.security.MessageDigest;
import java.io.*;
public class logout extends HttpServlet
{
	public void doGet(HttpServletRequest req,HttpServletResponse res)throws ServletException,IOException
	{
	
		res.setContentType("text/html;charset=UTF-8");
		HttpSession session = req.getSession(); 

		req.getSession().removeAttribute("result");
		req.getSession().removeAttribute("session");
 
	    session.invalidate();  
	    res.sendRedirect("/bechde/login.jsp");
	}
}

