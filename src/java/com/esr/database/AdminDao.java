/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.esr.database;

import com.esr.entities.Admin;
import java.sql.PreparedStatement;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hp
 */
public class AdminDao {
    private Connection con;

    public AdminDao(Connection con) {
        this.con = con;
    }
    
    //methid to insert into db
    
    public boolean saveAdmin(Admin admin){
        boolean f=false;
        try{
            String query="insert into adminRegistration(adminName,adminEmail,adminPassword) values(?,?,?)";
            PreparedStatement pst=this.con.prepareStatement(query);
            pst.setString(1, admin.getName());
            pst.setString(2, admin.getEmail());
            pst.setString(3, admin.getPassword());
            
            pst.executeUpdate();
            f=true;
        }catch(SQLException e){
            
        e.printStackTrace();
        }
        return f;
    }
    
    public List<Admin> getAllAdmin() {

        List<Admin> list = new ArrayList<>();
        //fetch all the post
        try {

            PreparedStatement p = con.prepareStatement("select * from adminRegistration");
            
            ResultSet set = p.executeQuery();

            while (set.next()) {

                int id = set.getInt("adminId");
                String name = set.getString("adminName");
               
                String email = set.getString("adminEmail");
                String password = set.getString("adminPassword");
                
               Admin admin = new Admin(id, name,email,password);

                list.add(admin);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
   public Admin getUserByEmailAndPassword(String email, String password) {
        Admin admin = null;

        try {

            String query = "select * from adminRegistration where adminEmail =? and adminPassword=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                admin = new Admin();

//             data from db
                String adminName = set.getString("adminName");
//             set to user object
                admin.setName(adminName);

                admin.setId(set.getInt("adminId"));
                admin.setEmail(set.getString("adminEmail"));
                admin.setPassword(set.getString("adminPassword"));
                

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return admin;
    }
   
   
   
   
}
    
    

