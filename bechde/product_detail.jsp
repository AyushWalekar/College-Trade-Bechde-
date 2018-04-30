<!-- Is page ka URL is ".../product_detail.jsp?p_id=00000000xy" -->
<!-- ye p_id k base pr hi Resultset ka object return hoga -->
<!-- Images save kr lena WO pic bheji this usme se nam se "image" folder m-->

<%@ page import = "java.sql.*" %>
<%@ page import = "fetch.*" %>

<html>
	
	<head>
		<title>Massively by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>


		<!-- Ye khud ki banai hui CSS file -->
		<link rel="stylesheet" href="img_slide.css" />

	</head>

	<%@ include file="Navi.jsp" %>

	<!-- To get ResultSet ka object -->

		<%! 
			ResultSet rs; 
		%>
		<%
	        Fetch.select("bechde","ayush","ayush","product_info", " p_id = \""+request.getParameter("p_id")+"\"");
	        rs = Fetch.rs;
	        if(rs.next())
		%>

	<!-- ******************   Code to retrieve image ka names form the database ************************* -->
		<%!
			ResultSet rs_img;
			String img_name[];
			int no_of_images = 0;
		%>

		<%
	        Fetch.select("bechde","ayush","ayush","images", " image_name LIKE \'%"+rs.getString("p_id")+"%\'");
	        rs_img = Fetch.rs;
	       
	    %>




				<!-- Main -->
				<div id="main">					
					<div style="text-align: center;">
							<header>						
								<h2> <%= rs.getString("p_name") %><br /></h2>
							</header>									

					<div class="slidercontainer">
					<%
							 no_of_images = 0;
					        while(rs_img.next())
					        {
					      	//  img_name[no_of_images] = rs_img.getString("image_name");
					    		no_of_images++;
					        
					%>	
							<img class="img_slide"  src="images/<%=rs.getString("p_id")+"_"+Integer.toString(no_of_images)+".jpg"%>"  alt="Product Image"   />
					<%
							}
					%>

					</div>
					<!-- Buttons to change the slide -->
					<br>
						<button class="left" onclick="plusDivs(-1)"  >&#10094</button>
  						<button class="right" onclick="plusDivs(1)">&#10095</button>
				</div>


				<!-- Description wala part -->
					<div style="text-align: center;">
								<span class="date"><%=rs.getString("date_of_upload") %></span>
								<br>
								<strong>Price : </strong> &#8377 <%= rs.getString("price")%>
								</div>

								<div align="left">
										<br>
										<br>
									<b>Owner :</b> <a href="user_page.jsp?user_id=<%= rs.getString("owner")%>"><%= rs.getString("owner")%></a> 
										<br>		
									<b>Category : </b> <%= rs.getString("Category")%> 
										<br>
									<b>Product Description : </b> <%= rs.getString("desciption")%> 
										<br>
										<br>
								</div>





	<!-- ************* JS code to Create and manage image Slider ******************* -->
	<script>
		var slideIndex = 1;
		showDivs(slideIndex);

		function plusDivs(n) {
		  showDivs(slideIndex += n);
		}

		function showDivs(n) {
		  var i;
		  var x = document.getElementsByClassName("img_slide");
		  if (n > x.length) 
		  {
		  	slideIndex = 1;
		  }    
		  if (n < 1) {slideIndex = x.length;}
		  
		  for (i = 0; i < x.length; i++) 
		  {
		     x[i].style.display = "none";  
		  }
		  x[slideIndex-1].style.display = "block";  
		}
	</script>


		<%@ include file="Footer.jsp" %>
		<%@ include file="Scripts.jsp" %>