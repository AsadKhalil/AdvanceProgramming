/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.esr.entities;

/**
 *
 * @author areeb
 */
public class Feedback {
    private int id;
    private String review;
    private float rating;
    private int restaurantId;
    private int customerId;
    
    public Feedback(int id, String review, float rating, int restaurantId,int customerId) {
        this.id = id;
        this.review = review;
        this.rating = rating;
        this.restaurantId = restaurantId;
        this.customerId = customerId;
    }

    public Feedback(String review, float rating, int restaurantId,int customerId) {
        this.review = review;
        this.rating = rating;
        this.restaurantId = restaurantId;
        this.customerId = customerId;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public float getRating() {
        return rating;
    }

    public void setRating(float rating) {
        this.rating = rating;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }
    
}
