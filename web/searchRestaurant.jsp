<%-- 
    Document   : searchRestaurant
    Created on : May 15, 2020, 1:16:39 AM
    Author     : hp
--%>

<%@page import="com.esr.entities.Restaurant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.esr.helper.ConnectionProvider"%>
<%@page import="com.esr.entities.Restaurant"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Restaurant</title>
    </head>
    <body>
<%
    Restaurant r = (Restaurant) session.getAttribute("searchRes");
    if (r == null) {
        response.sendRedirect("error_page.jsp");
    }
%>  
     <img class="card-img-top" src="img/<%= r.getImage()%>" alt="Card image cap">
        <h1 class="display-2 text-center"><%= r.getName()%></h1><br><br>
        <h2 class="display-3">Description:: <%= r.getDescription()%></h2>
        <h1 class="display-3">Address <%= r.getAddress()%></h3>
        <h1 class="display-3">Contact <%= r.getContact()%></h1>
        <h1 class="display-3">Discount <%= r.getDiscount()%></h1>

    </body>
    
    
    
    
</html>
