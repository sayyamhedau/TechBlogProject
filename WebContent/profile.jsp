<%@page import="org.nlt.model.Post"%>
<%@page import="org.nlt.service.PostSevice"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.nlt.model.Category"%>
<%@page import="java.util.List"%>
<%@page import="org.nlt.service.CategoryService"%>
<%@page import="org.nlt.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%
	User user = (User) session.getAttribute("currantUser");
	if (user == null)
		response.sendRedirect("login.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/sweetalert.min.js"></script>
<script type="text/javascript" src="js/myScript.js"></script>

<title>TechBlog - <%
	if (user != null) {
%> 
<%=user.getName()%> 
<%
 	}
	else{
 %>
 Blogger
 <%} %>
</title>
</head>
<body>


	<jsp:include page="navbar.jsp"></jsp:include>

	<!--profile modal-->



	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel"><b>TechBlog</b></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="images/<%if(user.getGender().equalsIgnoreCase("male")){ %>man.png<%}else {%>female.png<%} %>" class="img-fluid" style="border-radius: 50%; max-width: 40%;"> <br>
						<h5 class="modal-title mt-3" id="exampleModalLabel">
							<%=user.getName()%>
						</h5>
						<!--//details-->

						<div id="profile-details">
							<table class="table">
								<tbody>
									<tr>
										<th scope="row">1</th>
										<td>User ID</td>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<th scope="row">2</th>
										<td>Name</td>
										<td><%=user.getName()%></td>
									</tr>
									<tr>
										<th scope="row">3</th>
										<td>Email-id</td>
										<td><%=user.getEmail()%></td>
									</tr>
									<tr>
										<th scope="row">4</th>
										<td>Password</td>
										<td><%=user.getPassword()%></td>
									</tr>
									<tr>
										<th scope="row">5</th>
										<td>Gender</td>
										<td><%=user.getGender().toUpperCase()%></td>
									</tr>
									<tr>
										<th scope="row">6</th>
										<td>Bio</td>
										<td><%=user.getBio()%></td>
									</tr>
									<tr>
										<th scope="row">7</th>
										<td>City</td>
										<td><%=user.getCity()%></td>
									</tr>
									<tr>
										<th scope="row">8</th>
										<td>State</td>
										<td><%=user.getState()%></td>
									</tr>
									<tr>
										<th scope="row">9</th>
										<td>Zip Code</td>
										<td><%=user.getZipCode()%></td>
									</tr>
									<tr>
										<th scope="row">10</th>
										<td>Registed on</td>
										<td><%=user.getLastLoggedIn().toString()%></td>
									</tr>
								</tbody>
							</table>
						</div>

						<!--profile edit-->

						<div id="profile-edit" style="display: none;">
							<h3 class="mt-2">Please Edit Carefully</h3>
							<form action="./userUpdate" method="post"
								enctype="multipart/form-data">
								<table class="table">
									<tr>
										<td>ID :</td>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<td>Name :</td>
										<td><input type="text" class="form-control"
											name="user_name" value="<%=user.getName()%>" required></td>
									</tr>
									<tr>
										<td>Email :</td>
										<td><input type="email" class="form-control"
											name="user_email" value="<%=user.getEmail()%>" required></td>
									</tr>

									<tr>
										<td>Password :</td>
										<td><input type="password" class="form-control"
											name="user_password" value="<%=user.getPassword()%>" required>
										</td>
									</tr>
									<tr>
										<td>Gender :</td>
										<td><%=user.getGender().toUpperCase()%></td>
									</tr>
									<tr>
										<td>Bio :</td>
										<td><textarea rows="3" class="form-control"
												name="user_bio"><%=user.getBio()%>
                                                </textarea></td>
									</tr>
									<tr>
										<td>New Profile:</td>
										<td><input type="file" name="image" class="form-control">
										</td>
									</tr>

								</table>

								<div class="container">
									<button type="submit" class="btn btn-outline-primary">Save</button>
								</div>

							</form>

						</div>

					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button id="edit-profile-button" type="button"
						class="btn btn-primary">EDIT</button>
				</div>
			</div>
		</div>
	</div>
	<!--end of profile modal-->




	<!--add post modal-->
	<!-- Modal -->
	<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel"><b>Provide the
						post details..</b></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<form id="add-post-form" action="./addpost" method="post">

						<div class="form-group">
							<select class="form-control" id="cid" name="cid">
								<option selected>---Select Category---</option>
								<%
									List<Category> categoryList = CategoryService.getAllCategories();
									Iterator<Category> itr = categoryList.iterator();
									while (itr.hasNext()) {
										Category category = itr.next();
								%>

								<option value="<%=category.getCid()%>"><%=category.getName()%></option>


								<%--            <%
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = postd.getAllCategories();
                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>

                                    <%
                                        }
                                    %> --%>

								<%
									}
								%>
							</select>
						</div>

						<div class="form-group">
							<input name="pTitle" id="pTitle" type="text" placeholder="Enter post title"
								class="form-control" required />
						</div>

						<div class="form-group">
							<textarea name="pContent" id="pContent" class="form-control" rows='12'
								placeholder="Enter your content"></textarea>
						</div>

						<div class="container text-center">
							<button type="submit" id="submit" class="btn btn-outline-primary">Post</button>
						</div>

					</form>

				</div>

			</div>
		</div>
	</div>

	<!--END add post modal-->
	
	
	
	
        <!--main body of the page-->

        <main>
            <div class="container-fluid">
                <div class="row mt-4">
                    <!--first col-->
                    <div class="col-md-3">
                        <!--categories-->
                        <div class="list-group">
                        	<b><a href="#" onclick="getPostByUser(<%= user.getId() %>,this)"  class="c-link list-group-item list-group-item-action active">
                                My Posts
                            </a></b>
                            <a href="#" onclick="getPosts(0, this)"  class="c-link list-group-item list-group-item-action active">
                                All Posts
                            </a>
							
                            
							<% for(Category category : categoryList){ %>
							
							 <a href="#" onclick='getPosts(<%= category.getCid()%>, this)' class="c-link list-group-item list-group-item-action"><%= category.getName()%></a>
							 <%} %>


					<!--notice/links section -->
					<div class="notices_circulars" style='background-color:#007bff;margin-top:30px;padding:30px;box-shadow: 0 5px 25px 0 rgba(150, 150, 150, 0.6);'>
						<h2 style="font-weight:bolder;color:#fff">Notices &amp; Circulars</h2>
						<div class="event-row notices">
							<marquee direction="up" scrollamount="5" loop="infinite"
								behavior="scroll" onmouseover="this.stop();"
								onmouseout="this.start();" style="padding-bottom: 30px;height=125;color:white;margin-top:10px" >


								<a id="ContentPlaceHolder1_Repeater_Notice_HyperLink_DeptNews_0" href="./download?filename=sample1"
									style="font-size: 13px; font-weight: bold;text-decoration:none;color:white">'Online
									Stastics Blogging Process 2020-2021'</a> <img
									id="ContentPlaceHolder1_Repeater_Notice_Image_NewNews_0"
									src="images/new_blink.gif"><br> <br>

								<hr>



								<a id="ContentPlaceHolder1_Repeater_Notice_HyperLink_DeptNews_1" href="./download?filename=sample2"
									style="font-size: 13px; font-weight: bold;text-decoration:none;color:white">'New Terms & Conditions'</a> <img
									id="ContentPlaceHolder1_Repeater_Notice_Image_NewNews_1"
									src="images/new_blink.gif"><br> <br>

								<hr>



								<a id="ContentPlaceHolder1_Repeater_Notice_HyperLink_DeptNews_2" href="./download?filename=sample3"
									style="font-size: 13px; font-weight: bold;text-decoration:none;color:white">'One Week
									Online Faculty Development Program'</a> <img
									id="ContentPlaceHolder1_Repeater_Notice_Image_NewNews_2"
									src="images/new_blink.gif"><br> <br>

								<hr>



								<a id="ContentPlaceHolder1_Repeater_Notice_HyperLink_DeptNews_3" href="./download?filename=sample4"
									style="font-size: 13px; font-weight: bold;text-decoration:none;color:white">'International
									Webinar on Material Science-2020'</a> <img
									id="ContentPlaceHolder1_Repeater_Notice_Image_NewNews_3"
									src="images/new_blink.gif"><br> <br>

								<hr>



								<a id="ContentPlaceHolder1_Repeater_Notice_HyperLink_DeptNews_4" href="./download?filename=sample5"
									style="font-size: 13px; font-weight: bold;text-decoration:none;color:white">'Webinar on
									Career opportunities in new technologies'</a> <img
									id="ContentPlaceHolder1_Repeater_Notice_Image_NewNews_4"
									src="images/new_blink.gif"><br> <br>
							</marquee>
						</div>
					</div>





				</div>
                    </div>
