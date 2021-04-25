package com.esr.database;

import com.esr.entities.Food;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FoodDao {

    private Connection con;

    public FoodDao(Connection con) {
        this.con = con;
    }

    // Insertion
    public boolean saveFood(Food food) {
        boolean f = false;
        try {
            //restaurant -->database

            String query = "insert into food(name, type, description, price,restaurantID) values (?,?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, food.getFoodName());
            pstmt.setString(2, food.getType_of_Food());
            pstmt.setString(3, food.getDescription());
            pstmt.setInt(4, food.getPrice());
            pstmt.setInt(5, food.getRestaurantId());
            pstmt.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;

    }

    //    get all the posts
    public List<Food> getAllFood() {

        List<Food> list = new ArrayList<>();
        //fetch all the food
        try {

            PreparedStatement p = con.prepareStatement("select * from food");

            ResultSet set = p.executeQuery();

            while (set.next()) {

                int id = set.getInt("id");
                String name = set.getString("name");
                String type = set.getString("type");
                String description = set.getString("description");
                Integer price = set.getInt("price");
                Integer restaurantId = set.getInt("restaurantID");

                Food food = new Food(id, name, type, description, price, restaurantId);

                list.add(food);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Food> getRestaurantFood(int resId) {

        List<Food> list = new ArrayList<>();
        //fetch all the post
        try {

            PreparedStatement p = con.prepareStatement("select * from Food f join Restaurant r ON r.id = f.restaurantID where restaurantID = ?");
            p.setInt(1, resId);
            ResultSet set = p.executeQuery();

            while (set.next()) {

                int id = set.getInt("id");
                String name = set.getString("name");
                String type = set.getString("type");
                String description = set.getString("description");
                int price = Integer.parseInt(set.getString("price"));
                int restaurantId =Integer.parseInt( set.getString("restaurantID"));

                Food food = new Food(id, name, type, description, price, restaurantId);

                list.add(food);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public boolean removeFoodByFoodId(int foodId) {
        boolean f = false;
        try {
            String q = "delete from food where id=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, foodId);
            ps.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public Food searchFood(String name) {
        Food f = null;
        try {
            String q = "select * from food where name=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setString(1, name);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                f = new Food();

                f.setFoodId(set.getInt("id"));
                f.setFoodName(name);
                f.setType_of_Food(set.getString("type"));
                f.setDescription(set.getString("description"));
                f.setPrice(set.getInt("price"));
                f.setRestaurantId(set.getInt("restaurantID"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public Food getFoodByFoodId(int foodId) {
        Food f = null;
        try {
            String q = "select * from food where id=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, foodId);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                f = new Food();

//             data from db
                String name = set.getString("name");
//             set to user object
                f.setFoodName(name);

                f.setFoodId(foodId);
                f.setDescription(set.getString("description"));
                f.setType_of_Food(set.getString("type"));
                f.setPrice(set.getInt("price"));
                f.setRestaurantId(set.getInt("restaurantID"));
               
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public boolean updateFood(Food food) {

        boolean f = false;
        try {

            String query = "update food set name=? , price=? where  id =?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, food.getFoodName());
            p.setInt(2, food.getPrice());
            p.setInt(3, food.getFoodId());

            p.executeUpdate();
            f = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
}
