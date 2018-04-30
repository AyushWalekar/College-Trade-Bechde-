<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<html>
	<head>
		<title>Generic Page - Massively by HTML5 UP</title>
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


	<div id="main">

<section>
	<form method="post" action="regi">
	<div class="field">
		<label for="usern">Username</label>
		<input type="text" name="usern" id="usern" required onchange="checkUserId()" />
	</div>

	<div class="field">
		<label for="email">Email ID</label>
		<input type="email" name="email" id="email" required/>
	</div>

	<div class="field">
		<label for="pass">Password</label>
		<input type="password" name="pass" id="pass" required onchange="checkPassword()" />
	</div>

	<div class="field">
		<label for="name" >Full Name</label>
		<input type="text" name="name" id="name" required onchange="checkName()" />
	</div>

	<div class="field">
		<label for="phn">Phone Number &#9742</label>
		<input type="number" name="phn" id="phn" required onchange="checkPhoneNo()" />
	</div>

	<div class="field">
		<label for="dob">Date of Birth</label>
		<input type="date" name="dob" id="dob" required onchange="checkDob()" placeholder="yyyy-mm-dd" />
	</div>

	<div class="field">
		<label for="clg">College Name</label>
		<input type="text" name="clg" id="clg" required onchange="checkCollege()" />
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
		<label for="about">About &#9997</label>
		<textarea name="about" id="about" rows="3"></textarea>
	</div>	

	<div class="field">
		<label for="que">Security Question</label>
		<select name = "que">
					  <option value=1>Pet's Name?</option>
					  <option value=2>Mother's Maiden Name?</option>
 					  <option value=3>Name of First School?</option>
  					  <option value=4>On a scale of 1 to 10 how much retarded are you?</option>
				</select>
	</div>
	<div class="field">
		<label for="ans">Answer</label>
		<input type="text" name="ans" id="ans" required/>
	</div>
	
	<ul class="actions">
		<li><input type="submit" value="Register" class="special" onclick="checkBranch()"/></li>
		<li><input type="reset" value="Reset" /></li>
	</ul>


			<input type="hidden" name="source_page" value="reg.jsp" />
			<!-- khud ka nam servlet ko btane k lye -->
	</form>
	</section>

</div>
//<!-- ******************** To check if field are filled correctly or not ******************** -->
	<%! ArrayList<String> userid = new ArrayList<String>();%>
	<%
		Connection con;
		PreparedStatement st;
		ResultSet rs;
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bechde?useSSL=false","root","root");
		
			st = con.prepareStatement("select * from user_info");
			rs = st.executeQuery();
			while(rs.next())
				userid.add(rs.getString("user_id"));
		}
		catch(Exception e)
		{}
		//To get all the userIDs existing in the user_info table.. so as to ALERT user if it's not unique.
	%>


	<script type="text/javascript">

		//To check if userid is unique or not
		function checkUserId()
		{
			var usern = document.getElementById("usern").value;
			var userid  = [];
		<% 
			int i = 0, size = userid.size();
			for( i=0; i<size; i++)
			{
		%>	
				if(usern=="<%=userid.get(i)%>")
				{
					alert("This Username already exists.\nKuch naya socho xD.\n");
					document.getElementById("usern").value  = "";
					return ;
			    //In the array!
				} 
		<%
			}
		%>
		}

	</script>

	<script src="validation.js"></script>


	<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrollex.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>

</html>