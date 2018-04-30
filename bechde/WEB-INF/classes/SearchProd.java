import fetch.*;
import javax.servlet.*;
import java.io.*;
import java.sql.*;


public class SearchProd extends GenericServlet
{
	 public void service(ServletRequest request, ServletResponse response)
        throws IOException, ServletException
     {
     	String search_text = request.getParameter("search_prod_text");
        Fetch.select("bechde","root","root","product_info", " p_name LIKE \'%"+search_text+"%\'");
        ResultSet rs;

        PrintWriter out = response.getWriter();
        out.println("<h2> Search Result </h2>");
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
             
                session.setAttribute("result",Fetch.rs);
                response.sendRedirect("/pro/display.jsp?page_no=1");
    	}
    }
        catch(SQLException e){}
    }
}