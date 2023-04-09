<%@page import="com.tech.blog.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">  
<link href="css/mystyle.css" rel="stylesheet" type="text/css"/>

</head>

<body>
  
  <!--NAVBAR-->
    <%@include file="normal_navbar.jsp"%>

	<main class="d-flex align-items-center primary-background" style="height: 70vh">
		<div class="container" style="text-align: center height:50vh">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header primary-background text-white" style="text-align: center">
						    
							<p>Login</p>
						</div>
						
						<%

						Message m=(Message)session.getAttribute("msg");
						if(m!=null){
							%>
							
						<div class="alert <%= m.getCssClass() %>" role="alert">
                                 <%= m.getContent() %>
                        </div>
							
							<%
						
						session.removeAttribute("msg");	
						}
						
						%>
						
						<div class="card-body">

							<form action="LoginServlet" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input name="email" required
										type="email" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter email">
									<small id="emailHelp" class="form-text text-muted">We'll
										never share your email with anyone else.</small>
								</div>
							<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input name="password" required
									type="password" class="form-control"
										id="exampleInputPassword1" placeholder="Password">
								</div>
									
								<div class="container text-center">
	                                <button type="submit" class="btn btn-primary">Submit</button>							
								</div>	
									
							</form>

						</div>

					</div>
				</div>
			</div>
		</div>
	</main>

<!-- JAVASCRIPTS -->
	
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="js/myjs.js" type="text/javascript"></script>

</body>

</html>