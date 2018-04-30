<%@ page import = "fetch.*" %>
<%@ page import = "java.sql.*" %>

<html>

<head>
	<title>BechDe : Browse Products</title>
</head>

<body>
		<%! ResultSet rs; %>

		<% rs =  (ResultSet)request.getAttribute("result");  %>

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
			do
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
        }while(rs.next());
    %>
      </table> 
        
</body>
</html>