<%-- 
    Document   : login_page
    Created on : May 10, 2020, 8:18:17 PM
    Author     : areeb
--%>


<%@page import="com.esr.entities.Message"%>

<html>
    <head>
        <title>Staff | Login</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

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
        <!-- Start of Navbar -->
          <%@include file ="navbar.jsp" %>
          <!--end of Navbar-->
        <form name="myForm2" action="StaffLoginServlet" onchange="return checkEmail()" onsubmit="return checkEmail()" method="post">   
            <div class="container-fluid">
                <div class="jumbotron">

                    <div class="card bg-light">
                        <div class="row">
                            <article class="card-body mx-auto col-md-10">
                                <h2 class="card-title mt-3 text-center">Staff Login</h2>
                                <br><br>
                                <%
                                    Message m = (Message)session.getAttribute("msg");
                                    if(m!=null){
                                %>
                                  
                                <div class="alert" role="alert">
                                    <%= m.getContent() %>
                                </div> 
                                <%        
                                    session.removeAttribute("msg");
                                    }
                                %>
                                            
                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                                    </div>
                                    <input name="staff_email" required class="form-control" placeholder="Email address" type="email" required>
                                </div> 

                                <br><br>

                                <div class="form-group input-group">
                                    <div class="input-group-prepend">
                                        <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                                    </div>
                                    <input name="staff_password" required class="form-control" placeholder="Password" type="password" required>

                                </div>
                                <br><br>
                                    
                                <button type="submit" class="btn">Login</button>


                            </article>
                        </div> 
                        <p class="text-center" style="color: #343A40;"> Don't have an account? <a href="StaffSignup.jsp">Sign Up</a> </p>                                                                   
                    </div>


                </div>
            </div>      
        </form>         
        
    </body>
</html>