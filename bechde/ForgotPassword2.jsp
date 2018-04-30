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
			
		<form method="post" action="servlets/servlet/forgotpass2">

			
			<div id="main">
			<h3>Security Question :</h3><br>
			</div>
			<b><h3><%=request.getParameter("question")%> </h3></b>



			<input type="hidden" name="email" value="<%=request.getParameter("email")%>">
			
			<input type="hidden" name="quesno" value="<%=request.getParameter("quesno")%>">


			

			
			<div class="field" align="left">
			<label for="ans"><h4>Answer:</h4></label>
			<input type="password" name="ans" id="ans" />
		</div>
		
		<ul class="actions">
	
	
	<li><input type="submit" value="Submit" class="special" /></li>
	</ul>	
		
		
		</form>


</section>

		

						<%@ include file="Footer.jsp" %> 

						<%@ include file="Scripts.jsp" %> 
