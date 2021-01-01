<%@page import="org.nlt.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page errorPage="error_page.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-3.5.1.js"></script>

<style type="text/css">
.banner-background {
	clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
}
</style>
<title>TechBlog - Home</title>
</head>
<body>

	<jsp:include page="navbar.jsp"></jsp:include>

	<div class="container-fluid p-0 m-0">

		<div class="jumbotron dark-background text-white"
			style='background-color: black'>
			<div class="container">
				<h3 class="display-3">Welcome to Blog Portal</h3>

				<p>Welcome to technical blog, world of technology A programming
					language is a formal language, which comprises a set of
					instructions that produce various kinds of output. Programming
					languages are used in computer programming to implement algorithms.
				</p>
				<p>Most programming languages consist of instructions for
					computers. There are programmable machines that use a set of
					specific instructions, rather than general programming languages.</p>

				<button class="btn btn-outline-light btn-lg">
					<span class="fa 	fa fa-user-plus"></span> Start ! its Free
				</button>
				<a href="login.jsp" class="btn btn-outline-light btn-lg"> <span
					class="fa fa-user-circle fa-spin"></span> <%
 	User user = (User) session.getAttribute("currantUser");
 	if (user == null) {
 %> Login <%
 	} else {
 %> My Account <%
 	}
 %>
				</a>

			</div>
		</div>

	</div>



	<!-- Jumbotron -->
	<div class="jumbotron text-center blue-grey lighten-5">

		<!-- Title -->
		<h2 class="card-title h2">Material Design for Bootstrap</h2>

		<!-- Subtitle -->
		<p class="indigo-text my-4 font-weight-bold">Powerful and free
			Material Design UI KIT</p>

		<!-- Grid row -->
		<div class="row d-flex justify-content-center">

			<!-- Grid column -->
			<div class="col-xl-7 pb-2">

				<p class="card-text">Lorem ipsum dolor sit amet, consectetur
					adipisicing elit. Fuga aliquid dolorem ea distinctio exercitationem
					delectus qui, quas eum architecto, amet quasi accusantium, fugit
					consequatur ducimus obcaecati numquam molestias hic itaque
					accusantium doloremque laudantium, totam rem aperiam.</p>

			</div>
			<!-- Grid column -->

		</div>
		<!-- Grid row -->

		<hr class="my-4 pb-2">

		<button class="btn btn-outline-dark btn-rounded">
			Buy now <i class="far fa-gem ml-1"></i>
		</button>
		<button class="btn btn-outline-dark btn-rounded">
			Download <i class="fas fa-download ml-1"></i>
		</button>

	</div>
	<!-- Jumbotron -->


	<!-- Footer -->
	<footer class="page-footer font-small unique-color-dark">

	<div style="background-color: black;">
		<div class="container">

			<!-- Grid row-->
			<div class="row py-4 d-flex align-items-center">

				<!-- Grid column -->
				<div class="col-md-6 col-lg-5 text-center text-md-left mb-4 mb-md-0">
					<h6 class="mb-0" style='color: white'>Get connected with us on
						social networks!</h6>
				</div>
				<!-- Grid column -->

				<!-- Grid column -->
				<div class="col-md-6 col-lg-7 text-center text-md-right">

					<!-- Facebook -->
					<a class="fb-ic"> <i class="fab fa-facebook-f white-text mr-4">
					</i>
					</a>
					<!-- Twitter -->
					<a class="tw-ic"> <i class="fab fa-twitter white-text mr-4">
					</i>
					</a>
					<!-- Google +-->
					<a class="gplus-ic"> <i
						class="fab fa-google-plus-g white-text mr-4"> </i>
					</a>
					<!--Linkedin -->
					<a class="li-ic"> <i class="fab fa-linkedin-in white-text mr-4">
					</i>
					</a>
					<!--Instagram-->
					<a class="ins-ic"> <i class="fab fa-instagram white-text">
					</i>
					</a>

				</div>
				<!-- Grid column -->

			</div>
			<!-- Grid row-->

		</div>
	</div>

	<!-- Footer Links -->
	<div class="container text-center text-md-left mt-5">

		<!-- Grid row -->
		<div class="row mt-3">

			<!-- Grid column -->
			<div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">

				<!-- Content -->
				<h6 class="text-uppercase font-weight-bold">Company name</h6>
				<hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto"
					style="width: 60px;">
				<p style='font-weigth: bolder'>Sayyam Infotech Pvt. Ltd.</p>

			</div>
			<!-- Grid column -->

			<!-- Grid column -->
			<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">

				<!-- Links -->
				<h6 class="text-uppercase font-weight-bold">Follow us</h6>
				<hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto"
					style="width: 60px;">
				<p>
					<a href="#!">Facebook</a>
				</p>
				<p>
					<a href="#!">Google</a>
				</p>
				<p>
					<a href="#!">instagram</a>
				</p>
				<p>
					<a href="#!">Blogger</a>
				</p>

			</div>
			<!-- Grid column -->

			<!-- Grid column -->
			<div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">

				<!-- Links -->
				<h6 class="text-uppercase font-weight-bold">Useful links</h6>
				<hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto"
					style="width: 60px;">
				<p>
					<a href="login.jsp">Your Account</a>
				</p>
				<p>
					<a href="#!">Become an Affiliate</a>
				</p>
				<p>
					<a href="#!">Shipping Rates</a>
				</p>
				<p>
					<a href="https://www.google.com">Help</a>
				</p>

			</div>
			<!-- Grid column -->

			<!-- Grid column -->
			<div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">

				<!-- Links -->
				<h6 class="text-uppercase font-weight-bold">Contact</h6>
				<hr class="deep-purple accent-2 mb-4 mt-0 d-inline-block mx-auto"
					style="width: 60px;">
				<p>
					<i class="fas fa-home mr-3"></i> 37, Old Kailash Nagar
				</p>
				<p>
					<i class="fas fa-envelope mr-3"></i> admin@gmail.com
				</p>
				<p>
					<i class="fas fa-phone mr-3"></i> +91 8007391105
				</p>
				<p>
					<i class="fas fa-print mr-3"></i> + 91 839057988
				</p>

			</div>
			<!-- Grid column -->

		</div>
		<!-- Grid row -->

	</div>
	<!-- Footer Links --> <!-- Copyright -->
	<div class="footer-copyright text-center py-3">
		© 2020 Copyright: <a href="index.jsp"> blogportal.com</a>
	</div>
	<!-- Copyright --> </footer>
	<!-- Footer -->
</body>
</html>