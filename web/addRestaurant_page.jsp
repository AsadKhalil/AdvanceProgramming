<%-- 
    Document   : addRestaurant
    Created on : May 11, 2020, 11:46:06 AM
    Author     : areeb
--%>

<%@page import="com.esr.entities.Message"%>
<%@page import="com.esr.database.RestaurantDao"%>
<%@page import="com.esr.helper.ConnectionProvider"%>
<%@page import="com.esr.entities.Restaurant"%>
<%@page import="com.esr.entities.Owner"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Restaurant</title>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

        <script  href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
    </head>
    <style type="text/css">

        .card{
            border: #2980b9 4px solid; 
            border-radius:20px;
        }
        .card-body{
            padding: 0px !important;
        }
        .btn{
            background:#343A40;
            width:125px;
            padding-top:5px;
            padding-bottom:5px;
            color:white;
            border-radius:4px;
            border: #343A40 1px solid;

            margin-top:20px;
            margin-bottom:20px;
            float:left;
            margin-left:16px;
            font-weight:800;
            font-size:0.8em;
        }

        .btn:hover{
            background:white; 
        }
    </style>
    
    <body>    
           <!-- Start of Navbar -->
        <%@include file ="navbar.jsp" %>
        <!--end of Navbar-->
        
    <%
        Owner ownerId = (Owner) session.getAttribute("currentUser");  
    %>
        <form id = "rest_form" action="RestaurantServlet" method="POST">  
          
            <div class="container-fluid">
                <div class="jumbotron">
                    <br><br><br><br>

                    <div class="card bg-light">
                        <div class="row">
                            <article class="card-body mx-auto col-md-8">
                                <h2 class="card-title mt-3 text-center">Restaurant Info</h2>

                                <br><br>

                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fas fa-utensils"></i> </span>
                                    </div>
                                    <input name="res_name"  class="form-control" placeholder="Restaurant Name" type="text" required>
                                </div>

                                <br><br>
                                <!--<form name="myForm2" action="reg" onchange="return checkEmail()" onsubmit="return checkEmail()" method="post">-->
                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fas fa-utensils"></i> </span>
                                    </div>
                                    <input name="res_description" class="form-control" placeholder="Description" type="text" required>
                                </div>
                                <br><br>

                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fas fa-map-marker-alt"></i> </span>
                                    </div>
                                    <input name="res_address" class="form-control" placeholder="Address" type="text" required>
                                </div> 
                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fas fa-map-marker-alt"></i> </span>
                                    </div>
                                    <input name="res_contact" class="form-control" placeholder="Contact" type="text" required>
                                </div>
                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fas fa-tag"></i> </span>
                                    </div>
                                    <input name="res_discount" class="form-control" placeholder="Discount" type="text" required>
                                </div>
                              
                                <div class="container text-center" id="loaderr" style="display: none;">
                                    <span class="fa fa-refresh fa-spin fa-4x"></span>
                                    <h4>Please wait..</h4>
                                </div>
                                <tr>
                                    <td>Restaurant Pic:</td>
                                        <td>
                                                <input type="file" name="res_image" class="form-control" >
                                        </td>
                                 </tr>
                                <div class="form-group" id = "load">
                                    <button id="addd-btn" class="btn" type="submit"> ADD </button>
                                </div>

                            </article>

                        </div>
                    </div>     

                </div>
            </div>

            <br><br>
            <br><br>
            </form>
     <!--bootstrap JS-->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script
  src="https://code.jquery.com/jquery-3.5.1.min.js"
  integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
  crossorigin="anonymous"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script><script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
         <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
       
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
      
          
    </body>
</html>
