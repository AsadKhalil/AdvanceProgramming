<%-- 
    Document   : RestaurantView
    Created on : May 12, 2020, 6:13:17 PM
    Author     : areeb
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.esr.database.RestaurantDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.esr.helper.ConnectionProvider"%>
<%@page import="com.esr.entities.Restaurant"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link href="css/footer.css" rel="stylesheet" type="text/css"/>
        <script  href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

        <title>Restaurant View</title>
        
        content="width=device-width, initial-scale=1, ">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<link href="https://fonts.googleapis.com/css?family=Josefin+Sans" rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">
	<link rel="stylesheet"  href="restaurant.css">
	 <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/css/Footer-with-social-icons.css">
        
    </head>
    <script>
    @media(min-width:992px){
  .container-fluid{
    width:960px;
    max-width:100%;
  }
}
@media(min-width:576px){
  .container-fluid{
    width:540px;
    max-width:100%;
  }
}
@media only screen  and (min-width : 1200px) {
  .container-fluid{
    width:1000px;
    max-width:100%;
  }
}
@media only screen  and (min-width : 1800px) {
  .container-fluid{
    width:1000px;
    max-width:100%;
  }
}

/* The side navigation menu */
.sidenav {
    height: 100%; /* 100% Full-height */
    width: 0; /* 0 width - change this with JavaScript */
    position: fixed; /* Stay in place */
    z-index: 1; /* Stay on top */
    top: 0;
    left: 0;
    background-color: #111; /* Black*/
    overflow-x: hidden; /* Disable horizontal scroll */
    padding-top: 60px; /* Place content 60px from the top */
    transition: 0.5s; /* 0.5 second transition effect to slide in the sidenav */
}

/* The navigation menu links */
.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s
}

/* When you mouse over the navigation links, change their color */
.sidenav a:hover, .offcanvas a:focus{
    color: #f1f1f1;
}

/* Position and style the close button (top right corner) */
.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 25px;
    font-size: 36px;
    margin-left: 50px;
}

.one{
	height: 600px;
	background-image: url('https://images.unsplash.com/photo-1421622548261-c45bfe178854?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=41de310e5e57851294919719f02acd08&auto=format&fit=crop&w=749&q=80');
	background-repeat: no-repeat;
	width:100%;
	background-size: 100% 100%;
}
.jumbotron{
	height: 800px;
}
.display-3{
	margin-top: 20px;
	
}

.side{

	float: right;
}
.info{
	color: grey;
}
table{
   margin: auto;
   width: 80% !important;
}
.carousel{
	margin-top: 25px;
}
.carousel-inner{
	height: 900px;
}
.two{
	background-image: url('https://images.unsplash.com/photo-1552879574-e1a9ae64c38a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1400&q=80');
	background-repeat: no-repeat;
	width:100%;
	background-size: 100% 100%;
	color: white;
  font-size: 20px;


}
.last{
	margin-top: 30px;
	font-size: 50px;
}
.three{
	border-radius: 20px;
}
.eye1{
	font-family: 'Josefin Sans', sans-serif;
	font-size: 40px;
}
.table th, .table td { 
     border-top: none !important; 
 }
 #title1{
 	margin-top: 30px;
 	color: grey;
 	font-size: 20px;
 }
#title2{
 	margin-top: 30px;
 	
 	font-size: 20px;
 }
#closing{
	margin-top: 30px;
}
#para{
margin-top: 40px;
font-size: 16px;
color: grey;
}
#myFooter {
	background-color: #373a48;
	color:white;
}

#myFooter .footer-copyright{
	background-color: #383737;
	padding-top:3px;
	padding-bottom:3px;
	text-align: center;
}

#myFooter .footer-copyright p{
	margin:10px;
	color: #ccc;
}

#myFooter ul{
	list-style-type: none;
    padding-left: 0;
    line-height: 1.7;

}

#myFooter h5{
	font-size: 18px;
    color: white;
    font-weight: bold;
    margin-top: 30px;
}

#myFooter a{
	color:#d2d1d1;
	text-decoration: none;
}

#myFooter a:hover, #myFooter a:focus{
	text-decoration: none;
	color:white;
}

#myFooter .myCols{
	text-align: center;
}

#myFooter .social-networks{
	text-align: center;
	padding-top: 30px;
	padding-bottom: 38px;
}

#myFooter .social-networks a{
    font-size: 32px;
    margin-right: 5px;
    margin-left: 5px;
    color: #f9f9f9;
    padding: 10px;
    transition: 0.2s;
}

#myFooter .social-networks a:hover{
	text-decoration: none;

}

#myFooter .facebook:hover{
	color:#0077e2;
}

#myFooter .google:hover{
	color:#ef1a1a;
}

#myFooter .twitter:hover{
	color: #00aced;
}

@media screen and (max-width: 767px){
	#myFooter {
		text-align: center;
	}
}

    
    </script>    
    
    
    <body>

        <!-- Start of Navbar -->
        <%@include file ="navbar.jsp" %>
        <!--end of Navbar-->

        <br><br><br>
        <%

            int restaurantID = Integer.parseInt(request.getParameter("res_id"));
            RestaurantDao d = new RestaurantDao(ConnectionProvider.getConnection());
            Restaurant res = new Restaurant();

            res = d.getRestaurantByRestaurantId(restaurantID);
            if (res == null) {
                out.println("<h2> unable to read</h2>");

            }
            Cookie c = new Cookie("getmyid", request.getParameter("res_id"));
            response.addCookie(c);

        %>
<!--        <img class="card-img-top" src="img/<%= res.getImage()%>" alt="Card image cap">
        <label class="display-2 text-center"><%= res.getName()%></label><br><br>
        <h2 class="display-3">Description:: <%= res.getDescription()%></h2>
        <h1 class="display-3">Address <%= res.getAddress()%></h3>
        <h1 class="display-3">Contact <%= res.getContact()%></h1>
        <h1 class="display-3">Discount <%= res.getDiscount()%></h1>-->

    <div class="text-center"><img src="img/<%= res.getImage()%>"></div>                
    <div class="row">
<div class="col-lg-8">
    <p1 class="text-center"><div class="eye1"><h1><%= res.getName()%></h1></div></p1>
    <p2 id="para"><h1> Description:  </h1><%= res.getDescription()%><br>

<br><h1> Discount:  </h1><%= res.getDiscount()%></p2>
</div>

<div class="side info">
<div class="col-lg-4">
    <br><br><br>
<p3>
   <strong> PHONE</strong><br>
	<%= res.getContact()%><br><br>
        
    <strong>LOCATION</strong>
	<%= res.getAddress()%>
	<br>
</p3>
 
  
</div>
 </div>
</div>
                
                    
                    
                    
                    
        <div class="form-group text-center">
            <a class="btn btn-primary" href="displayFood.jsp?resId=<%= res.getId()%>" role="button">View Food</a>
            <br><br>
            <a class="btn btn-primary" href="CustomerLogin.jsp?resId=<%= res.getId()%>" role="button">Give Feedback</a>
            <br><br>
            <a class="btn btn-primary" href="viewComments.jsp?resId=<%= res.getId()%>" role="button">View Feedback</a>
        </div>

        <!--bootstrap JS-->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script><script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


        <!-- Start of Navbar -->
        <%@include file ="footer.jsp" %>
        <!--end of Navbar-->

    </body>
</html>
