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
      

      <%
			do
			{ %>
          <section class="posts">
                                <article>
                                    <header>
                                        <span class="date"><%=rs.getString("date_of_upload") %></span>
                                        <h2><a href="#"> <%= rs.getString("p_name") %><br />
                                        </a></h2>
                                    </header>
                                 <!--   <a href="#" class="image fit"><img src="images/pic02.jpg" alt="" /></a> -->
                                    <p>
                                        <%= rs.getString("desciption")%>
                                    </p>
                                    <ul class="actions">
                                        <li><a href="#" class="button">Full Story</a></li>
                                    </ul>
                                </article>
            <% } while(rs.next());

          /*  out.println("<tr>");
            out.println("<td>" + 
                rs.getString("p_name") + "</td><td> " + 
                rs.getString("category") + "</td><td>" +
                rs.getString("desciption") + "</td><td>" +
                rs.getFloat("price") + "</td><td>" +
                rs.getString("owner") + "</td><td>" +
                
                rs.getString("date_of_upload") + "</td>");
            out.println("</tr>");
        }while(rs.next());
        */
    %>        
</body>
</html>