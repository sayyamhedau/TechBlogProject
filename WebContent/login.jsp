<%@page import="org.nlt.model.User"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.nlt.config.DatabaseConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page errorPage="error_page.jsp" %> 

<%
	User user = (User) session.getAttribute("currantUser");
	if (user != null) {
		response.sendRedirect("profile.jsp");
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<script type="text/javascript" src="js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/sweetalert.min.js"></script>
<title>TechBlog - Login</title>
</head>
<body>

	<jsp:include page="navbar.jsp"></jsp:include>

	<div class="container">
		<h2>
			<b>User Login</b>
		</h2>
		<form action="./userLogin" method="post">
			<div class="form-group">
				<label for="emailLabel">Email address</label> <input type="email" class="form-control" id="email" name="email"
					aria-describedby="emailHelp" placeholder="Enter email" required>
				<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
			</div>
			<div class="form-group">
				<label for="passwordLabel">Password</label> <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
			</div>
			<div class="form-check">
				<input type="checkbox" class="form-check-input" id="exampleCheck">
				<label class="form-check-label" for="exampleCheck">Remember me out</label>
			</div>
			<br>
			<button type="submit" id='submit' class="btn btn-primary">Login</button>
		</form>
	</div>
</body>
</html>