<html>
	<head>
		<title>Generic Page - Massively by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-loading">

	
			<div id="wrapper" class="fade-in">
				<!-- Header -->
					<header id="header">
						<a class="logo">Upload Image</a>
					</header>

			<!-- Nav -->
			<nav id="nav">
				<ul class="links">
					<li><a href="homepage.jsp">Home</a></li>
					<li><a  href="Select_all">Products</a></li>
					<li><a href="acadcal.jsp">Acadmic Calender</a></li>
					<li><a href="papers.jsp">Question Papers</a></li>
					<li><a href="signout.jsp">Log Out</a></li>
				</ul>
			</nav>

		<div id="main">		

<section>

	<form action="AddImage" method="post" enctype="multipart/form-data" target="_blank" >
		<div class="field">
			<label> Upload Image of your Product :</label>
			<br>
			<input type="file" name="p_pic"  multiple/>
		</div>
			<ul class="actions">
			<li><input type="submit" value="Add Image" class="special" ></li>
			</ul>
	</form>

	<% session.setAttribute("p_id", (String)request.getParameter("p_id"));
	%>

</section>

	<script src="assets/js/jquery.min.js"></script>  
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	
	</div>
	</div>

	</body>


</html>