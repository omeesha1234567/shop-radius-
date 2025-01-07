package com.user.dao;

import com.user.model.User;
import java.sql.*;

public class UserDAO {
    private Connection connection;

    // Connection settings
    private String jdbcURL = "jdbc:mysql://localhost:3306/userappdb?useSSL=false&serverTimezone=UTC";
    private String jdbcUserName = "root";
    private String jdbcPassword = "Ashuyadav@28";

    private static final String INSERT_USER_SQL = "INSERT INTO users (userName, userPhone, userEmail, userAddressLine1, userAddressLine2, userCity, userPincode, userState, userPassword, isShopOwner) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_USER_BY_EMAIL_AND_PASSWORD = "SELECT * FROM users WHERE userEmail = ? AND userPassword = ?";

    // Constructor to initialize the connection
    public UserDAO() {
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish the connection
            connection = DriverManager.getConnection(jdbcURL, jdbcUserName, jdbcPassword);
            System.out.println("Database connection successful");
        } catch (ClassNotFoundException e) {
            System.out.println("Error: MySQL JDBC Driver not found.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Error: Unable to establish database connection.");
            e.printStackTrace();
        }
    }

    // Method to register a user in the database
    public boolean registerUser(User user) {
        System.out.println("Registering user: " + user.getUserName());
        
        try (PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL)) {
            // Set parameters in the SQL query
            preparedStatement.setString(1, user.getUserName());
            preparedStatement.setString(2, user.getUserPhone());
            preparedStatement.setString(3, user.getUserEmail());
            preparedStatement.setString(4, user.getUserAddressLine1());
            preparedStatement.setString(5, user.getUserAddressLine2());
            preparedStatement.setString(6, user.getUserCity());
            preparedStatement.setString(7, user.getUserPincode());
            preparedStatement.setString(8, user.getUserState());
            preparedStatement.setString(9, user.getUserPassword());
            preparedStatement.setBoolean(10, user.isShopOwner());

            int rowsInserted = preparedStatement.executeUpdate();

            if (rowsInserted > 0) {
                System.out.println("User registered successfully: " + user.getUserName());
                return true; // Registration success
            } else {
                System.out.println("User registration failed: No rows affected.");
            }
        } catch (SQLException e) {
            System.out.println("SQL Exception occurred during user registration.");
            e.printStackTrace();
        }
        
        return false; // Registration failed
    }

    // Method to log in the user by email and password
    public User loginUser(String email, String password) {
        try (PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_EMAIL_AND_PASSWORD)) {
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                User user = new User();
                user.setUserId(rs.getInt("userId"));
                user.setUserName(rs.getString("userName"));
                user.setUserPhone(rs.getString("userPhone"));
                user.setUserEmail(rs.getString("userEmail"));
                user.setUserAddressLine1(rs.getString("userAddressLine1"));
                user.setUserAddressLine2(rs.getString("userAddressLine2"));
                user.setUserCity(rs.getString("userCity"));
                user.setUserPincode(rs.getString("userPincode"));
                user.setUserState(rs.getString("userState"));
                user.setShopOwner(rs.getBoolean("isShopOwner"));
                return user;
            }
        } catch (SQLException e) {
            System.out.println("SQL Exception occurred during user login.");
            e.printStackTrace();
        }
        return null;
    }
}
