package com.cec.mini.calory.models;

public class LoginModel {
    private String username;
    private String password;
    private boolean active;

    // Getters and setters
    public String getLoginUsername() {
        return username;
    }

    public void setLoginUsername(String username) {
        this.username = username;
    }

    public String getLoginPassword() {
        return password;
    }

    public void setLoginPassword(String password) {
        this.password = password;
    }

    public boolean getActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }
}

