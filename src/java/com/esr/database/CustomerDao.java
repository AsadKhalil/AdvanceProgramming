
package com.esr.database;

import com.esr.entities.Customer;
import java.sql.*;

public class CustomerDao {

    private Connection con;

    public CustomerDao(Connection con) {
        this.con = con;
    }

    //method to insert user to data base:
    public boolean saveUser(Customer user) {
        boolean f = false;
        try {
            //user -->database

            String query = "insert into Customer(name,email,password) values (?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;

    }

    //get user by useremail and userpassword:
    public Customer getUserByEmailAndPassword(String email, String password) {
        Customer user = null;
        try {

            String query = "select * from Customer where email =? and password=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                user = new Customer();

//             data from db
                String name = set.getString("name");
//             set to user object
                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public Customer getUserByUserId(int userId) {
        Customer user = null;
        try {
            String q = "select * from Customer where id=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, userId);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                user = new Customer();

//             data from db
                String name = set.getString("name");
//             set to user object
                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
               
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
}