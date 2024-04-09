package com.bank.registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.mindrot.jbcrypt.BCrypt; // Import the BCrypt library

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/bankdb?useSSL=false", "root", "");
            PreparedStatement pst = conn.prepareStatement("SELECT * from users where username = ?");
            pst.setString(1, name);

            ResultSet rs = pst.executeQuery();
            if (rs.next()) {
                String hashedPasswordFromDB = rs.getString("password");

                // Compare the provided password with the hashed password from the database
                if (BCrypt.checkpw(password, hashedPasswordFromDB)) {
                    session.setAttribute("name", rs.getString("username"));
                    dispatcher = request.getRequestDispatcher("index.jsp");
                } else {
                    request.setAttribute("status", "failed");
                    dispatcher = request.getRequestDispatcher("login.jsp");
                }
            } else {
                request.setAttribute("status", "failed");
                dispatcher = request.getRequestDispatcher("login.jsp");
            }
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
