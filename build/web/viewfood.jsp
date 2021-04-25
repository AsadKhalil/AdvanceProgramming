<%-- 
    Document   : viewfood
    Created on : May 10, 2020, 12:34:06 AM
    Author     : ikay
--%>

<%--<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="mypackage.connection"%>--%>


<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>


        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <!--Bootsrap 4 CDN-->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

        <!--Fontawesome CDN-->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

        <!--Custom styles-->

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>

    <body>


        <div class="form-group text-center">
            <br><br>
            <a class="btn btn-primary" href="login12.jsp" role="button">POST YOUR FEEDBACK</a>
        </div>



        <sql:setDataSource driver="com.microsoft.sqlserver.jdbc.SQLServerDriver" url="jdbc:sqlserver://localhost:1433;databaseName=ESR" user="areeb" password="@reeb786" var="ds"></sql:setDataSource>
        <sql:query dataSource="${ds}" var="rs" >select * from feedtable;</sql:query>

            <div class="container">
                <table class="table">
                    <tr>
                        <td class="jumbotron text-light bg-dark">EMAILS</td>
                        <td class="jumbotron text-light bg-dark">COMMENTS</td>
                        <td class="jumbotron text-light bg-dark" >RATINGS</td>

                    </tr>

                <c:forEach items="${rs.rows}" var="row">
                    <tr>
                        <td><c:out value="${row.email}"></c:out></td>
                        <td><c:out value="${row.comment}"></c:out></td>
                        <td><c:out value="${row.rating}"></c:out></td>
                        </tr>
                </c:forEach>
            </table>
        </div>

    </body>
</html>
