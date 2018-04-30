
<html>
	<head>
		<title>CollegeTrade</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
				
				<%@ include file="Navi.jsp" %>  

				<!-- Main -->
					<div id="main">

							<section class="posts">
								<article>
									
										</h2><b><%=request.getParameter("name")%></b></h2>
									<br>
									<a href="#" class="image "><img width=500px height=500px src="images/<%=request.getParameter("username")%>.jpg" alt="I'm not ugly, just shy." /></a>
									
								
									<ul class="actions">
										<li><a href="#" class="button">More Details</a></li>
									</ul>
								</article>
								<article>
								<div align="left">
									<header>
									<br>
									</header>
									<b>Username:</b><%=request.getParameter("username")%><br>
									<b>Email ID :</b> <%=request.getParameter("email")%><br>		
									<b>Date of Birth :</b> <%=request.getParameter("dob")%><br>
									<b>College :</b> <%=request.getParameter("college")%><br>
									<b>Branch :</b><%=request.getParameter("branch")%><br>
									<b>About me :</b><%=request.getParameter("about")%><br>
								</div>
								</article>
							</section>
						</div>











		<%@ include file="Footer.jsp" %> 

		<%@ include file="Scripts.jsp" %> 
