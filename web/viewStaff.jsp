<%-- 
    Document   : viewStaff
    Created on : May 12, 2020, 9:55:00 AM
    Author     : lahor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Staff</title>
    </head>
    <body>
        <table border="2">

            <tbody>
                <tr>
                    <th>ID</th>
                    <th>NAME</th>
                    <th>EMAIL</th>

                </tr>


                <%@page import="java.sql.*,java.util.*"%>
                <% Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver"); %>

                <%
                    Connection connection = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=foodlover;user=hassan;password=hassan227");
                    Statement stmt = null;
                    ResultSet myRs = null;

                    stmt = connection.createStatement();
                    String sql = "select * from staff";
                    myRs = stmt.executeQuery(sql);
                    while (myRs.next()) {
                %>

                <tr>
                    <td><%=myRs.getInt("id")%> </td>
                    <td><%=myRs.getString("name")%></td>
                    <td><%=myRs.getString("email")%></td>

                </tr>

            </tbody>




            <%}
            %>
        </table>



    </body>
</html>
