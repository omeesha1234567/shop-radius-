package com.user.model;

import com.user.dao.UserDAO;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDAO userDAO;

    public SignupServlet() {
        this.userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward the request to the signup page (JSP)
        RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = new User();
        user.setUserName(request.getParameter("UserName"));
        user.setUserPhone(request.getParameter("UserPhone"));
        user.setUserEmail(request.getParameter("UserEmail"));
        user.setUserAddressLine1(request.getParameter("UserAddressLine1"));
        user.setUserAddressLine2(request.getParameter("UserAddressLine2"));
        user.setUserCity(request.getParameter("UserCity"));
        user.setUserPincode(request.getParameter("UserPincode"));
        user.setUserState(request.getParameter("UserState"));
        user.setUserPassword(request.getParameter("UserPassword"));
        user.setShopOwner(false);

        if (userDAO.registerUser(user)) {
            response.sendRedirect("LoginServlet");
        } else {
            request.setAttribute("errorMessage", "Registration failed. Try again.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
    }
}
