<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%
User user=(User)session.getAttribute("currentUser");
if(user==null){
	response.sendRedirect("login_page.jsp");
}
%>

<%

  int postId=Integer.parseInt(request.getParameter("post_id"));
  PostDao d=new PostDao(ConnectionProvider.getConnection());
  Post p=d.getPostByPostId(postId);

%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%= p.getpTitle() %></title>
  <!-- CSS -->
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">   
     <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     <style>
         .banner-background{
               clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 92%, 62% 100%, 26% 94%, 0 100%, 0 0);
         }     
     </style>
   <!-- END OF CSS -->
   <!-- bootstrap -->
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>	
	<script src="js/myjs.js" type="text/javascript"></script>
	
	<script>
	   $(document).ready(function(){
		   let editStatus=false;
		   $('#edit-profile-button').click(function(){
			  // alert("button clicked")
			 if(editStatus==false){
				 $("#profile-details").hide();
				  
				 $("#profile-edit").show();
				 editStatus=true;
				 $(this).text("Back")
				 
			 }else{
				 $("#profile-details").show();
				  
				 $("#profile-edit").hide();
				 editStatus=false;
				 $(this).text("Edit")
			 }
			  
		   })
	   })
	</script>
   
   
</head>
<body>

      <!-- navbar -->
   
         <nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <a class="navbar-brand" href="index.jsp"><span class="fa fa-certificate"></span>TechBlog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="profile.jsp"><span class="fa fa-bell-o"></span>Code With Saleem <span class="sr-only">(current)</span></a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span class="fa fa-check-square-o"></span>Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming Language</a>
          <a class="dropdown-item" href="#">Project Implementation</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structure</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#"><span class="fa fa-address-card-o"></span>Contact Us</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-Modal"><span class="fa fa-asterisk"></span>Do Post</a>
      </li>
      
      </ul>
        <ul class="navbar-nav mr-right">
           <li class="nav-item">
              <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"><span class="fa fa-user-circle"></span><%= user.getName() %></a>
           </li>
           <li class="nav-item">
              <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span>Logout</a>
           </li>
        </ul>
  </div>
</nav>
   
   <!-- end navbar -->
   
   <!-- main content of body -->
      <div class="container">
         <div class="row my-4">
            <div class="col-md-8 offset-md-2">
               <div class="card">
                  <div class="card-header">
                     <h4 class="post-title"><%= p.getpTitle() %></h4>
                  </div>
                     <div class="card-body">
                     
                        <p class="post-content"><%= p.getpContent() %></p>
                        <br>
                        <br>
                      <div class="post-code">
                        <pre><%= p.getpCode() %></pre>
                      </div>
                        
                     </div>
                     <div class="card-footer primary-background">
                         <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-up"><span>10</span></i></a>
              
                         <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"><span>20</span></i></a>
                     </div>
               </div>
            </div>
         </div>
      </div>

    <h1>Post id:<%= postId %></h1>
    
     <!-- profile modal -->
      


<!-- Modal -->
<!-- Button trigger modal -->


<div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white">
        <h5 class="modal-title" id="exampleModalLabel"> TechBlog </h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <div class="container text-center">
               <img src="pics/picprofile.jpg <%= user.getProfile() %>">
               <h5 class="modal-title" id="exampleModalLabel"> <%= user.getName() %> </h5>
                 <!-- //Details..... -->
 
               <div id="profile-details">
               
 <table class="table">
  <tbody>
    <tr>
      <th scope="row">ID</th>
      <td><%=user.getId()%></td>
    </tr>
    <tr>
      <th scope="row">Email</th>
      <td><%=user.getEmail() %></td>
    </tr>
    <tr>
      <th scope="row">Gender</th>
      <td><%=user.getGender() %></td>
    </tr>
    <tr>
      <th scope="row">Registered On</th>
      <td><%=user.getDateTime().toString() %></td>
    </tr>
  </tbody>
</table>
               
               </div>
               
               <!-- profile-edit -->
                 
               <div id="profile-edit" style="display: none;">
                   <h2 class="mt-2">Please Edit Carefully</h2>
                   
                   <form action="EditServlet" method="post" enctype="multipart/form-data">
                      <table class="table">
                         <tr>
                            <td>ID :</td>
                            <td><%= user.getId() %></td>
                         </tr>
                          <tr>
                            <td>Email :</td>
                            <td><input type="email" class="form-control" name="user_email" value="<%= user.getEmail() %>"></td>
                         </tr>
                         <tr>
                            <td>Name :</td>
                            <td><input type="name" class="form-control" name="user_name" value="<%= user.getName() %>"></td>
                         </tr>
                          <tr>
                            <td>Gender :</td>
                            <td><%= user.getGender().toUpperCase() %></td>
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
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>   
  
  <!-- add post modal -->
  
 
<!-- Modal -->
<div class="modal fade" id="add-post-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="Provide the post details...">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
        <form id="add-post-form" action="AddPostServlet" method="post">
             <div class="form-group">
                <select class="form-control" name="cid">
                   <option selected disabled>---Select Category---</option>
                   <%
                     PostDao postd=new PostDao(ConnectionProvider.getConnection());
                     ArrayList<Category> list=postd.getAllCategories();
                     for(Category c:list)
                     {	 
                   %>
                   <option value="<%=c.getCid()%>"><%=c.getName()%></option>
                   <%
                     }                   
                   %>
                </select>
             </div>
             <div class="form-group">
                 <input name="pTitle" type="text" placeholder="Enter post Title" class="form-control"/>
             </div>
             <div class="form-group">
                 <textarea name="pContent" class="form-control" style="height: 100px;" placeholder="Enter your content"></textarea>
             </div>
             <div class="form-group">
                 <textarea name="pCode" class="form-control" style="height: 100px;" placeholder="Enter your program(if any)"></textarea>
             </div>
             <div class="container text-center">
                  <button type="submit" class="btn btn-outline-primary">Post</button>
             </div>
        </form>
        
      </div>
      
    </div>
  </div>
</div>
  
  <!-- END add post modal -->
  
  <script>
       $(document).ready(function (e){
    	   //
    	   $("#add-post-form").on("submit", function (event){
    		   //this code gets called when form is submitted...
    		   event.preventDefault();
    		   console.log("You have clicked on submit...")
    		   let form=new FormData(this);
    		   //now requesting to server
    		   $.ajax({
    			   url: "AddPostServlet",
    			   type: 'POST';
    		       data: form,
    		       success: function (data, textStatus, jqXHR){
    		    	   //success...
    		    	   console.log(data);
    		    	   if(data.trim() == 'done'){
    		    		   
    		    		   swal("Good job!","saved successfully","success");
    		    	   }else{
    		    		   swal("Error!!","Something went wrong try again!!","error");
    		    	   }
    		       },
    		       error: function (jqXHR, textStatus, errorThrown){
    		    	   //error...
		    		   swal("Error!!","Something went wrong try again!!","error");
    		       },
    		       processData: false,
    		       contentType: false
    		   })
    	   })
       })
  </script>
    
</body>
</html>