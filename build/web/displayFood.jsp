<%-- 
    Document   : displayFood
    Created on : May 28, 2020, 1:44:42 AM
    Author     : areeb
--%>

<%@page import="com.esr.database.FoodDao"%>
<%@page import="com.esr.helper.ConnectionProvider"%>
<%@page import="com.esr.entities.Food"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page errorPage="error_page.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Display Food</title>
    </head>
    <!--bootstrap css-->
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
         <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
         <link href="css/home.css" rel="stylesheet" type="text/css"/>
         <link href="css/footer.css" rel="stylesheet" type="text/css"/>
    
    <style>
        
.page_title {
    padding: 30px 0px;
}
.page_title h1 {
    color: #c0392b;
    font-weight: 700;
    line-height: 2;
    margin-bottom: 0;
    position: relative;
    text-transform: capitalize;
}
.page_title h1::before {
    background: #c0392b;
    width: 70px;
    height: 2px;
    position: absolute;
    content: '';
    top: 90%;
    left: 50%;
    transform: translate(-50%, -50%);
}
.page_title h1::after {
    position: absolute;
    content: '';
    background: #fbc531;
    width: 30px;
    height: 2px;
    top: 90%;
    left: 50%;
    transform: translate(-50%, -50%);
}
/*Menu starts*/
.menu_tab {
    margin: 0 auto;
    justify-content: center;
}
.nav-item {
    display: inline-block;
    text-align: center;
}
.nav-tabs .nav-link{
    transition: .3s;
}
.nav-tabs .nav-link.active {
    background: #c0392b;
    color: #fff;
    font-weight: 700;
    border: 1px solid #c0392b;
    text-transform: capitalize;
}
.nav-link {
    color: #000;
}
.nav-tabs .nav-link:hover {
    background: #c0392b;
    color: #fff;
    border: 1px solid #c0392b;
}
.single_menu {
    position: relative;
    margin-bottom: 75px;
    transition: .3s;
}
.single_menu:hover img{
    -webkit-clip-path: polygon(0% 0%, 100% 0, 100% 50%, 100% 100%, 0% 100%);
clip-path: polygon(0% 0%, 100% 0, 100% 50%, 100% 100%, 0% 100%);

}
.single_menu img {
    width: 33%;
    position: absolute;
    height: 140px;
    -webkit-clip-path: polygon(0% 0%, 75% 0%, 100% 50%, 75% 100%, 0% 100%);
    clip-path: polygon(0% 0%, 75% 0%, 100% 50%, 75% 100%, 0% 100%);
    transition: .3s;
    border: 1px solid #ddd;
    border-radius: 5px;
}
.menu_content {
    padding-left: 200px;
}
.menu_content h4 {
    font-size: 25px;
    font-weight: 300;
    border-bottom: 1px dashed #c0392b;
    line-height: 2;
    text-transform: capitalize;
}
.menu_content h4 span {
    font-size: 25px;
    font-weight: 800;
    float: right;
    font-style: italic;
    color: #c0392b;
}
.menu_content p {
    font-weight: 200;
    font-size: 16px;
    letter-spacing: 1px;
}
.menu_btn.btn.btn-danger {
    margin: 0 auto;
    display: block;
    width: 140px;
}
/*Menu ends*/
.menu_btn.btn.btn-danger {
  margin: 0 auto;
  display: block;
  width: 140px;
}
.btn.btn-danger {
  background: #c0392b;
  border: 1px solid #c0392b;
  transition: .3s;
  position: relative;
  z-index: 1;
  text-transform: capitalize;
  font-weight: 700;
  overflow: hidden;
  padding: 15px 25px;
}
.btn.btn-danger::before {
  position: absolute;
  content: '';
  background: #e74c3c;
  width: 100%;
  height: 100%;
  left: -100%;
  top: 100%;
  transition: .3s;
  z-index: -1;
}
.btn.btn-danger:hover:before{
    top: 0;
    left: 0;
}

    </style>>
    
    
    <body>
        <%
            Food fd = (Food) session.getAttribute("foodList");
            int restaurantID = Integer.parseInt(request.getParameter("resId"));
            FoodDao d = new FoodDao(ConnectionProvider.getConnection());
            List<Food> food = new ArrayList<>();

            food = d.getRestaurantFood(restaurantID);
            //out.println(fd.getRestaurantId());
            if (food == null) {
                response.sendRedirect("error_page.jsp");
            }
            int i = 0;
            for (Food f : food) {
        %>

        
         <section id="our_menu" class="pt-5 pb-5">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="page_title text-center mb-4">
            <h1>our menu</h1>
            <div class="single_line"></div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="tab-content col-lg-12" id="myTabContent">
          <div class="tab-pane fade show active" id="breakfast" role="tabpanel" aria-labelledby="breakfast-tab">
            <div class="row">
              <div class="col-md-6">
                <div class="single_menu">
                            <div class="col-md-5">
                                <img class="featurette-image img-fluid mx-auto zoom-image" src="images/carousel/slider4.jpg"
                                     data-src="holder.js/500x600/auto" alt="Generic placeholder image">
                            </div>
                  <div class="menu_content">
                    <h4><%= f.getFoodName() %><span><%= f.getPrice() %></span></h4>
                    <p><%= f.getType_of_Food() %></p>                    
                    <p><%= f.getDescription() %></p>
                  </div>
                </div>
           
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
         </section>


                        
        <%
            }
        %>

    </body>
</html>
