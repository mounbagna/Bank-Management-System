package com.bank.registration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/UserVerify")
public class UserVerify extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String name = request.getParameter("name");
            String email = request.getParameter("email");

            SendEmail sm = new SendEmail();
            String code = sm.getRandom();

            User user = new User(name, email, code);

            // Send email and set account number attribute
            boolean test = sm.sendEmail(user, request);
            if (test) {
                HttpSession session = request.getSession();
                session.setAttribute("authcode", user);
                response.sendRedirect("verify.jsp");
            } else {
                response.sendRedirect("registration.jsp");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
