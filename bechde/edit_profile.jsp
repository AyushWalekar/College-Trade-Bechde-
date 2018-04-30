<!-- This JSP page is to allow user to edit his/her details -->

<%@ page import = "java.sql.*" %>

<html>
	<head>
		<title>Bechde : Edit Profile</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
<script src="validation.js"></script>
	
				<%@ include file="Navi.jsp" %>  

		<%
			ResultSet rs = (ResultSet)request.getAttribute("result"); 
			//Servlet se user ki details uth kr aegi aur yha pr text fields ko pre-fill kregi.
		%>


	<div id="main">
		<section>
			<form method="post" action="EditProfile">
				<div class="field">
					<label for="usern">Username</label>
					<input type="text" name="user_id" id="user_id" readonly required value="<%=session.getAttribute("session")%>" />
																						<!-- this is to be replaced by SESSIONiD -->
				</div>

				<div class="field">
					<label for="email">Email ID</label>
					<input type="text" name="email" id="email" required value="<%=rs.getString("email")%>" />
				</div>

				<div class="field">
					<label for="name">Name</label>
					<input type="text" name="name" id="name" onchange="checkName()" required value="<%=rs.getString("name")%>" />
				</div>

				<div class="field">
					<label for="phn">Phone Number</label>
					<input type="text" name="phone_no" id="phn" onchange="checkPhoneNo()" required value="<%=rs.getString("phone_no")%>"/>
				</div>

				<div class="field">
					<label for="dob">Date of Birth</label>
					<input type="date" name="dob" id="dob" onchange="checkDob()"  required value="<%=rs.getDate("dob")%>"/>
				</div>

				<div class="field">
					<label for="clg">College Name</label>
					<input type="text" name="college" id="clg" onchange="checkCollege()" required value="<%=rs.getString("college")%>"/>
				</div>

				<div class="field">
					<label for="branch">Branch</label>
					<select name = "branch" id="branch" required value="select" onchange="checkBranch()">			
						<option value="XX">-- Select --</option>
						<option value="AU">Automobile Eng</option>
						<option value="CE">Civil Eng</option>
						<option value="CS">Computer Science Eng</option>
						<option value="EE">Electrical Eng</option>
						<option value="EC">Electronics and Communication</option>
			 			<option value="EI">Electronics and Instrumentation</option>
			  			<option value="IT">Information and Technology</option>
			  			<option value="ME">Mechanical Eng</option>
					</select>
				</div>

				<div class="field">
					<label for="about">About</label>
					<textarea name="about" id="about" rows="3" > <%=rs.getString("about")%> </textarea>
				</div>	

				<ul class="actions">
				<li><input type="submit" value="Apply Changes" class="special" /></li>
				<li><input type="reset" value="Reset" /></li>
				</ul>
			</form>
			


			</section>

				<%@ include file="Scripts.jsp" %>  
				<%@ include file="Footer.jsp" %>  



