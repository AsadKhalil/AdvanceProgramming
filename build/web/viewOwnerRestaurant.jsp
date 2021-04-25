<%-- 
    Document   : viewOwnerRestaurant
    Created on : May 26, 2020, 3:42:44 PM
    Author     : areeb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.esr.database.RestaurantDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.esr.helper.ConnectionProvider"%>
<%@page import="com.esr.entities.Restaurant"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Owner Restaurant</title>
    </head>
    
        <% 
            int ownerID = Integer.parseInt(request.getParameter("ownerID"));
            RestaurantDao d = new RestaurantDao(ConnectionProvider.getConnection());
            List<Restaurant> res = new ArrayList<>();
            res = d.getOwnerRestaurant(ownerID);
            if(res==null){
                out.println("<h2>No Restaurant Added till now </h2>");
             //   response.sendRedirect("owner_page.jsp");
            }
            int i = 0;
            for (Restaurant r : res) {
        %>
        <div class="row">
            <div class="col s12 m7">
                <div class="card">
                    <div class="card-image">
                        <img src="img/<%= r.getImage()%>">
                        <span class="card-title text-center"><h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <%= r.getName()%></h1></span>
                    </div>
                    <div class="card-content">
                        <p>&nbsp;<h1>Description:</h1> <%= r.getDescription()%></p>
                        <p>&nbsp;<h1>Address</h1> <%= r.getAddress()%></p>
                        <p>&nbsp;<h1>Contact </h1><%= r.getContact()%></p>
                        <p>&nbsp;<h1>Discount</h1> <%= r.getDiscount()%></p>
                    </div>
                    <div class="card-action">
                        <!--          <a href="#">This is a link</a>-->
                    </div>
                </div>
            </div>
        </div>

        
    <%
        }
    %>
        
    
</html>
