<html>
	<head>
		<title>Generic Page - Massively by HTML5 UP</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-loading">

		<!-- Wrapper -->

			<div id="wrapper" class="fade-in">
				<!-- Header -->
					<header id="header">
						<a href="index.html" class="logo">Project X</a>
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
	<form method="post" action="AddProd">

	<div class="field">
		<label for="p_name_label">Name </label>
		<input type="text" name="p_name"  required/>
	</div>

	<div class="field">
		<label for="catgory">Category </label>
		<select name = "category">	
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

	<div class="12u$">
		<label for="description_label">Descripton </label>
		<textarea name="description" id="demo-message" placeholder="Enter description of your Product" rows="2" required></textarea>
	</div>

	<div class="field">
		<label for="price_label">Price</label>
		<input type="number" name="price" min="0" step="1" required/>
	</div>

	<div class="field">
		<label for="useful_for_label">Useful for : </label>
		<select name = "useful_for">	
					  <option value="xx">--ALL--</option>
					  <option value="cs">CS/IT</option>
					  <option value="ec">EC/EI/EX</option>
 					  <option value="me">Mech</option>
  					  <option value="ce">Civil</option>
  					  <option value="xx"></option>
		</select>
	</div>

	
	<ul class="actions">
	<li><input type="submit" value="Add" class="special" /></li>
	<li><input type="reset" value="Reset" /></li>
	</ul>
	</form>
	

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