<%-- 
    Document   : register_page
    Created on : May 10, 2020, 6:12:43 PM
    Author     : areeb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>SignUp Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

        <script  href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

    </head>
    <body>
           <!-- Start of Navbar -->
        <%@include file ="navbar.jsp" %>
        <!--end of Navbar-->
        <title>Owner Sign up</title>
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
<form id = "reg-form" name="myForm" action="OwnerRegisterServlet" onchange="return checkName()" onsubmit="return checkName()" method="post">  
        <div class="container-fluid">
            <div class="jumbotron">
                <br><br><br><br>

                <div class="card bg-light">
                    <div class="row">
                        <article class="card-body mx-auto col-md-8">
                            <h2 class="card-title mt-3 text-center">Owner signup Account</h2>

                            <br><br>
                            
                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                                    </div>
                                    <input name="username"  class="form-control" placeholder="Username" type="text" >
                                </div>

                                <br><br>
                                <!--<form name="myForm2" action="reg" onchange="return checkEmail()" onsubmit="return checkEmail()" method="post">-->
                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                                    </div>
                                    <input name="email" class="form-control" placeholder="Email address" type="email">
                                </div>
                                <br><br>

                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                                    </div>
                                    <input name="pass" class="form-control" placeholder="Create password" type="password" required>
                                </div> 
                            
                                 <div class="container text-center" id="loader" style="display: none;">
                                    <span class="fa fa-refresh fa-spin fa-4x"></span>
                                    <h4>Please wait..</h4>
                                </div>
                            <div class="form-group">
                               <button id="sumbimt-btn"class="btn" type="submit"> Signup</button>
                            </div>
                        </article>
                                 
                     </div>
               <p class="text-center" style="color: #343A40;">Have an account? <a href="ownerLoginPage.jsp">Log In</a> </p>                                                                
    
                </div>     
            </div>
        </div>


        <br><br>
       
    </form>  
        
        
        
         <!--javascripts-->
        <script
            src="https://code.jquery.com/jquery-3.4.1.min.js"
            integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script>
            $(document).ready(function () {
                console.log("loaded........")
                $('#reg-form').on('submit', function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    $("#sumbimt-btn").hide();
                    $("#loader").show();
                    //send register servlet:
                    $.ajax({
                        url: "OwnerRegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)
                            $("#sumbimt-btn").show();
                            $("#loader").hide();
                            if (data.trim() === 'done')
                            {
                                swal("Registered successfully..We are going to redirect to login page")
                                        .then((value) => {
                                            window.location = "ownerLoginPage.jsp"
                                        });
                            } else
                            {
                                swal(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#sumbimt-btn").show();
                            $("#loader").hide();
                            swal("something went wrong..try again");
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });
        </script>
        

</body>
</html>