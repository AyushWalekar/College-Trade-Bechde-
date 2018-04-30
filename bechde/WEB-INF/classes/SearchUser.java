import fetch.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;


public class SearchUser extends HttpServlet
{
	 public void doPost(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException
     {
     	String search_text = request.getParameter("search_user_text");
        Fetch.select("bechde","root","root","user_info", " user_id LIKE \'%"+search_text+"%\'");
        ResultSet rs;
        String ses="";

        HttpSession session = request.getSession();
		if( session != null)
		{
			ses = session.getAttribute("session").toString();
		}
		else 
		{
			response.sendRedirect("/bechde/login.jsp");
		}


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
               /* request.getSession().setAttribute("user_search_result",Fetch.rs);
                // setAttribute("koi b nam object ka",jo object ye wali servlet se bhejna h)

                RequestDispatcher dispatcher = request.getRequestDispatcher("/display_searched_users.jsp?page_no=1");
                //RequestDispatcher dispatcher = request.getRequestDispatcher("jis jsp pr bhejna h.jsp");

                dispatcher.forward(request,response);
    			*/
                session.setAttribute("user_search_result",Fetch.rs);
                response.sendRedirect("/bechde/display_searched_users.jsp?page_no=1");


    	}
    }
        catch(SQLException e){}
        
    }
}