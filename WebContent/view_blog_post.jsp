<%@page import="org.nlt.service.CategoryService"%>
<%@page import="org.nlt.service.UserService"%>
<%@page import="org.nlt.model.Post"%>
<%@page import="org.nlt.service.PostSevice"%>
<%@page import="org.nlt.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	User user = (User) session.getAttribute("currantUser");
	if (user == null) {
		response.sendRedirect("index.jsp");
	}

	Post post = PostSevice.getPostByPostId(Integer.parseInt(request.getParameter("postid")));
	String categoryname = CategoryService.getCategoryByCategoryId(post.getCategoryid()).getName();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TechBlog - <%=user.getName()%></title>
</head>
<body>
	<jsp:include page="navbar.jsp"></jsp:include>
	<div class="container col-md-6">
		<div class="card ">
			<div class="card-header">
				Post ID :
				<%=post.getPid()%></div>

			<div class="card-body text-center">
				<img src="images/
				<% if(categoryname.equalsIgnoreCase("travelling")){ %>
				travel.png"
				<%} else if(categoryname.equalsIgnoreCase("programming")){ 
				%>programmer.jpg"<%} else if(categoryname.equalsIgnoreCase("Covid-19")){%>covid19.jpg"<%} else if(categoryname.equalsIgnoreCase("bollywood")){ %>bollywood.jpg"<%} %>
				/>
			
				
				
				<h5 class="card-title">
					<b><%=post.getPost_title()%></b>
				</h5>
				<p class="card-text"><%=post.getPost_content()%></p>
				<a href="profile.jsp" class="btn btn-primary text-center">Back</a>
			</div>
			<div class="card-footer text-muted">
				<p>
					Posted By :
					<%=UserService.getUserbyUserid(post.getUserid()).getName()%></p>
				<p>
					Posted Date :
					<%=post.getPublishedDate().toLocaleString()%></p>
			</div>
		</div>
	</div>


</body>
</html>