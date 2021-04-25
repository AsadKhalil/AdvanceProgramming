<%-- 
    Document   : viewComments
    Created on : May 29, 2020, 1:22:49 AM
    Author     : areeb
--%>

<%@page import="com.esr.entities.Customer"%>
<%@page import="com.esr.database.CustomerDao"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.esr.database.FeedbackDao"%>
<%@page import="com.esr.entities.Feedback"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.esr.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>view Feedback</title>
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

        <%

            Cookie[] cookies1 = request.getCookies();
            int resid = 0;
            if (cookies1 == null) {
                //new user left part because we are dealing with login must
                out.println("No Feedback till now");
            } else {
                for (Cookie c1 : cookies1) {
                    String tname = c1.getName();
                    if (tname.equals("getmyid")) {
                        resid = Integer.parseInt(c1.getValue());

                    }
                }
            }

            //out.println(resid);
            FeedbackDao dao = new FeedbackDao(ConnectionProvider.getConnection());
            CustomerDao dao1 = new CustomerDao(ConnectionProvider.getConnection());
            Customer customer = new Customer();

            List<Feedback> list = new ArrayList<>();

            list = dao.getFeedbackbyRestaurantId(resid);
            if (list == null) {
                out.println("No feedback till now");
            }
            for (Feedback f : list) {
                // out.println("sdagfg");
                customer = dao1.getUserByUserId(f.getCustomerId());
                //  out.println(customer.getName()+" : \n");
                //  out.println("Review  :\t\t"+f.getReview());
                //  out.println("\nRating  :\t\t"+f.getRating());
                //  out.println();
                //  out.println();


        %>

        <div class="row">
            <div class="col s12 m6">
                <div class="card blue-grey darken-1">
                    <div class="card-content white-text">
                        <span class="card-title"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<h2>View Feedback</h2></span>
                        <p>Name <%= customer.getName()%> &nbsp;&nbsp; Review <%= f.getReview()%>&nbsp;&nbsp; Rating <%= f.getRating()%> </p>
                    </div>
                    <div class="card-action">
                    </div>
                    
                </div>
            </div>
        </div>



        <%
            }
        %>


    </body>
</html>
