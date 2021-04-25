<%-- 
    Document   : FeedbackPage
    Created on : May 28, 2020, 4:55:04 PM
    Author     : areeb
--%>

<%@page import="com.esr.entities.Restaurant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <title>Star Rating System</title>
     <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
                        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
                        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>  
	<!--Bootsrap 4 CDN-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

    <style>
        
       .panel-heading{font-size: 30px;}
        
        .pb-cmnt-container {
        font-family: Lato;
        margin-top: 100px;
         width: 100%;
    }

    .pb-cmnt-textarea {
        resize: none;
        padding: 20px;
        height: 100px;
        width: 200%;
        border: 1px solid #F2F2F2;
    }
    
    </style>
 
</head>
<body>
        <%

            Restaurant r = (Restaurant) session.getAttribute("restaurantList");
%>

    <form action="FeedbackServlet" method="post">
        <div class="form-group text-justify">
                    <div class="container  pb-cmnt-container">
                       <div class="row">
                           <div class="col-md-6 col-md-offset-3">
                               <div class="panel panel-info">
                                   <div class="panel-body">
                                       <textarea required name="comment" placeholder="Write your comment here!" class="pb-cmnt-textarea"></textarea>
                                       <b>RATINGS : </b> <input  required type="number" min="0" max="10" step="any" name="rating"> &nbsp;<b>/10</b>
                                   </div>
                               </div>
                           </div>
                       </div>
                   </div>
     

            
            
            
<!--       <input type="hidden" name="myhiddenvalue" value="<%=(String)( request.getAttribute("uemail")) %>" />
        -->
        </div>  
        <div class="form-group text-center">
            <input type="submit" value="Post" class="btn btn-primary btn-lg ">
        </div>
            
       
    </form>
</body>
</html>
