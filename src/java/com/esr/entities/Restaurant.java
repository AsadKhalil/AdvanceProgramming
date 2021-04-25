
package com.esr.entities;


public class Restaurant {
    private int id;
    private String name;
    private String description;   
    private String address;
    private String contact;
    private String discount;
    private String image;
    private int ownerID;
    
    public Restaurant(int id, String name,String description, String address, String contact,String discount,String image,int ownerId) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.address = address;
        this.contact = contact;
        this.discount = discount;
        this.image = image;
        this.ownerID = ownerId;
    }
    
    public Restaurant(){}
    
    public Restaurant(String name, String description,String address, String contact,String discount,String image) {
        this.name = name;
        this.description = description;
        this.address = address;
        this.contact = contact;
        this.discount = discount;
        this.image = image;
    }
    
    public Restaurant(String name, String description,String address, String contact,String discount,String image,int ownerID) {
        this.name = name;
        this.description = description;
        this.address = address;
        this.contact = contact;
        this.discount = discount;
        this.image = image;
        this.ownerID = ownerID;
    }
        
//    getters and setters
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getDiscount() {
        return discount;
    }

    public void setDiscount(String discount) {
        this.discount = discount;
    }
    
    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getOwnerID() {
        return ownerID;
    }

    public void setOwnerID(int ownerID) {
        this.ownerID = ownerID;
    }
    
}