`					

					
					
					
					
                    <!--second col-->
                    <div class="col-md-8" >
                        <!--posts-->
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-2">Loading...</h3>
                        </div>

                        <div class="container-fluid" id="post-container">

                        </div>
                    </div>

                </div>

            </div>

        </main>
        <!--end main body of the page-->
 
        

	<script type="text/javascript">
		$(document).ready(function() {
			let editStatus = false;
			$('#edit-profile-button').click(function() {
				if (editStatus == false) {
					$("#profile-details").hide()
					$("#profile-edit").show();
					editStatus = true;
					$(this).text("Back")
				} else {
					$("#profile-details").show()
					$("#profile-edit").hide();
					editStatus = false;
					$(this).text("Edit")
				}
			});

		});
	</script>

	<script type="text/javascript">
		$(function() {
			console.log("Hii");
			$("#submit").click(function() {
				console.log("Hii");
				var degree = $("#cid");
				if (degree.val() == "---Select Category---") {
					swal("Please select blog category!");
					return false;
				}
				return true;
			});
		});
	</script>

	
	<script type="text/javascript">
		
		 $(document).ready(function() {
            
             $("#myform").on('submit',(function(e){
                 e.preventDefault();
                 var cid=$("#cid").val();
                 var title=$("#pTitle").val();
                 var content=$("#pContent").val();
                 $.ajax({
                     url: ".addpost",
                     type: "POST",
                     data:{cid:cid,title:title,content:content},
                     contentType: false,
                     cache: false,
                     processData:false,
                     success: function(data){
                         alert(data);
                     },
                     error: function(){
                         alert("error");
                     }
                 });
             }));
         });
	</script>
	
<!-- 	<script type="text/javascript">
		$(document).ready(function(){
			$.ajax({
				url:"load_post.jsp",
				method:'GET',
				 success: function(data){

                     $("#loader").hide();
                     $("#post-container").html(data);
                 },
                 error: function(){
                     alert("error");
                 }
			})
		});
	</script> -->
	
	<script type="text/javascript">
	 function getPosts(catId, temp) {
         $("#loader").show();
         $("#post-container").hide()
         $(".c-link").removeClass('active')
         $.ajax({
             url: "load_post.jsp",
             data: {cid: catId},
             success: function (data, textStatus, jqXHR) {
                 console.log(data);
                 $("#loader").hide();
                 $("#post-container").show();
                 $('#post-container').html(data);
                 $(temp).addClass('active');
             }
         })
     }
		
		
 	$(document).ready(function (e) {
            let allPostRef = $('.c-link')[1];
            getPosts(0, allPostRef);
    }) 
     
    function getPostByUser(userid,temp) {
		$("#loader").show();
		$("#post-container").hide();
		$(".c-link").removeClass('active');
		$.ajax({
			url : "mypost.jsp",
			data : {
				userid : userid
			},
			success : function(data, textStatus, jqXHR) {
				console.log(data);
				$("#loader").hide();
				$("#post-container").show();
				$('#post-container').html(data);
				$(temp).addClass('active');
			}
		})
}
 	

	</script>

</body>
</html>