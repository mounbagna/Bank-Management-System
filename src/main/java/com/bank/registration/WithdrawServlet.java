package com.bank.registration;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;

@WebServlet("/withdraw")
public class WithdrawServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        PrintWriter out = response.getWriter();

        String accountNum = request.getParameter("accountNum");
        String amountStr = request.getParameter("amount");

        // Log received parameters
        System.out.println("Withdrawn accountNum: " + accountNum);
        System.out.println("Withdrawn amount: " + amountStr);
        RequestDispatcher dispatcher = null;
        double amount = 0.0;
        try {
            amount = Double.parseDouble(amountStr);
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            out.write("{\"status\": \"error\", \"message\": \"Invalid amount format.\"}");
            return;
        }

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/bankdb?useSSL=false", "root", "");

            // Check if the account exists
            String query = "SELECT balance FROM users WHERE accountNum = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, accountNum);
            rs = ps.executeQuery();

            if (rs.next()) {
                double currentBalance = rs.getDouble("balance");
                double newBalance = currentBalance - amount;

                // Update the balance
                query = "UPDATE users SET balance = ? WHERE accountNum = ?";
                ps = conn.prepareStatement(query);
                ps.setDouble(1, newBalance);
                ps.setString(2, accountNum);
                ps.executeUpdate();

                out.write("{\"status\": \"success\", \"message\": \"Withdrawal successful.\"}");
                dispatcher = request.getRequestDispatcher("withdraw.jsp");
            } else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.write("{\"status\": \"error\", \"message\": \"Account not found.\"}");
            }
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.write("{\"status\": \"error\", \"message\": \"" + e.getMessage() + "\"}");
        }
    }
}
