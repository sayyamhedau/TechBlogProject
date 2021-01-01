<%@page import="org.nlt.model.Post"%>
<%@page import="java.util.List"%>
<%@page import="org.nlt.service.PostSevice"%>
<%@page import="org.nlt.service.LikeService"%>
<%@page import="org.nlt.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<div class="row">

	<%
		int userid = Integer.parseInt(request.getParameter("userid"));
		User user = (User) session.getAttribute("currantUser");

		Thread.sleep(50);

		List<Post> postList =PostSevice.getPostByUser(userid);
		
		for(Post post : postList){
			
		
	%>

	<div class="col-md-6 mt-2">

		<div class="card">
			<div class="card-body" style="box-shadow: 0 5px 25px 0 rgba(150, 150, 150, 0.6);">
				<h5 class="card-title">
					<b><%=post.getPost_title()%></b>
				</h5>


				<p class="card-text"><%=post.getPost_content()%></p>
				<a href="view_blog_post.jsp?postid=<%=post.getPid()%>"
					class="btn btn-outline-primary">Read More</a> <a href="#!"
					onclick="doLike(<%=post.getPid()%>,<%=user.getId()%>)"
					class="btn btn-outline-primary btn-sm" style="font-weight: bolder">
					<i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%=LikeService.totalCountOnPost(post.getPid())%></span>

				</a> <a href="#!" class="btn btn-outline-primary btn-sm"
					style="font-weight: bolder"> <i class="fa fa-commenting-o"></i>
					<span>C</span>
				</a>
			</div>
		</div>

	</div>

	<%
		}
	%>

</div>