import fetch.*;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;


public class Select_all extends HttpServlet
{
	 public void service(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException
     {
        Fetch.select("bechde","ayush","ayush","product_info");
        ResultSet rs;

        PrintWriter out = response.getWriter();
        //out.println("<h2> Search Result </h2>");
        try
        {
            rs = Fetch.rs;
        	if(!rs.next())
        	{
	        	out.println("<h2>No Result Found</h2>");
        	}
        
        else
        {
	     
         /*   	out.println("        <table border=20 cellspacing=20 cellpadding=10 >    <tr><th>Name</th><th>Category</th><th>Description</th><th>Price</th><th>Owner</th><th>Date of Upload</th></tr>");
	            while (rs.next())
	        	{
	            	out.println("<tr>");
	            	out.println("<td>" +  
	                rs.getString("p_name") + "</td><td> " + 
	                rs.getString("category") + "</td><td>" +
	                rs.getString("desciption") + "</td><td>" +
	                rs.getFloat("price") + "</td><td>" +
	                rs.getString("owner") + "</td><td>" +
	                
	                rs.getString("date_of_upload") + "</td>");
	            	out.println("</tr>");
	    		}
        	}
        */
                request.getSession().setAttribute("result",Fetch.rs);
                
                RequestDispatcher dispatcher = request.getRequestDispatcher("/display3.jsp?page_no=1");

                dispatcher.forward(request,response);
    	}
    }
        catch(SQLException e){}
    }
}