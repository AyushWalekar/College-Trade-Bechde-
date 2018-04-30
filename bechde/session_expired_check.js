			function sessionCheck(){
				alert("gayayayayayayay");
			<%
			if(session.getAttribute("session") == null)
			{
		%>			

				window.location = "session_expired_page.jsp"; //redirect to session expired page
				
		<%
			}
		%>