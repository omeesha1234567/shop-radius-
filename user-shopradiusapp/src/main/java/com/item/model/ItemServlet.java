package com.item.model;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.item.dao.ItemDAO;

@WebServlet("/Items")
public class ItemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ItemDAO itemDAO;
    // This method handles the GET request to show the registration form
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println("GET request received for /Items");
        // Forward the request to the registration form page (JSP)
        request.getRequestDispatcher("/Items.jsp").forward(request, response);
    }
    public ItemServlet() {
        super();
        itemDAO = new ItemDAO(); // Initialize ItemDAO
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Print all request parameters for debugging
        System.out.println("Received parameters:");
        @SuppressWarnings("unchecked")
		Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            System.out.println(paramName + ": " + request.getParameter(paramName));
        }
    	String action = request.getParameter("action");
    	System.out.println("Received action: " + action);  // Debugging log to check if action is being passed
    	if (action == null) {
    	    System.out.println("NO ACTION!??!?");
    	    response.sendRedirect("error.jsp"); // Redirect to an error page if action is null
    	    return;
    	}
        switch (action) {
            case "add":
                addItem(request, response);
                break;
            case "update":
                updateItem(request, response);
                break;
            case "delete":
                removeItem(request, response);
                break;
            default:
            	System.out.println("still no action?");
                response.sendRedirect("error.jsp");
                break;
        }
    }

    private void addItem(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String itemName = request.getParameter("itemName");
        String itemImage = request.getParameter("itemImage"); // Assuming image is a path or URL
        String itemDescription = request.getParameter("itemDescription");
        double itemPrice = Double.parseDouble(request.getParameter("itemPrice"));
        int itemQuantity = Integer.parseInt(request.getParameter("itemQuantity"));
        String shopName = (String) request.getSession().getAttribute("shopName");

        if (shopName == null) {
            request.setAttribute("errorMessage", "You must be logged in as a shop owner.");
            System.out.println("shop owner banke dikha");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        Item item = new Item();
        item.setItemName(itemName);
        item.setItemImage(itemImage);
        item.setItemDescription(itemDescription);
        item.setItemPrice(itemPrice);
        item.setItemQuantity(itemQuantity);
        item.setShopName(shopName);

        boolean success = itemDAO.addItem(item);
        if (success) {
            response.sendRedirect("success.jsp");
        } else {
            request.setAttribute("errorMessage", "Failed to add item.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    private void updateItem(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String itemName = request.getParameter("itemName");
        String itemImage = request.getParameter("itemImage");
        String itemDescription = request.getParameter("itemDescription");
        double itemPrice = Double.parseDouble(request.getParameter("itemPrice"));
        int itemQuantity = Integer.parseInt(request.getParameter("itemQuantity"));
        String shopName = (String) request.getSession().getAttribute("shopName");

        if (shopName == null) {
            request.setAttribute("errorMessage", "You must be logged in as a shop owner.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        Item item = new Item();
        item.setItemName(itemName);
        item.setItemImage(itemImage);
        item.setItemDescription(itemDescription);
        item.setItemPrice(itemPrice);
        item.setItemQuantity(itemQuantity);
        item.setShopName(shopName);

        boolean success = itemDAO.updateItem(item);
        if (success) {
            response.sendRedirect("success.jsp");
        } else {
            request.setAttribute("errorMessage", "Failed to update item.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    private void removeItem(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String itemName = request.getParameter("itemName");
        String shopName = (String) request.getSession().getAttribute("shopName");

        if (shopName == null) {
            request.setAttribute("errorMessage", "You must be logged in as a shop owner.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        boolean success = itemDAO.removeItem(itemName, shopName);
        if (success) {
            response.sendRedirect("success.jsp");
        } else {
            request.setAttribute("errorMessage", "Failed to remove item.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
