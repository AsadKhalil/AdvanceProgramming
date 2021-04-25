
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.esr.entities.Restaurant"%>
<%@page import="com.esr.database.RestaurantDao"%>
<%@page import="com.esr.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--bootstrap css-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
        <link href="css/home.css" rel="stylesheet" type="text/css"/>
        <link href="css/footer.css" rel="stylesheet" type="text/css"/>
        <title>Home | FoodLover.pk</title>
    </head>
    <body>

        <!-- Start of Navbar -->
        <%@include file ="navbar.jsp" %>
        <!--end of Navbar-->


        <div class="content-container">
            <div class="content-block">         
                <header>
                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
                        </ol>
                        <div class="carousel-inner" role="listbox">
                            <!-- Slide One - Set the background image for this slide in the line below -->
                            <div class="carousel-item active" style="background-image: url('images/carousel/slider4.jpg')">
                                <div class="carousel-caption d-none d-md-block">
                                    <h2 class="display-4">Feeling Hungry</h2>
                                    <p class="lead">You're at the right place</p>
                                </div>

                            </div>
                            <!-- Slide Two - Set the background image for this slide in the line below -->
                            <div class="carousel-item" style="background-image: url('images/carousel/slider2.jpg')">
                                <div class="carousel-caption d-none d-md-block">
                                    <h2 class="display-4">Looking for a Restaurant? </h2>
                                    <p class="lead">We've got you covered</p>
                                </div>
                            </div>
                            <!-- Slide Three - Set the background image for this slide in the line below -->
                            <div class="carousel-item" style="background-image: url('images/carousel/slider3.jpg')">
                                <div class="carousel-caption d-none d-md-block">
                                    <h2 class="display-4">Wanna share your Restaurant experience?</h2>
                                    <p class="lead">We were waiting for you. Please be gentle ;)</p>
                                </div>
                            </div>
                            <!-- Slide Four - Set the background image for this slide in the line below -->
                            <div class="carousel-item" style="background-image: url('images/carousel/slider4.jpg')">
                                <div class="carousel-caption d-none d-md-block">
                                    <h2 class="display-4">Looking for others' opinion?</h2>
                                    <p class="lead">This website was made for you ;)</p>
                                </div>
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div>
                </header>

                <div class="s010">
                    <form  name ="SearchByFoodName"  action="SearchRestaurantServlet" id="search-box">
                        <div class="inner-form">
                            <div class="basic-search">
                                <div class="input-field">
                                    
                                  
                                  <input id="search" type="text" name="FoodName" placeholder="Find a Restaurant.." />
                                    
                                    <div class="icon-wrap">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                        <path
                                            d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z">
                                        </path>
                                        </svg>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- Star of Banner -->


                <%

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
                            <div >
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
                       
                    <%
                        }
                    %>
                    <!-- end of banner -->
                    <div class="container">
                        <hr class="featurette-divider">

                        <div class="row featurette">
                            <div class="col-md-7">
                                <h2 class="featurette-heading">First featurette heading. <span class="text-muted">It'll blow your
                                        mind.</span>
                                </h2>
                                <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod
                                    semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus
                                    commodo.</p>
                            </div>
                            <div class="col-md-5">
                                <img class="featurette-image img-fluid mx-auto zoom-image" src="images/carousel/slider4.jpg"
                                     data-src="holder.js/500x500/auto" alt="Generic placeholder image">
                            </div>
                        </div>

                        <hr class="featurette-divider">

                        <div class="row featurette">
                            <div class="col-md-7 order-md-2">
                                <h2 class="featurette-heading">Oh yeah, it's that good. <span class="text-muted">See for yourself.</span>
                                </h2>
                                <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod
                                    semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus
                                    commodo.</p>
                            </div>
                            <div class="col-md-5 order-md-1">
                                <img class="featurette-image img-fluid mx-auto zoom-image" data-src="holder.js/500x500/auto"
                                     src="images/carousel/slider4.jpg" alt="Generic placeholder image">
                            </div>
                        </div>

                        <hr class="featurette-divider">

                        <div class="row featurette">
                            <div class="col-md-7">
                                <h2 class="featurette-heading">And lastly, this one. <span class="text-muted">Checkmate.</span></h2>
                                <p class="lead">Donec ullamcorper nulla non metus auctor fringilla. Vestibulum id ligula porta felis euismod
                                    semper. Praesent commodo cursus magna, vel scelerisque nisl consectetur. Fusce dapibus, tellus ac cursus
                                    commodo.</p>
                            </div>
                            <div class="col-md-5">
                                <img class="featurette-image img-fluid mx-auto zoom-image" src="images/carousel/slider4.jpg"
                                     data-src="holder.js/500x500/auto" alt="Generic placeholder image">
                            </div>
                        </div>

                    </div>
                    <hr>

                </div>
            </div>


            <!-- Start of Footer -->
            <%@include file ="footer.jsp" %>
            <!--end of footer-->





            <!--bootstrap JS-->
            <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script><script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>


    </body>
</html>
