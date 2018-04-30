<html>
	<head>
		<title>CollegeTrade - Password Reset</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-loading">


			
				<!-- Header -->
					<header id="header">
		<a href="login.jsp" class="logo">CollegeTrade</a>
					</header>

	<section>			
		<div id="main">

				<article class="post featured">
				<header class="major">
				<div >
				<h2>	<strong>Password Reset</strong></h2>
				</div>
			
		<form method="post" action="servlets/servlet/resetpass">

		

		

			
			<div class="field" align="left">
			<label for="newpass"><h3>New Password:</h3></label>
			<input type="password" name="newpass" id="newpass" />
		</div>
		
		<ul class="actions">

		<input type="hidden" name="email" value="<%=request.getParameter("email")%>">
	
	
	<li><input type="submit" value="Submit" class="special" /></li>
	</ul>	
		
		
		</form>


</section>

		
		<%@ include file="Footer.jsp" %> 

		<%@ include file="Scripts.jsp" %> 
