/*********** To check if session is expired or not *******/

function sessionCheck()
{
		<%
			if(session.getAttribute("session") == null)
			{
		%>			

				window.location = "session_expired_page.jsp"; //redirect to session expired page
				alert("sdfsgsgsdfgd");
		<%
			}
		%>
}
// it should be in seperate JS file but alas k karan yahi copy paaste kr dya :E)




//<!-- ******************** To check if field are filled correctly or not ******************** -->
	//To check password length
		function checkPassword()
		{
			var pass = document.getElementById("pass").value;
			if(pass.length<4)
			{
				alert("Woah!!\n Seriously.. You Lazy Human!!\nDon't you think it's too small to be set as a password.");
				document.getElementById("pass").value = "";
			}
		}

	//To check if phone no is of 10 digits or not.
		function checkPhoneNo()
		{
			var phone_no = document.getElementById("phn").value;
			if(phone_no.length!=10)
			{
				alert("As far as I know. . \nPhone numbers are of 10 digits. :");
				document.getElementById("phn").value = "";
			}
		}

	//To check age of the user
		function checkDob()
		{
			var dob = document.getElementById("dob").value;
			var yyyy = Number(dob.substr(0, 4)); //to extract birth year from the string.
			
			var today = new Date();
			var curr_yyyy = 1900 + today.getYear();

			age = curr_yyyy - yyyy;
				if(age<13)
				{
					if(age<0)
					{
						alert("Lol xD\nAren't you too young to be here,\n( OoO Unless you are a time-traveller! OoO)\n");
						document.getElementById("dob").value = "";
						return;
					}
					if(age<13)
						alert("Hey, sorry kids aren't allowed.\nYou won't find any candy here ._.");
					document.getElementById("dob").value = "";
				}
				else
				{
					if(age>75)
					{
						alert("Too old to be here.\nYou won't find your medicines here.");
						document.getElementById("dob").value = "";
					}
				//document.getElementById("phn").value = "";
				}
		}

		//To check if branch is filled or not.
		function checkBranch()
		{
			if(document.getElementById("branch").value=="XX")
			{
				alert("You haven't filled your Branch yet.");
			}
		}

		function checkName()
		{
			var str = document.getElementById("name").value;
			var pattern = /^[a-zA-Z ]+$/;
			 if(pattern.test(str)==false || str.length<3)
			 {
			 	alert("Hey, I don't think that is even a valid name.\nWhat kind of parents name their child "+str);
			 	document.getElementById("name").value = "";
			 }
		}
		//To check if user ka FULL NAME is a String pattern or not.
		
		function checkCollege()
		{
			var str = document.getElementById("clg").value;
			var pattern = /^[a-zA-Z ]+$/;
			 if(pattern.test(str)==false || str.length<3)
			 {
			 	alert("Hey, I don't think that is even a valid college name.\nCheck your ID card again or I am sorry.\n");
			 	document.getElementById("clg").value = "";
			 }

		}
		//To check if user ka College NAME is a String pattern or not.
