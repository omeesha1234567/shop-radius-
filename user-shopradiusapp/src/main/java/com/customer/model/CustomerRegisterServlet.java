package com.customer.model;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.customer.dao.CustomerDAO;

import java.io.IOException;

@WebServlet("/customer-register")
public class CustomerRegisterServlet extends HttpServlet {
    
    private static final long serialVersionUID = 1L;

    // This method handles the GET request to show the registration form
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("GET request received for /customer-register");
        // Forward the request to the registration form page (JSP)
        request.getRequestDispatcher("/owner.jsp").forward(request, response);
    }

    // This method handles the POST request to process the form data
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Collect form data and create a Customer object
            System.out.println("POST request received for /customer-register");

            String fullName = request.getParameter("fullName");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String shopName = request.getParameter("shopName");
            String addressLine1 = request.getParameter("addressLine1");
            String addressLine2 = request.getParameter("addressLine2");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String pincode = request.getParameter("pincode");
            String shopType = request.getParameter("shopType");
            String businessCategory = request.getParameter("businessCategory");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String securityQuestion = request.getParameter("securityQuestion");
            String securityAnswer = request.getParameter("securityAnswer");

            // Debugging - log the collected data
            System.out.println("Form data received:");
            System.out.println("Full Name: " + fullName);
            System.out.println("Email: " + email);
            System.out.println("Phone: " + phone);
            System.out.println("Shop Name: " + shopName);
            System.out.println("Address Line 1: " + addressLine1);
            System.out.println("Address Line 2: " + addressLine2);
            System.out.println("City: " + city);
            System.out.println("State: " + state);
            System.out.println("Pincode: " + pincode);
            System.out.println("Shop Type: " + shopType);
            System.out.println("Business Category: " + businessCategory);
            System.out.println("Username: " + username);
            System.out.println("Security Question: " + securityQuestion);
            System.out.println("Security Answer: " + securityAnswer);

            // Create Customer object
            Customer customer = new Customer();
            customer.setFullName(fullName);
            customer.setEmail(email);
            customer.setPhone(phone);
            customer.setShopName(shopName);
            customer.setAddressLine1(addressLine1);
            customer.setAddressLine2(addressLine2);
            customer.setCity(city);
            customer.setState(state);
            customer.setPincode(pincode);
            customer.setShopType(shopType);
            customer.setBusinessCategory(businessCategory);
            customer.setUsername(username);
            customer.setPassword(password);
            customer.setSecurityQuestion(securityQuestion);
            customer.setSecurityAnswer(securityAnswer);

            // Debugging - confirm customer object creation
            System.out.println("Customer object created: " + customer);

            // Register the customer using DAO
            CustomerDAO customerDAO = new CustomerDAO();
            System.out.println("Registering customer in the database...");
            customerDAO.registerCustomer(customer);

            // Success message
            System.out.println("Customer registered successfully!");

            // Redirect to a success page or login page after successful registration
            response.sendRedirect("Items");
        } catch (Exception e) {
            // Log any exceptions that occur during the process
            System.out.println("Error during customer registration: " + e.getMessage());
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Registration failed. Please try again.");
        }
    }
}
