//This servlet will be called when user will click "EDIT PROFILE" button
// This will return RESULTSET (Jis user ki edit krni h uski detials) to "edit_profile.jsp"


import fetch.*;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;


public class GetUserDetails extends HttpServlet
{
    public void doGet(HttpServletRequest request,HttpServletResponse response)
        throws IOException, ServletException
     {
        
         PrintWriter out = response.getWriter();

        //Fetch.select("bechde","ayush","ayush","user_info", " user_id = \""++"\"");
        Fetch.select("bechde","ayush","ayush","user_info", " user_id = \""+ "ayush" +"\"");
        ResultSet rs;

        out.println("<h2>"+request.getParameter("user_id")+"</h2>");
        out.println();


        try
        {
            rs = Fetch.rs;
        	if(!rs.next())
        	{
	        	out.println("<h2>No Result Found</h2>");
        	}
        
            else
            {
    	     
                request.setAttribute("result",Fetch.rs);
                    
                RequestDispatcher dispatcher = request.getRequestDispatcher("/edit_profile.jsp");

                dispatcher.forward(request,response);
        	}
        }
        catch(SQLException e){}
    }
}