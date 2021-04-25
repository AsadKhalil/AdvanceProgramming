
package com.esr.helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConnectionProvider {
    
    private static Connection connection;
    
    public static Connection getConnection() throws ClassNotFoundException {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        try {
            if (connection == null) {
                connection = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=ESR;user=areeb;password=@reeb786");
            }
        } catch (SQLException E) {

            E.printStackTrace();
        }
        return connection;
    }
    
}
