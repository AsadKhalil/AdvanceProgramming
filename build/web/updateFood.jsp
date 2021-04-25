<%-- 
    Document   : updateFood
    Created on : May 29, 2020, 4:04:19 AM
    Author     : areeb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Food</title>
        
                         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

        <script  href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

        <!-- CSS of Login Page Starts from here-->
        <style type="text/css">

            .box{
                background:white;
                width:300px;
                border-radius:20px;
                margin: 150px auto auto auto;
                padding:0px 0px 70px 0px;
                border: #2980b9 4px solid; 
            }

            .card{
                border: #2980b9 4px solid; 
                border-radius:20px;
                margin-top: 100px;
            }
            .card-body{
                padding: 0px !important;
            }
            .email{
                background:#ecf0f1;
                border: #ccc 1px solid;
                border-bottom: #ccc 2px solid;
                padding: 8px;
                width:250px;
                color:#AAAAAA;
                margin-top:10px;
                font-size:1em;
                border-radius:4px;
            }

            .password{
                border-radius:4px;
                background:#ecf0f1;
                border: #ccc 1px solid;
                padding: 8px;
                width:250px;
                font-size:1em;
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
       
        
    </head>
    <body>
        
        <form id = "UpdateFood" action="UpdateFoodServlet" method="post">  

            <div class="container-fluid">
                <div class="jumbotron">
                    <br><br><br><br>

                    <div class="card bg-light">
                        <div class="row">
                            <article class="card-body mx-auto col-md-8">
                                <h2 class="card-title mt-3 text-center">Update Food</h2>

                                <br><br>
                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fas fa-utensils"></i> </span>
                                    </div>
                                    <input name="foodId"  class="form-control" placeholder="Enter Food Id" type="text" required>
                                </div>
                                
                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fas fa-utensils"></i> </span>
                                    </div>
                                    <input name="foodName"  class="form-control" placeholder="Enter New Food Name" type="text" required>
                                </div>
                                
                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fas fa-utensils"></i> </span>
                                    </div>
                                    <input name="foodPrice"  class="form-control" placeholder="Enter New Food Price" type="text" required>
                                </div>
                                
                                <div class="form-group" >
                                    <button id="search-btn" class="btn" type="submit"> Update </button>
                                </div>
                            </article>
                        </div>
                    </div>
                </div>
            </div>
        </form>
   
    
        
        
    </body>
</html>
