<%-- 
    Document   : displaySearchFood
    Created on : May 28, 2020, 11:00:16 PM
    Author     : areeb
--%>

<%@page import="com.esr.entities.Food"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Food</title>
    </head>
    <body>
<%
    Food f = (Food) session.getAttribute("searchFood");
    if (f == null) {
        response.sendRedirect("error_page.jsp");
        return;
    }
    
%>  
   <div class="row">
            <div class="col s12 m7">
                <div class="card">
                    <div class="card-image">
                        <span class="card-title text-center"> <h1> <%= f.getFoodName() %></h1></span>
                    </div>
                    <div class="card-content">
                        <p>&nbsp;<h1>Food id:</h1> <%= f.getFoodId()%></p>
                        <p>&nbsp;<h1>Description</h1> <%= f.getDescription()%></p>
                        <p>&nbsp;<h1>FoodType </h1><%= f.getType_of_Food() %></p>
                        <p>&nbsp;<h1>Price</h1> <%= f.getPrice() %> </p>
                    </div>
                    <div class="card-action">
                        <!--          <a href="#">This is a link</a>-->
                    </div>
                </div>
            </div>
        </div>    

    </body>
</html>
