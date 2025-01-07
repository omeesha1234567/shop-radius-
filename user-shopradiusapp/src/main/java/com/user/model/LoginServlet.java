package com.user.model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.user.dao.UserDAO;
import com.user.model.User;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Create an instance of UserDAO
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward the request to the login page (login.jsp)
        System.out.println("Login page requested");
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        System.out.println("Received login request for email: " + email);
        
        // Use the UserDAO to attempt login
        User user = userDAO.loginUser(email, password);
        
        if (user != null) {
            // User login successful
            HttpSession session = request.getSession();
            session.setAttribute("userEmail", user.getUserEmail());
            session.setAttribute("userRole", user.isShopOwner() ? "shopOwner" : "normalUser");
            
            if (user.isShopOwner()) {
                // Redirect to shop owner dashboard
                response.sendRedirect("shopOwnerDashboard.jsp");
            } else {
                // Redirect to normal user dashboard
                response.sendRedirect("userDashboard.jsp");
            }
        } else {
            // Login failed
            System.out.println("Invalid email or password for email: " + email);
            request.setAttribute("errorMessage", "Invalid email or password. Please try again.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
