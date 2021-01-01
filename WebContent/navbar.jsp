<%@page import="org.nlt.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-3.5.1.js"></script>

<title>Insert title here</title>

<style type="text/css">
	.bloggername{
		font-decoration:none;
		color:white;
		font-weight:bolder;
	}
	.bloggername:hover{
		color:white;
	}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark primary-background"
		style="background-color:black"> <a class="navbar-brand" style='font-weight:bolder'
		href="index.jsp"> <span class="fa fa-asterisk"></span> Tech Blog
	</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active">
				<!-- <a class="nav-link" href="#"> <span
					class="	fa fa-bell-o"></span> LearnCode with Durgesh <span
					class="sr-only">(current)</span></a> --> <a class="nav-link"
				href="index.jsp"> <span class="	fa fa-address-card-o"></span>
					Home
			</a>
			</li>

	<!-- 		<li class="nav-item dropdown active"><a
				class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <span class="	fa fa-check-square-o"></span>
					Categories
			</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="#">Programming Language</a> <a
						class="dropdown-item" href="#">Project Implementation</a>
					<div class="dropdown-divider"></div>
					<a class="dropdown-item" href="#">Data Structure</a>
				</div></li> -->

			<li class="nav-item"><a class="nav-link active" href="#"> <span
					class="	fa fa-address-card-o"></span> Contact
			</a></li>

			<%
				User user = (User) session.getAttribute("currantUser");
				if (user == null) {
			%>

			<li class="nav-item active"><a class="nav-link" href="login.jsp"> <span
					class="fa fa-user-circle "></span> Login
			</a></li>

			<li class="nav-item active"><a class="nav-link" href="register.jsp">
					<span class="fa fa-user-plus "></span> Sign up
			</a></li>
			<%
				}
			%>
			
			<li class="nav-item"><a class="nav-link active" href="#"> <span
					class="	fa fa-address-card-o"></span> Careers
			</a></li>
			

		</ul>

		<!-- 	<form class="form-inline my-2 my-lg-0">
			<input class="form-control mr-sm-2" type="search"
				placeholder="Search" aria-label="Search">
			<button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
			</form> -->
		
		
		<%
			if (user != null) {
		%>
		<li class="nav-item dropdown">
		<a class="nav-link dropdown-toggle active bloggername" href="#" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-haspopup="true"
				aria-expanded="false"> <span class="fa fa-check-square-o"></span>
					<%=user.getName() %>
			</a>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="#profile-modal" data-toggle="modal" data-target="#profile-modal">Profile</a> 
					<a class="dropdown-item" href="#add-post-modal" data-toggle="modal" data-target="#add-post-modal">Post Blog</a> 
					<a class="dropdown-item" href="./userLogout">Logout</a>
					<div class="dropdown-divider"></div>
				</div>
		</li>

		<%
			}
		%>
	</div>
	</nav>
</body>
</html>