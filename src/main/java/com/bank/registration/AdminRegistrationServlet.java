package com.bank.registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/adminregister")
public class AdminRegistrationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        String password = request.getParameter("password");

        RequestDispatcher dispatcher = null;
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/bankdb?useSSL=false", "root", "");
            PreparedStatement pst = conn.prepareStatement("INSERT INTO admin(name, email, password) VALUES (?, ?, ?)");
            pst.setString(1, name);
            pst.setString(2, email);
            pst.setString(3, hashedPassword);

            int rowCount = pst.executeUpdate();
            if (rowCount > 0) {
                request.setAttribute("status", "success");
                response.sendRedirect("adminLogin.jsp");
            } else {
                request.setAttribute("status", "failed");
                response.sendRedirect("adminregistration.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
