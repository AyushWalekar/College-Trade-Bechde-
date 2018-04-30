<%@ page import = "fetch.*" %>
<%@ page import = "java.sql.*" %>

<html>

<head>
	<title>BechDe : Browse Products</title>
</head>

<body>

    <%  
        Fetch.select("bechde","ayush","ayush","product_info");
    %>
        <BR>
        <BR>
        <BR>
        <h2> List of all Products </h2>
        <table border="20" cellspacing="20" cellpadding="10" >
            <tr>
                <th>Name</th>
                <th>Category</th>
                <th>Description</th>
                <th>Price</th>
                <th>Owner</th>
                <th>Date of Upload</th>
            </tr>
      <%
        while (Fetch.rs.next())
        {
            out.println("<tr>");
            out.println("<td>" + 
                Fetch.rs.getString("p_name") + "</td><td> " + 
                Fetch.rs.getString("category") + "</td><td>" +
                Fetch.rs.getString("desciption") + "</td><td>" +
                Fetch.rs.getFloat("price") + "</td><td>" +
                Fetch.rs.getString("owner") + "</td><td>" +
                
                Fetch.rs.getString("date_of_upload") + "</td>");
            out.println("</tr>");
        }
    %>
      </table> 
        
</body>
</html>