package com.bank.registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;


import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Random;

@WebServlet("/register")
public class RegistrationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String reppassword = request.getParameter("reppassword");
        Random rnd = new Random();
        long number = Math.abs(rnd.nextLong()) % 9000000000000L + 1000000000000L;

        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());

        RequestDispatcher dispatcher = null;
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/bankdb?useSSL=false", "root", "");
            PreparedStatement pst = conn.prepareStatement("INSERT INTO users(username, email, phone, password, accountNum) VALUES (?, ?, ?, ?,?)");
            pst.setString(1, name);
            pst.setString(2, email);
            pst.setString(3, phone);
            pst.setString(4, hashedPassword);
            pst.setString(5, String.valueOf(number));

            int rowCount = pst.executeUpdate();
            dispatcher = request.getRequestDispatcher("/UserVerify");
            if (rowCount > 0) {
                request.setAttribute("accountNumber", String.valueOf(number));
                request.setAttribute("status", "success");

            } else {
                request.setAttribute("status", "failed");
            }
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
