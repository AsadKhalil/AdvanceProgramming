
<%@page import="com.esr.entities.Staff"%>
<%@page errorPage="error_page.jsp" %>

<%
    Staff s = (Staff) session.getAttribute("StaffUser");
    if (s == null) {
        response.sendRedirect("StaffLogin.jsp");
    }

%>  


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Main Menu</title>
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
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal"> <span class="fa fa-user-circle "></span> <%= s.getName()%> </a>
                    </li>-->
<br><br>
                    <li class="nav-item">
                        <a class="nav-link" href="StaffLogoutServlet"> <span class="fa fa-user-plus "></span> Logout</a>
                    </li>
                </ul>
            </div>
        </nav>
        
<!--        nvBar End-->
        
        <form id = "staff-form" name="myForm3" method="post"> 

            <h1 style="font-size:60px;">    
                <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <%= s.getName()%>
                <br>
            </h1>
            <hr>
            
            <div class="form-group">
                 <a class="btn btn-primary" href="addFood.jsp" role="button">Add Food</a>    
            </div>
            <div class="form-group">
                 <a class="btn btn-primary" href="updateFood.jsp?ownerID=<%= s.getId()%>" role="button">Update Food</a>    
            </div>
            <div class="form-group">
                 <a class="btn btn-primary" href="SearchFood.jsp" role="button">Search Food</a>
            </div>

            <div class="form-group">
                 <a class="btn btn-primary" href="removeFood.jsp" role="button">Remove Food</a>
            </div>
        </form>
                
    </body>
</html>
