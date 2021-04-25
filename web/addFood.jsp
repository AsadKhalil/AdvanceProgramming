<%-- 
    Document   : addFood
    Created on : May 28, 2020, 1:44:22 AM
    Author     : areeb
--%>

<%@page import="com.esr.entities.Restaurant"%>
<%@page import="com.esr.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Food</title>
        
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
     <form id = "addFood" action="AddFoodServlet" method="post">  
          
            <div class="container-fluid">
                <div class="jumbotron">
                    <br><br><br><br>

                    <div class="card bg-light">
                        <div class="row">
                            <article class="card-body mx-auto col-md-8">
                                <h2 class="card-title mt-3 text-center">Add Food</h2>

                                <br><br>

                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fas fa-utensils"></i> </span>
                                    </div>
                                    <input name="food_name"  class="form-control" placeholder="Food Name" type="text" required>
                                </div>

                                <br><br>
                                <!--<form name="myForm2" action="reg" onchange="return checkEmail()" onsubmit="return checkEmail()" method="post">-->
                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fas fa-utensils"></i> </span>
                                    </div>
                                    <label for="Food Type">&nbsp;&nbsp; Food Type  </label>&nbsp;&nbsp;     
                                    <select name="food_type">
                                            <option>Fast Food</option>
                                            <option>Desi Food</option>
                                            <option>Beverage</option>
                                    </select>
                                    
                                </div>
                                <br><br>

                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fas fa-utensils"></i> </span>
                                    </div>
                                    <input name="food_description" class="form-control" placeholder="Description" type="text">
                                </div> 
                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fas fa-utensils"></i> </span>
                                    </div>
                                    <input name="food_price" class="form-control" placeholder="Price" type="text" required>
                                </div>
                                
                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fas fa-utensils"></i> </span>
                                    </div>
                                    <input name="restaurant_id" class="form-control" placeholder="Restaurant Id" type="text" required>
                                </div>
                                
                                <div class="container text-center" id="loaderr" style="display: none;">
                                    <span class="fa fa-refresh fa-spin fa-4x"></span>
                                    <h4>Please wait..</h4>
                                </div>
    
                                <div class="form-group" >
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
    </body>
</html>


