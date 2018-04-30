<%@ page import = "fetch.*" %>
<%@ page import = "java.sql.*" %>

<html>

<head>
	<title>BechDe : Browse Products</title>
			<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>

</head>

<body class="is-loading" >

		<%! ResultSet rs; %>

		<% rs =  (ResultSet)request.getAttribute("result");  %>

        <BR>
        <BR>
        <BR>

        <div id="main">
        <h2> List of all Products </h2>
      
          <section class="posts"  >
      <%
			do
			{ %>
        
                                <article>
                                    <header>
                                        <span class="date"><%=rs.getString("date_of_upload") %></span>
                                        <h2><a href="product_detail.jsp?p_id=<%=rs.getString("p_id")%>"> <%= rs.getString("p_name") %><br />
                                        </a></h2>
                                    </header>
               <a href="product_detail.jsp?p_id=<%=rs.getString("p_id")%>" class="image fit"><img src="images/<%=rs.getString("p_id")+".jpg"%>" style="width:304px;height:228px;" alt="" /></a>

                                 <!--   <a href="#" class="image fit"><img src="images/pic02.jpg" alt="" /></a> -->
                                    <p>
                                        <i><b> Description : </b></i><%= rs.getString("desciption")%>
                                    </p>
                                    <p>
                                        <i><b> Price : </b></i><%= rs.getString("price")%>
                                    </p>                                    <p>
                                        <a href="#"><i><b> Owner : </b></i><%= rs.getString("owner")%></a>
                                    </p>
                                    <ul class="actions">
                                        <li><a href="product_detail.jsp?p_id=<%=rs.getString("p_id")%>" class="button">Full Story</a></li>
                                    </ul>
                                  </p>                                    <p>
                                        <a href="<%=request.getContextPath()%>/DelProduct?p_id=<%=rs.getString("p_id")"><i><b>Delete </b></i></a>
                                    </p>
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
	 </section>
    </div>        
</body>
</html>