/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.esr.database;

import com.esr.entities.Feedback;
import com.esr.entities.Food;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author areeb
 */
public class FeedbackDao {
      private Connection con;

    public FeedbackDao(Connection con) {
        this.con = con;
    }

    //method to insert user to data base:
    public boolean saveFeedback(Feedback fb) {
        boolean f = false;
        try {
            //restaurant -->database

            String query = "insert into feedback(review,rating,restaurantId,customerId) values (?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, fb.getReview());
            pstmt.setFloat(2, fb.getRating());            
            pstmt.setInt(3, fb.getRestaurantId());
            pstmt.setInt(4, fb.getCustomerId());
            pstmt.executeUpdate();            
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;

    }
    
    public List<Feedback> getFeedbackbyRestaurantId(int resId) {

        List<Feedback> list = new ArrayList<>();
        //fetch all the post
        try {

            PreparedStatement p = con.prepareStatement("select * from feedback f join Restaurant r ON r.id = f.restaurantId where f.restaurantId = ? ");
            p.setInt(1, resId);
            ResultSet set = p.executeQuery();

            while (set.next()) {

                int id = set.getInt("id");
                String review = set.getString("review");
                Float rating = set.getFloat("rating");
                int restaurantId = set.getInt(resId);
                int customerId = set.getInt("customerId");
                
                Feedback f = new Feedback(id, review, rating,restaurantId,customerId);

                list.add(f);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    
}
