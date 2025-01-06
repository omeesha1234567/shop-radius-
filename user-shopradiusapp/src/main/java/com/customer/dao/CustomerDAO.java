package com.customer.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.customer.model.Customer;

public class CustomerDAO {
    private Connection connection;

    // Connection settings
    private String jdbcURL = "jdbc:mysql://localhost:3306/userappdb?useSSL=false&serverTimezone=UTC";
    private String jdbcUserName = "root"; // Update with actual username
    private String jdbcPassword = "Ashuyadav@28"; // Update with actual password

    // Constructor to initialize database connection
    public CustomerDAO() {
        try {
            // Load the JDBC driver
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

    // Method to check login credentials
    public boolean checkLogin(String username, String password) {
        String query = "SELECT * FROM customers WHERE username = ? AND password = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return true; // Successful login
            }
        } catch (SQLException e) {
            System.out.println("Error during login check.");
            e.printStackTrace(); // Log the error
        }
        return false; // Invalid credentials
    }

    // Method to register a new customer
    public void registerCustomer(Customer customer) {
        if (connection == null) {
            System.out.println("Error: Database connection is not established.");
            return; // Ensure connection is valid
        }

        String query = "INSERT INTO customers (fullName, email, phone, shopName, addressLine1, addressLine2, city, state, pincode, shopType, businessCategory, username, password, securityQuestion, securityAnswer) " +
                       "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, customer.getFullName());
            ps.setString(2, customer.getEmail());
            ps.setString(3, customer.getPhone());
            ps.setString(4, customer.getShopName());
            ps.setString(5, customer.getAddressLine1());
            ps.setString(6, customer.getAddressLine2());
            ps.setString(7, customer.getCity());
            ps.setString(8, customer.getState());
            ps.setString(9, customer.getPincode());
            ps.setString(10, customer.getShopType());
            ps.setString(11, customer.getBusinessCategory());
            ps.setString(12, customer.getUsername());
            ps.setString(13, customer.getPassword());
            ps.setString(14, customer.getSecurityQuestion());
            ps.setString(15, customer.getSecurityAnswer());

            ps.executeUpdate(); // Execute the insert query
            System.out.println("Customer registered successfully.");
        } catch (SQLException e) {
            System.out.println("Error during customer registration.");
            e.printStackTrace(); // Log the error
        }
    }

    // Optional: Method to check if a user name already exists
    public boolean usernameExists(String username) {
        String query = "SELECT * FROM customers WHERE username = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return true; // User name exists
            }
        } catch (SQLException e) {
            System.out.println("Error during username existence check.");
            e.printStackTrace(); // Log the error
        }
        return false; // User name does not exist
    }
}
