<%@page import="org.nlt.service.LikeService"%>
<%@page import="org.nlt.model.PostLike"%>
<%@page import="org.nlt.model.User"%>
<%@page import="org.nlt.model.Post"%>
<%@page import="java.util.List"%>
<%@page import="org.nlt.service.PostSevice"%>

<div class="row">

	<%
	
		int cid = Integer.parseInt(request.getParameter("cid"));
		User user = (User) session.getAttribute("currantUser");
	
		Thread.sleep(50);

		List<Post> posts = null; 

		if (cid == 0) {
			posts = PostSevice.getAllPosts();
		} else {
			posts = PostSevice.getAllPostByCategory(cid);
		}

		if (posts.size() == 0) {
			out.println("<h3 class='display-4 text-center text-danger'>No Posts in this category..</h3>");
			return;
		}
		
		for (Post post : posts) {
	%>

	<div class="col-md-6 mt-2">

		<div class="card">
			<div class="card-body" style="box-shadow: 0 5px 15px 0 rgba(150, 150, 150, 0.6);">
				<h5 class="card-title">
					<b><%=post.getPost_title()%></b>
				</h5>
				
				
				<p class="card-text"><%=post.getPost_content()%></p>
				<a href="view_blog_post.jsp?postid=<%=post.getPid()%>"
					class="btn btn-outline-primary">Read More</a> 
					<a href="#!" onclick="doLike(<%=post.getPid()%>,<%=user.getId() %>)" class="btn btn-outline-primary btn-sm" style="font-weight: bolder">
					<i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%=LikeService.totalCountOnPost(post.getPid()) %></span>

				</a> <a href="#!" class="btn btn-outline-primary btn-sm"
					style="font-weight: bolder"> <i class="fa fa-commenting-o"></i>
					<span>C</span>
				</a>
			</div>
		</div>

	</div>

<%} %>

</div>

