<html>
	<head>
		<title>CollegeTrade Registration Add Image</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-loading">

	
			<div id="wrapper" class="fade-in">
				<!-- Header -->
					<header id="header">
						<a href="login.jsp" class="logo">CollegeTrade</a>
					</header>

		<div id="main">		

<section>

	<form action="AddUserImage" method="post" enctype="multipart/form-data" target="_blank" >
		<div class="field">
			<label> Upload Your Image :</label>
			<br>
			<input type="file" name="p_pic"  multiple/>
		</div>
			<ul class="actions">
			<li><input type="submit" value="Add Image" class="special" ></li>
			</ul>
	</form>

	<% 
		session.setAttribute("user_id", (String)session.getAttribute("user_id"));
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