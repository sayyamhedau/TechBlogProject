<%@page import="org.nlt.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="error_page.jsp"%>

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
<title>TechBlog - Register</title>
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<div class="container">
		<form action="./userRegister" method="POST">
			<h2>User Registration</h2>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputEmail4">Name</label> <input type="text" name="name"
						class="form-control" id="name" placeholder="Enter Name">
				</div>
				<div class="form-group col-md-6">
					<label for="inputEmail4">Email</label> <input type="email"
						name="email" class="form-control" id="inputEmail4"
						placeholder="Email">
				</div>
				<div class="form-group col-md-6">
					<label for="inputPassword4">Password</label> <input type="password"
						name="password" class="form-control" id="inputPassword4"
						placeholder="Password">
				</div>
			</div>
			<div class="form-group">
				<label for="inputAddress">Bio</label> <input type="text" name="bio"
					class="form-control" id="inputAddress" placeholder="Enter bio">
			</div>
			<div class="form-group">
				<label for="inputAddress">Address</label> <input type="text" name="address"
					class="form-control" id="inputAddress" placeholder="1234 Main St">
			</div>
			<div class="form-check form-group">
			<label>Select Gender</label> <br>
				<input class="form-check-input" type="radio" name="gender"
					id="gridRadios1" value="male" checked> 
					<label
					class="form-check-label" for="gridRadios1"> Male</label> &nbsp &nbsp &nbsp &nbsp &nbsp
					<input class="form-check-input" type="radio" name="gender"
					id="gridRadios1" value="female"> 
					<label
					class="form-check-label" for="gridRadios1">Female</label>
			</div>

			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="inputCity">City</label> <input type="text" name="city"
						class="form-control" id="inputCity">
				</div>
				<div class="form-group col-md-4">
					<label for="inputState">State</label> <select id="state" name="state"
						class="form-control">
						<option selected>Select State</option>
						<option>Maharashtra</option>
						<option>Telanage</option>
						<option>Gujrat</option>
						<option>Karnataka</option>
					</select>
				</div>
				<div class="form-group col-md-2">
					<label for="inputZip">Zip</label> <input type="text" name="zip"
						class="form-control" id="inputZip">
				</div>
			</div>
			<button type="submit" class="btn btn-primary">Register</button>
		</form>

	</div>

</body>
</html>