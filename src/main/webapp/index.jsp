<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<html>
<head>
     <title>JSP Page</title>
     
     <!-- CSS -->
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">   
     <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
     <style>
         .banner-background{
               clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 92%, 62% 100%, 26% 94%, 0 100%, 0 0);
         }     
     </style>
  
</head>

<body>
     
  <!-- NAVBAR -->
     <%@include file="normal_navbar.jsp" %>
  
  <!-- //banner -->
     <div class="container-fluid p-0 m-0">
         <div class="jumbotron primary-background text-white">
            <div class="container">
                 <h3>Welcome To TechBlog</h3>
                 <p> A technical blogger is a content writer that focuses on delivering high-quality articles that engages their audience and brings traffic to their business' website.</p>
                 <p> Technical bloggers write content to engage their audiences. Hence, their content does not have to be as objective and rigid, but the topic needs to be current, relevant and SEO optimized.</p>
                 <button class="btn btn-outline-light"><span class="fa fa-user-plus"></span>Start ! its Free</button>
                 <a href="login_page.jsp" class="btn btn-outline-light"><span class="fa fa-user-circle-o fa-spin"></span>Login</a>
            </div>
         </div>
     </div>
     
   <!-- CARDS -->  
     <div class="container">
     
        <div class="row mb-4">
           <div class="col-md-4">
               <div class="card">
                  <div class="card-body">
                     <h5 class="card-title">Card title</h5>
                     <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                     <a href="#" class="btn btn-primary">Go somewhere</a>
                  </div>
               </div>
           </div>
           
           <div class="col-md-4">
               <div class="card">
                  <div class="card-body">
                     <h5 class="card-title">Card title</h5>
                     <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                     <a href="#" class="btn btn-primary">Go somewhere</a>
                  </div>
               </div>
           </div>
           
           <div class="col-md-4">
               <div class="card">
                  <div class="card-body">
                     <h5 class="card-title">Card title</h5>
                     <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                     <a href="#" class="btn btn-primary">Go somewhere</a>
                  </div>
               </div>
           </div>
           
        </div>
        
        <div class="row">
           <div class="col-md-4">
               <div class="card">
                  <div class="card-body">
                     <h5 class="card-title">Card title</h5>
                     <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                     <a href="#" class="btn btn-primary">Go somewhere</a>
                  </div>
               </div>
           </div>
           
           <div class="col-md-4">
               <div class="card">
                  <div class="card-body">
                     <h5 class="card-title">Card title</h5>
                     <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                     <a href="#" class="btn btn-primary">Go somewhere</a>
                  </div>
               </div>
           </div>
           
           <div class="col-md-4">
               <div class="card">
                  <div class="card-body">
                     <h5 class="card-title">Card title</h5>
                     <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                     <a href="#" class="btn btn-primary">Go somewhere</a>
                  </div>
               </div>
           </div>
           
        </div>     
             
     </div>
     
 
     
</body>
 
</html>
