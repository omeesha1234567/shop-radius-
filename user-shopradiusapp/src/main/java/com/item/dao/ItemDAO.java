package com.item.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.item.model.Item;

public class ItemDAO {
    private Connection connection;

    // Connection settings (same as CustomerDAO)
    private String jdbcURL = "jdbc:mysql://localhost:3306/userappdb?useSSL=false&serverTimezone=UTC";
    private String jdbcUserName = "root"; // Update with actual user name
    private String jdbcPassword = "Ashuyadav@28"; // Update with actual password

    // Constructor to initialize database connection
    public ItemDAO() {
        try {
            // Load the JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish the connection
            connection = DriverManager.getConnection(jdbcURL, jdbcUserName, jdbcPassword);
            System.out.println("Database connection successful for ItemDAO");
        } catch (ClassNotFoundException e) {
            System.out.println("Error: MySQL JDBC Driver not found.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Error: Unable to establish database connection.");
            e.printStackTrace();
        }
    }

    // Add an item
    public boolean addItem(Item item) {
        String query = "INSERT INTO Item (itemName, itemImage, itemDescription, itemPrice, itemQuantity, shopName) VALUES (?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, item.getItemName());
            stmt.setString(2, item.getItemImage()); // Assuming image is a string path
            stmt.setString(3, item.getItemDescription());
            stmt.setDouble(4, item.getItemPrice());
            stmt.setInt(5, item.getItemQuantity());
            stmt.setString(6, item.getShopName());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error: Unable to add item.");
            e.printStackTrace();
            return false;
        }
    }

    // Remove an item
    public boolean removeItem(String itemName, String shopName) {
        String query = "DELETE FROM Item WHERE itemName = ? AND shopName = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, itemName);
            stmt.setString(2, shopName);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error: Unable to remove item.");
            e.printStackTrace();
            return false;
        }
    }

    // Update an item
    public boolean updateItem(Item item) {
        String query = "UPDATE Item SET itemImage = ?, itemDescription = ?, itemPrice = ?, itemQuantity = ? WHERE itemName = ? AND shopName = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, item.getItemImage());
            stmt.setString(2, item.getItemDescription());
            stmt.setDouble(3, item.getItemPrice());
            stmt.setInt(4, item.getItemQuantity());
            stmt.setString(5, item.getItemName());
            stmt.setString(6, item.getShopName());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error: Unable to update item.");
            e.printStackTrace();
            return false;
        }
    }

    // Fetch all items for a shop
    public List<Item> getItemsByShopName(String shopName) {
        List<Item> items = new ArrayList<>();
        String query = "SELECT * FROM Item WHERE shopName = ?";
        try (PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, shopName);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Item item = new Item();
                    item.setItemName(rs.getString("itemName"));
                    item.setItemImage(rs.getString("itemImage"));
                    item.setItemDescription(rs.getString("itemDescription"));
                    item.setItemPrice(rs.getDouble("itemPrice"));
                    item.setItemQuantity(rs.getInt("itemQuantity"));
                    item.setShopName(rs.getString("shopName"));
                    items.add(item);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error: Unable to fetch items.");
            e.printStackTrace();
        }
        return items;
    }
}
