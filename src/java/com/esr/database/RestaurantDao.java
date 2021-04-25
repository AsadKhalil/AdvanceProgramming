
package com.esr.database;
import com.esr.entities.Restaurant;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class RestaurantDao {
    private Connection con;

    public RestaurantDao(Connection con) {
        this.con = con;
    }

    //method to insert user to data base:
    public boolean saveRestaurant(Restaurant res) {
        boolean f = false;
        try {
            //restaurant -->database

            String query = "insert into Restaurant(name,description,address,contact,discount,img,ownerID) values (?,?,?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, res.getName());
            pstmt.setString(2, res.getDescription());            
            pstmt.setString(3, res.getAddress());
            pstmt.setString(4, res.getContact());
            pstmt.setString(5, res.getDiscount());
            pstmt.setString(6, res.getImage());
            pstmt.setInt(7, res.getOwnerID());
            pstmt.executeUpdate();            
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;

    }
    
    //    get all the posts
    public List<Restaurant> getAllRestaurants() {

        List<Restaurant> list = new ArrayList<>();
        //fetch all the post
        try {

            PreparedStatement p = con.prepareStatement("select * from Restaurant");
            
            ResultSet set = p.executeQuery();

            while (set.next()) {

                int id = set.getInt("id");
                String name = set.getString("name");
                String description = set.getString("description");
                String address = set.getString("address");
                String contact = set.getString("contact");
                String discount = set.getString("discount");
                String image = set.getString("img");
                int ownerId = set.getInt("ownerID");
                Restaurant res = new Restaurant(id, name, description, address, contact, discount,image,ownerId);

                list.add(res);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Restaurant> getOwnerRestaurant(int ownerID) {

        List<Restaurant> list = new ArrayList<>();
        //fetch all the post
        try {

            PreparedStatement p = con.prepareStatement("select * from Restaurant r join Owner o ON o.id = r.ownerID where r.ownerID = ?");
            p.setInt(1, ownerID);
            ResultSet set = p.executeQuery();

            while (set.next()) {

                int id = set.getInt("id");
                String name = set.getString("name");
                String description = set.getString("description");
                String address = set.getString("address");
                String contact = set.getString("contact");
                String discount = set.getString("discount");
                String image = set.getString("img");
                Restaurant res = new Restaurant(id, name, description, address, contact, discount,image,ownerID);

                list.add(res);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public Restaurant getRestaurantByRestaurantId(int resId) {
        Restaurant res = null;
        try {
            String q = "select * from Restaurant where id=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, resId);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                res = new Restaurant();

//             data from db
                String name = set.getString("name");
//             set to user object
                res.setName(name);

                res.setId(set.getInt("id"));
                res.setDescription(set.getString("description"));
                res.setAddress(set.getString("address"));
                res.setContact(set.getString("contact"));
                res.setDiscount(set.getString("discount"));
                res.setImage(set.getString("img"));
               
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return res;
    }
    
    
    public boolean removeRestaurantByRestaurantId(int resId) {
        boolean f = false;
        try {
            String q = "delete from Restaurant where id=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, resId);
            ps.executeUpdate();
            f = true;  
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    
    public Restaurant searchRestaurant(String name) {
        Restaurant res = null;
        try {
            String q = "select * from Restaurant where name = ?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setString(1, name);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                res = new Restaurant();

                res.setId(set.getInt("id"));
                res.setName(name);
                res.setDescription(set.getString("description"));
                res.setAddress(set.getString("address"));
                res.setContact(set.getString("contact"));
                res.setDiscount(set.getString("discount"));
                res.setImage(set.getString("img"));
                res.setOwnerID(set.getInt("ownerID"));
               
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
}
