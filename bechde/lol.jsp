<%@ page import = "fetch.*" %>
<%@ page import = "java.sql.*" %>

<html>
<head>
	<title>BechDe :  Products</title>
</head>
<body>

		wo layout rahta h na
	frameset?
	layout xD me dekh k batata hu
	div tag?
	
    <form action="SearchProdd">
            <input type="textfield" name="search_prod_text" size="20" value=""/>

            <input type="submit" name="search_prod_button" size="10" value="Search"/>
    </form>

    <select>
    	<option value="electronic">Electronics</option>
    	<option value="study stuff">Study Stuff</option>
    	<option value="clothing">Clothing</option>
    	<option value="shoes">Shoes</option>
    	<option value="grocery">Grocery</option>


    </select>

        <!-- <jsp:include page="display_products_all.jsp"/> -->
        <%!     ResultSet   rs; %>

       <%

       /* Fetch.select("bechde","ayush","ayush","product_info");

        //PrintWriter out = response.getWriter();
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
	                RequestDispatcher dispatcher = request.getRequestDispatcher("/display.jsp");

	                dispatcher.forward(request,response);
	    	}
    	}
        catch(SQLException e){}
    
*/
       %>



</body>
</html>