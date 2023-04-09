<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SignUp Page</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">  
<link href="css/mystyle.css" rel="stylesheet" type="text/css"/>


</head>
<body>

  <!--NAVBAR-->
    <%@include file="normal_navbar.jsp"%>

    <main class="primary-background p-20" style="height: 85vh">
		<div class="container" style="text-align: center height:50vh">
			<div class="row">
				<div class="col-md-6 offset-md-3">
					<div class="card">
						<div class="card-header primary-background text-white" style="text-align: center">
						    
							<p>SignUp</p>
						</div>
						<div class="card-body">

							<form id="reg-form" action="RegisterServlet1" method="POST">
							
	                            <div class="form-group">
									<label for="user_name">User Name</label> <input name="user_name"
										type="text" class="form-control" id="user_name"
										aria-describedby="emailHelp" placeholder="Enter name">
								</div>						
							
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input name="user_email"
										type="email" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter email">
									<small id="emailHelp" class="form-text text-muted"></small>
								</div>
								
								
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input name="user_password"
										type="password" class="form-control"
										id="exampleInputPassword1" placeholder="Password">
								</div>
								
								<div class="form-group">
									<label for="gender">Select Gender</label><br>
								    <input type="radio" id="gender" name="gender" value="male">Male
								    <input type="radio" id="gender" name="gender" value="female">Female
								    
								</div>
								
								
								<div class="form-check">
									<input name="check" type="checkbox" class="form-check-input"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1">Agree Terms and Conditions</label>
								</div>
                                <br>
                                
                                <span class="fa fa-refresh fa-spin"></span>
								<button type="submit" class="btn btn-primary">Submit</button>
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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
	<script>
	      $(document).ready(function(){
	    	  console.log("loaded........")
	    	  
	    	  $('#reg-form').on('submit', function(event){
	    		  event.preventDefault();
	    		  
	    		  let form=new FormData(this);
	    		  
	    		  //send register servlet:
	    		  $.ajax({
	    			  url: "RegisterServlet",
	    			  type: 'POST',
	    			  data: form,
	    			  success: function(data, textStatus, jqXHR){
	    				  console.log(data)
	    		      
	    				  swal("Registered Successfully...We are redirecting login page..")
	    				  .then((value) => {
	    				    window.location = "login_page.jsp"
	    				  });
	    		    	  
	    			  },
	    			  error: function(jqXHR, textStatus, errorThrown){
	    				  swal("Something went wrong try again...");
	    				  
	    			  },
	    			  processData: false,
	    			  contentType: false
	    		  });
	    	  });
	      });
	</script>
    
    
</body>
</html>