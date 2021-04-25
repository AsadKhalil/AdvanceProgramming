
<%@page import="com.esr.entities.Owner"%>
<%@page errorPage="error_page.jsp" %>

<%
    Owner user = (Owner) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("ownerLoginPage.jsp");
    }

%>  


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Owner Page</title>
        <!--css-->
        
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }
        </style>    
    </head>
    <body>
   <!-- Start of Navbar -->
        <%@include file ="navbar.jsp" %>
        <!--end of Navbar-->

       <nav>
            <div>
                
                <ul class="navbar-nav mr-right">
<!--                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"> <span class="fa fa-user-circle "></span> <%= user.getName()%> </a>
                    </li>-->
                    <br><br>
            
                    <li class="nav-item" >
                        <b>
                        <a class="nav-link" href="OwnerLogoutServlet"> <span class="fa fa-user-plus "></span>Logout</a>
                        </b>
                        </li>
                </ul>
            </div>
        </nav>
        
<!--        nvBar End-->
        
        <form id = "owner-form" name="myForm" method="post"> 

            <h1 style="font-size:60px;">    
                <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <%= user.getName()%>
                <br>
            </h1>
            <hr>
            
            <div class="form-group">
                 <a class="btn btn-primary" href="addRestaurant_page.jsp" role="button">Add Restaurant</a>    
            </div>
            <div class="form-group">
                 <a class="btn btn-primary" href="viewOwnerRestaurant.jsp?ownerID=<%= user.getId()%>" role="button">View Restaurant</a>    
            </div>
            <div class="form-group">
                 <a class="btn btn-primary" href="removeRestaurant.jsp" role="button">Remove Restaurant</a>
            </div>

            <div class="form-group">
                 <a class="btn btn-primary" href="StaffSignup.jsp?ownerID=<%= user.getId()%>" role="button">Add Staff</a>
            </div>
            <div class="form-group">
                 <a class="btn btn-primary" href="removeStaff.jsp" role="button">Remove Staff</a>
            </div>
        </form>
                
    </body>
</html>
