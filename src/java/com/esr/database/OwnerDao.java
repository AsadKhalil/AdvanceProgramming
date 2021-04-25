
package com.esr.database;

import com.esr.entities.Owner;
import java.sql.*;

public class OwnerDao {

    private Connection con;

    public OwnerDao(Connection con) {
        this.con = con;
    }

    //method to insert user to data base:
    public boolean saveUser(Owner user) {
        boolean f = false;
        try {
            //user -->database

            String query = "insert into Owner(name,email,password) values (?,?,?)";
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
    public Owner getUserByEmailAndPassword(String email, String password) {
        Owner user = null;

        try {

            String query = "select * from Owner where email =? and password=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                user = new Owner();

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

    public boolean updateUser(Owner user) {

        boolean f = false;
        try {

            String query = "update Owner set name=? , email=? , password=? where  id =?";
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

    public Owner getUserByUserId(int userId) {
        Owner user = null;
        try {
            String q = "select * from Owner where id=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, userId);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                user = new Owner();

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