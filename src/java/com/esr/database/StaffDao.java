/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.esr.database;

import com.esr.entities.Staff;
import java.sql.*;

public class StaffDao {

    private Connection con;

    public StaffDao(Connection con) {
        this.con = con;
    }

    //method to insert user to data base:
    public boolean saveStaff(Staff s) {
        boolean f = false;
        try {
            //user -->database

            String query = "insert into staff(name,email,password,ownerID) values (?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, s.getName());
            pstmt.setString(2, s.getEmail());
            pstmt.setString(3, s.getPassword());
            pstmt.setInt(4, s.getOwnerId());
            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;

    }

    //get user by useremail and userpassword:
    public Staff getStaffByEmailAndPassword(String email, String password) {
        Staff s = null;

        try {

            String query = "select * from staff where email =? and password=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                s = new Staff();

//             data from db
                String name = set.getString("name");
//             set to user object
                s.setName(name);

                s.setId(set.getInt("id"));
                s.setEmail(set.getString("email"));
                s.setPassword(set.getString("password"));
                
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return s;
    }

    public boolean updateStaff(Staff user) {

        boolean f = false;
        try {

            String query = "update staff set name=? , email=? , password=? where  id =?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setInt(4, user.getId());

            p.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public Staff getStaffByStaffId(int userId) {
        Staff user = null;
        try {
            String q = "select * from staff where id=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, userId);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                user = new Staff();

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
    
    public boolean removeStaffBStaffId(int staffId) {
        boolean f = false;
        try {
            String q = "delete from staff where id=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, staffId);
            ps.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    
}
