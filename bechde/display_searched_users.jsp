<!-- 
	This page is to display the list of products.
	URL : localhost:8080/bechde/display3.jsp?page_no=x
		x is any integer .. jo btata h ki kis page ki trh display krna h

	wse is page ko result set ka object b pass krna chahye request.setAttribute krk..
	qki ye to srf select * from prod k lye hi h.. agr bahar se object pass krk isi me maintain kia to ksi b table k lye chalega
-->

<%@ page import = "fetch.*" %>
<!-- Apna khud ka package-->
<%@ page import = "java.sql.*" %>
<html>
	<head>
		<title>Search User</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>

	<%@ include file="Navi.jsp" %>  
	<%@ include file="UserSearchBar.jsp" %>  

		<%! ResultSet rs;
            int page_no=1, no_of_rows=1;
            //page_no : to keep track (mtlb ab is JSP ko kis page ki trh act krna h)
            //no_of_rows : to calculate total no. of rows in the RESULTSET obj
         %>
         	<!-- -->

		<%
            page_no = Integer.parseInt((String)request.getParameter("page_no"));
            //URL m se page_no ki value ko extract krna.
         %>

        <div id="main">
	            <!-- New product ko add karne k lye button (isko user page pr connect krna h) yha pr temporary h -->

       		 <h2> List of all Users </h2>
      
    	<section class="posts" >
      		<%
 		        try
           		{ 
           			rs = (ResultSet)session.getAttribute("user_search_result");
           			session.setAttribute("user_search_result",rs);
           			rs.beforeFirst();
            		for(int j=1; j<page_no; j++)
            		{
			    		rs.next();
			    		rs.next();
					}
					/*This loop is to make RS skip 'n' no of values (depending on the current page number)
						jse abi page no = 3 h.. rs.next 4 bar chalega(qki abi 2 posts per page rkha h)
					*/

					for(int i=0; i<2 &&  rs.next(); 	i++)
					{ 
						//Ye loop 2 (posts per page) bar chalega aur section m image, name etc display karega.
			%>
        	            <article>
 							<header>
									<h2><a href="servlets/servlet/userpage?user_id=<%=rs.getString("user_id")%>" target="_blank"> <%= rs.getString("user_id") %><br />
										</a>
									</h2>
							</header>
               				
               				<a target="_blank" href="servlets/servlet/userpage?user_id=<%=rs.getString("user_id")%>" class="image fit"><img src="images/<%=rs.getString("user_id")+".jpg"%>" style="width:304px;height:228px;vertical-align:center;justify-content:center;" alt="" /></a>
                            
                     		<h2><a href="servlets/servlet/userpage?user_id=<%=rs.getString("user_id")%>" target="_blank"> <%= rs.getString("name") %><br />
								</a>
							</h2>

                            <ul class="actions">
               	                <li><a href="servlets/servlet/userpage?user_id=<%=rs.getString("user_id")%>" class="button" target="_blank">Show Profile</a></li>
                            </ul>
                        </article>

            <% 
        			} 

            	}
            	catch(Exception e){out.println(e);}
        %>
	 	</section>


    <footer>
		<div class="pagination">
			<%
				if(page_no>1) 
				{
			%>
	     		<a href="display_searched_users.jsp?page_no=<%=page_no-1%>" class="previous">Prev</a>
	     		<!-- current page ki pichle page ki link dena -->
	     	<% 
	     		}
	     		rs.first();
	     		if(rs.last());
		     	no_of_rows = rs.getRow();
		     	//To count the number of rows (last p le ja kr rows ka number le lo xD (jugaad))

	     		for(int i=1; i<=no_of_rows/2; i++)
	   			{	//2 posts per page is isly /2 kia
		     		if(i == page_no)
					{
			%>
					<a href="display_searched_users.jsp?page_no=<%=page_no%>" class = "page active" ><%=page_no%></a>
					<!-- current page -->
			<%
					}
					else
					{
			%>
					<a href="display_searched_users.jsp?page_no=<%=i%>" class = "page" ><%=i%></a>
					<!-- next pages ki link dena -->
			<%
					}
			%>
			<%
				}
			%>
				<span class="extra">&hellip;</span>	
			<% 
				if(page_no <= no_of_rows/2)
				{ //taki har bar next next na dikhae list khtm hone k bad b!! xD
			%>		
				<a href="display_searched_users.jsp?page_no=<%=page_no+1%>" class="next">Next</a>
				<!-- current page k just next page ki link dena -->
			<%
				}
			%>

		</div>
	</footer>
</div>

			
						<%@ include file="Footer.jsp" %> 

						<%@ include file="Scripts.jsp" %> 
       
</body>
</html>