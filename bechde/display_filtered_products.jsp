<!-- 
	This page is to display the list of filtered/searched products.
	URL : localhost:8080/bechde/display_filtered_prpducts.jsp?page_no=x
		x is any integer .. jo btata h ki kis page ki trh display krna h

	wse is page ko result set ka object b pass krna chahye session.setAttribute("result") krk..
	qki ye to srf select * from prod k lye hi h.. agr bahar se object pass krk isi me maintain kia to ksi b table k lye chalega
-->

<%@ page import = "fetch.*" %>
<!-- Apna khud ka package-->
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

			<div id="wrapper" class="fade-in">
				<!-- Header -->
					<header id="header">
						<a class="logo">Search Result</a>
					</header>

			<!-- Nav -->
			<nav id="nav">
				<ul class="links">
					<li><a href="homepage.jsp">Home</a></li>
					<li class="active"><a  href="Select_all">Products</a></li>
					<li><a href="acadcal.jsp">Acadmic Calender</a></li>
					<li><a href="papers.jsp">Question Papers</a></li>
					<li><a href="signout.jsp">Log Out</a></li>
				</ul>
			</nav>


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
          <form method="get" action="SearchProdd" class="alt">
	                <div class="6u 12u$(xsmall)">
	                     <input type="text" name="search_prod_text" size="10" value="" placeholder="I am looking for..." />   
	                </div>       
	                 <input type="submit" class="button special icon fa-search" size="10" value="Search" >
	        </form>     
	    <!-- KeyWord se search krna Product ko -->

	        <form method="get" action="add_product.jsp" class="alt">
	                <div class="6u 12u$(xsmall)">
	                 <input type="submit" class="button special icon fa-search" size="10" value="Add" >
	                </div>
	        </form>     
	            <!-- New product ko add karne k lye button (isko user page pr connect krna h) yha pr temporary h -->

	        <form method="get" action="GetUserDetails?user_id=ayu" class="alt">
	                <div class="6u 12u$(xsmall)">
	                 <input type="submit" class="button special icon fa-search" size="10" value="Edit Profile" >
	                </div>
	        </form>     
        <!-- User Details ko EDIT karne k lye button (isko user page pr connect krna h) yha pr temporary h -->

	        <form action="FilterProd">      
	                <div class="select-wrapper">
	                     <select name="filter">
	                        <option value="general">General</option>
	                        <option value="books">Books</option>
	                        <option value="electronic">Electronics</option>
	                        <option value="cloth">Clothing</option>
	                        <option value="shoes">Shoes</option>
	                        <option value="food">Food</option>
	                        <option value="stationery">Stationery</option>
	                        <option value="vehicle">Vehicle</option>
	                        <option value="others">--Other--</option>
	                    </select>
	                </div>
	            <input type="submit" name="filter_button" class="button special icon fa-search" size="10" value="Filter">
	        </form>
	    <!-- To filter prodcuts. -->

       		 <h2> List of all Products </h2>
      
    	<section class="posts"  >
      		<%
 		        try
           		{ 
           			rs = (ResultSet)session.getAttribute("result");
           			session.setAttribute("result",rs);
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
								<span class="date"><%=rs.getString("date_of_upload") %></span>
									<h2><a href="product_detail.jsp?p_id=<%=rs.getString("p_id")%>" target="_blank"> <%= rs.getString("p_name") %><br />
										</a>
									</h2>
							</header>
               				
               				<a target="_blank" href="product_detail.jsp?p_id=<%=rs.getString("p_id")%>" class="image fit"><img src="images/<%=rs.getString("p_id")+"_"+Integer.toString(1)+".jpg"%>" style="width:304px;height:228px;" alt="" /></a>
                            
                            <p>
                                <i><b> Description : </b></i><%= rs.getString("desciption")%>
                            </p>
                            <p>
                              	<i><b> Price : </b></i><%= rs.getString("price")%>
                            </p>                                   
                            <p>
                                <a href="#"> <i><b> Owner : </b></i> <%= rs.getString("owner")%> </a>
                            </p>
            
                            <ul class="actions">
               	                <li><a href="product_detail.jsp?p_id=<%=rs.getString("p_id")%>" class="button" target="_blank">Full Story</a></li>
                            </ul>


                            <!-- ye bhi yha temp h-->
                            <p>
                                <a href="<%=request.getContextPath()%>/DelProduct?p_id=<%=rs.getString("p_id")%>"><i><b>Delete </b></i></a>
                            </p>
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
	     		<a href="display_filtered_products.jsp?page_no=<%=page_no-1%>" class="previous">Prev</a>
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
					<a href="display_filtered_products.jsp?page_no=<%=page_no%>" class = "page active" ><%=page_no%></a>
					<!-- current page -->
			<%
					}
					else
					{
			%>
					<a href="display_filtered_products.jsp?page_no=<%=i%>" class = "page" ><%=i%></a>
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
				<a href="display_filtered_products.jsp?page_no=<%=page_no+1%>" class="next">Next</a>
				<!-- current page k just next page ki link dena -->
			<%
				}
			%>
		</div>
	</footer>
    </div> 
       
</body>
</html>