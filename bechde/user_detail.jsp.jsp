
<html>
	<head>
		<title>CollegeTrade</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-loading">

		<!-- Wrapper -->
			<div id="wrapper" class="fade-in">

				<!-- Intro -->
					<div id="intro">
						<h1>Name of the project xD</h1>
						<p>And its badass :3</p>
						<ul class="actions">
							<li><a href="#header" class="button icon solo fa-arrow-down scrolly">Continue</a></li>
						</ul>
					</div>
				<!-- Header -->
					<header id="header">
						<a href="index.html" class="logo">Project X</a>
					</header>

<!-- Nav -->
<nav id="nav">
	<ul class="links">
		<li class="active"><a href="homepage.jsp">Home</a></li>
		<li><a href="product.jsp">Products</a></li>
		<li><a href="acadcal.jsp">Acadmic Calender</a></li>
		<li><a href="papers.jsp">Question Papers</a></li>
		<li><a href="UserSearch.jsp">Search User</a></li>
		<li><a href="signout.jsp">Log Out</a></li>
	</ul>
</nav>



				<!-- Main -->
					<div id="main">


<section class="posts">
								<article>
									
										</h2><b><%=request.getParameter("name")%></b></h2>
									
									<a href="#" class="image fit"><img src="images/<%=request.getParameter("username")%>.jpg" alt="" /></a>
									
								
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
									<b>Password :</b> *******<br>
									<b>Date of Birth :</b> <%=request.getParameter("dob")%><br>
									<b>College :</b> <%=request.getParameter("college")%><br>
									<b>Branch :</b><%=request.getParameter("branch")%><br>
									<b>About me :</b><%=request.getParameter("about")%><br>
								</div>
								</article>
								</section>
								</div>
							</div>

							<%@ include file="Footer.jsp" %> 

							<%@ include file="Scripts.jsp" %> 

