<html>
	<head>
		<title>CollegeTrade Forgot Password</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-loading">


			
				<!-- Header -->
					<header id="header">
		<a href="login.jsp" class="logo">College Trade</a>
					</header>

	<section>			
		<div id="main">

				<article class="post featured">
				<header class="major">
				<div >
				<h2>	<strong>Password Reset</strong></h2>
				</div>
			
		<form method="post" action="servlets/servlet/forgotpass">

		<div class="field" align="left">
			<label for="email"><h4>Email ID</h4></label>
			<input type="email" name="email" id="email" placeholder="Email" />
		</div>
		
		<ul class="actions">
		
	<div>
	Shit...I remember my password now <a href="login.jsp"><b>GO BACK!</b></a>
	</div>
	<img width=250px height=250px style="margin-bottom: 20px;" src="images/forgot_password.jpg">

	<br>
	<li><input type="submit" value="Submit" class="special" /></li>
	</ul>	
		
		
		</form>


</section>

						<%@ include file="Footer.jsp" %> 

						<%@ include file="Scripts.jsp" %> 
