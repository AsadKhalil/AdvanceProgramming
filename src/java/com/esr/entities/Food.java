
package com.esr.entities;

import java.sql.Connection;

public class Food
{
    private int foodId;
    private String foodName;
    private String type_of_Food;
    private String description;
    private int price;
    private int restaurantId;
    
    public Food(){}

    public Food(int foodId, String foodName, String type_of_Food, String description, int price,int restaurantId) {
        this.foodId = foodId;
        this.foodName = foodName;
        this.type_of_Food = type_of_Food;
        this.description = description;
        this.price = price;
        this.restaurantId = restaurantId;
    }

    public Food(String foodName, String type_of_Food, String description, int price,int restaurantId) {
        this.foodName = foodName;
        this.type_of_Food = type_of_Food;
        this.description = description;
        this.price = price;
        this.restaurantId = restaurantId;
    }

    public int getFoodId() {
        return foodId;
    }

    public void setFoodId(int foodId) {
        this.foodId = foodId;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public String getType_of_Food() {
        return type_of_Food;
    }

    public void setType_of_Food(String type_of_Food) {
        this.type_of_Food = type_of_Food;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

}
