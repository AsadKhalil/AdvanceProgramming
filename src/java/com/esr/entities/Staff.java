
package com.esr.entities;

public class Staff {

    private int id;
    private String name;
    private String email;
    private String password;
    private int ownerId;

    public Staff(int id, String name, String email, String password,int ownerId) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.ownerId = ownerId;
    }

    public Staff() {
    }

    public Staff(String name, String email, String password,int ownerId) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.ownerId = ownerId;
    }
    
    public int getOwnerId() {
        return ownerId;
    }

//    getters and setters
    public void setOwnerId(int ownerId) {
        this.ownerId = ownerId;
    }

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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
