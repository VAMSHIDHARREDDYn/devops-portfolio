package com.vamshidhar.portfolio;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String company = request.getParameter("company");
        String message = request.getParameter("message");

        // Log the contact form submission
        System.out.println("=== Contact Form Submission ===");
        System.out.println("Name: " + name);
        System.out.println("Email: " + email);
        System.out.println("Company: " + (company != null && !company.isEmpty() ? company : "N/A"));
        System.out.println("Message: " + message);
        System.out.println("================================");

        // Store in request scope and forward to thank you page
        request.setAttribute("name", name);
        request.setAttribute("email", email);
        request.getRequestDispatcher("thankyou.jsp").forward(request, response);
    }
}
