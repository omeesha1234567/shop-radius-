package com.user.model;

public class User {
    private int userId;
    private String userName;
    private String userPhone;
    private String userEmail;
    private String userAddressLine1;
    private String userAddressLine2;
    private String userCity;
    private String userPincode;
    private String userState;
    private String userPassword;
    private boolean isShopOwner;

    // Getters and Setters
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserAddressLine1() {
        return userAddressLine1;
    }

    public void setUserAddressLine1(String userAddressLine1) {
        this.userAddressLine1 = userAddressLine1;
    }

    public String getUserAddressLine2() {
        return userAddressLine2;
    }

    public void setUserAddressLine2(String userAddressLine2) {
        this.userAddressLine2 = userAddressLine2;
    }

    public String getUserCity() {
        return userCity;
    }

    public void setUserCity(String userCity) {
        this.userCity = userCity;
    }

    public String getUserPincode() {
        return userPincode;
    }

    public void setUserPincode(String userPincode) {
        this.userPincode = userPincode;
    }

    public String getUserState() {
        return userState;
    }

    public void setUserState(String userState) {
        this.userState = userState;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public boolean isShopOwner() {
        return isShopOwner;
    }

    public void setShopOwner(boolean isShopOwner) {
        this.isShopOwner = isShopOwner;
    }
}
