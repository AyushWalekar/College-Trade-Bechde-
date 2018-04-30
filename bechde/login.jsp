<html>
	<head>
		<title>CollegeTrade - Login</title>
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

				
		<div id="main" align="center">

				<article class="post featured">
				<header class="major">
				<h2>Sign In</h2>
			
		<form method="post" action="servlets/servlet/login" class="alt">
		
		<div class="field">
		<input type="text" name="uname" id="uname" value="" placeholder="Username" />
		</div>
		
		<div class="field">
		<input type="password" name="pass" id="pass" value="" placeholder="Password" />
		</div>	
		<br><br>
		<div>
		<h3>	<a href="ForgotPassword.jsp">Forgot Password? </a> </h3>
		</div>
	<div align="center">
		<ul class="actions">
		<li><input type="submit" value="Login" class="special" /></li>
		<li><input type="reset" value="Reset" /></li>
	</ul>
	</div>
	<div id="main">
	<h3>Not a user? <a href="reg.jsp">Register</a><br></h3>
	</div>


</div>
</form>




		<%@ include file="Footer.jsp" %> 

		<%@ include file="Scripts.jsp" %> 
