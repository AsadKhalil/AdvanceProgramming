<%-- 
    Document   : register_page
    Created on : May 10, 2020, 6:12:43 PM
    Author     : areeb
--%>

<%@page import="com.esr.entities.Owner"%>
<%@page import="com.esr.entities.Message"%>
<%@page import="com.esr.database.RestaurantDao"%>
<%@page import="com.esr.helper.ConnectionProvider"%>
<%@page import="com.esr.entities.Restaurant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Staff | SignUp</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

       <!--bootstrap css-->
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
         <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
         <link href="css/home.css" rel="stylesheet" type="text/css"/>
         <link href="css/footer.css" rel="stylesheet" type="text/css"/>
        <!------ Include the above in your HEAD tag ---------->
        
    </head>
    <body>
           <!-- Start of Navbar -->
        <%@include file ="navbar.jsp" %>
        <!--end of Navbar-->
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
    <%
        Owner o = (Owner) session.getAttribute("currentUser");  
    %>
        
        <form id = "staffSignup" name="staffForm" action="StaffRegisterServlet" method="POST">  
            <div class="container-fluid">
                <div class="jumbotron">
                    <br><br><br><br>

                    <div class="card bg-light">
                        <div class="row">
                            <article class="card-body mx-auto col-md-8">
                                <h2 class="card-title mt-3 text-center">Staff Registration</h2>

                                <br><br>

                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                                    </div>
                                    <input name="staff_name"  class="form-control" placeholder="Username" type="text" required>
                                </div>

                                <br><br>

                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                                    </div>
                                    <input name="staff_email" class="form-control" placeholder="Email address" type="email" required>
                                </div>
                                <br><br>

                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                                    </div>
                                    <input name="staff_password" class="form-control" placeholder="Create password" type="password" required>
                                </div> 
                                
                                <div class="container text-center" id="staffLoader" style="display: none;">
                                    <span class="fa fa-refresh fa-spin fa-4x"></span>
                                    <h4>Please wait..</h4>
                                </div>
                                <div class="form-group">
                                    <button id="staffSubmit-btn" class="btn" type="submit"> Signup </button>
                                </div>
                                
                            </article>

                        </div>
                        <p class="text-center" style="color: #343A40;">Have an account? <a href="StaffLogin.jsp">Log In</a> </p>                                                                

                    </div>     
                </div>
            </div>


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
        
        <script>
            
            $(document).ready(function () {
                console.log("loaded........")

                $('#staffSignup').on('submit', function (event) {
                    event.preventDefault();

                    let form = new FormData(this);

                    $("#staffSubmit-btn").hide();
                    $("#staffLoader").show();
                    //send register servlet:
                    $.ajax({
                        url: "StaffRegisterServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data)

                            $("#staffSubmit-btn").show();
                            $("#staffLoader").hide();

                            if (data.trim() === 'done')
                            {
                                swal("Registered successfully..We are going to redirect to login page")
                                        .then((value) => {
                                            window.location = "StaffLogin.jsp"
                                        });
                            } else
                            {
                                swal(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#staffSubmit-btn").show();
                            $("#staffLoader").hide();
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