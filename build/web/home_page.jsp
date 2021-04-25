
<%@page import="java.util.ArrayList"%>
<%@page import="com.esr.entities.Owner"%>
<%@page import="com.esr.entities.Restaurant"%>
<%@page import="java.util.List"%>
<%@page import="com.esr.helper.ConnectionProvider"%>
<%@page import="com.esr.database.RestaurantDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

<script  href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
  <link href="css/footer.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

        <title>Restaurants | Foodlover.pk</title>

    </head>
    <body>
        <!-- Start of Navbar -->
        <%@include file ="navbar.jsp" %>
        <!--end of Navbar-->
        
        <br><br><br>
        <div class="row">
        <%

         //   Restaurant rr = (Restaurant) session.getAttribute("restaurantList");

            RestaurantDao d = new RestaurantDao(ConnectionProvider.getConnection());
            List<Restaurant> res = new ArrayList<>();
            res = d.getAllRestaurants();
            if (res == null) {
                out.println("<h2> unable to read</h2>");
            }
            int i = 0;
            for (Restaurant r : res) {
        %>
  <div class="container">
                            <div>
                            <div class="card text-center" >
                                    <img class="card-img-top" src="img/<%= r.getImage()%>" alt="Card image cap">
                                    <div class="card-body">
                                        <h5 class="card-title"><% out.println(r.getName());%></h5>
                                        <p class="card-text"><% out.println(r.getDiscount());%>
                                        </p>
                                        <a href="viewRestaurant.jsp?res_id=<%= r.getId()%>" class="btn btn-outline-success btn-block" role="button">View</a>
                                    </div>
                                    </div>
                                </div>
                              </div>    
    </div>



        <%
            }
        
        %>
        
        <!--bootstrap JS-->
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script><script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <!-- Start of Navbar -->
        <%@include file ="footer.jsp" %>
        <!--end of Navbar-->
        
    </body>
</html>