
<!-- to check session expire hua hai ki ni at each step -->
<script type="text/javascript" >
	function sessionCheck(){
	<%
		if(session.getAttribute("session") == null)
		{
	%>			

		window.location = "session_expired_page.jsp"; //redirect to session expired page
	<%
		}
	%>
	}

</script>

	<body class="is-loading" onload="sessionCheck()">

				<!-- Wrapper -->
			<div id="wrapper" class="fade-in">
		
				
				<!-- Header -->
					<header id="header">
						<a href="servlets/servlet/homepage" class="logo">CollegeTrade</a>
					</header>

<!-- Nav -->
<nav id="nav">
	<ul class="links">
		<li class="active"><a href="servlets/servlet/homepage">Home</a></li>
		<li><a href="display_all_products.jsp?page_no=1">Products</a></li>
		<li><a href="Calender.jsp">Calender</a></li>
		<li><a href="papers.jsp">Question Papers</a></li>
		<li><a href="UserSearch.jsp">Search User</a></li>
		<li><a href="GetUserDetails?user_id="<%=session.getAttribute("session")%>">Edit Profile</a></li>
		<li><a href="servlets/servlet/logout">Log Out</a></li>
	</ul>
</nav>
