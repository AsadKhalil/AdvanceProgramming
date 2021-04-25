<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.esr.database.AdminDao"%>
<%@page import="com.esr.helper.ConnectionProvider"%>
<%@page import="com.esr.entities.Admin"%>
<%@page errorPage="errorpage.jsp" %>

<%
    Admin admin = (Admin) session.getAttribute("currentUser11");

    if (admin == null) {
        response.sendRedirect("adminlogin.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <title>Admin Profile</title>
    </head>
    <body>
   <!-- Start of Navbar -->
        <%@include file ="navbar.jsp" %>
        <!--end of Navbar-->

        <div class="container-fluid jumbotron">
            <div class="display-2 text-center text-muted" style="font-weight:  bold"> Admin Info</div><br><br>
            <div class="display-3">
                Admin ID is : <%= admin.getId()%>
            </div> 
            <div class="display-3">
                Admin Email is : <%= admin.getEmail()%>
            </div>
            <div class="display-3">
                Admin Name is : <%= admin.getName()%>
            </div>
<!--
            <%
                AdminDao d = new AdminDao(ConnectionProvider.getConnection());
                List<Admin> admin1 = new ArrayList<>();
                admin1 = d.getAllAdmin();
                if (admin == null) {
                    out.println("<h2> unable to read</h2>");
                }
            %>
        
      </div>
      
            <%
                for (Admin a : admin1) {
            %>
         <div class="text-center"> 
                
           <h3>ID is : <%= a.getId()%></h3>
           <h3>Name is : <%= a.getName()%></h3>
           <h3>Email is : <%= a.getEmail()%></h3>
           <br>
         
         </div>
           
    
            <%
                }
            %>
    
                -->
                <div style="text-align: center; margin-top: 100px;">
                 <a href="ownerLoginPage.jsp" type="button" class="btn btn-primary ">Add Owner</a>
                <a href="AdminLogoutServlet" type="button" class="btn btn-primary ">Logout</a>
                </div><br><br>
            </div>
            
        </body>
    </html>
