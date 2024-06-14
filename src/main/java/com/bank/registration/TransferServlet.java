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

@WebServlet("/transfer")
public class TransferServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        String faccount = request.getParameter("faccount");
        String tnumber = request.getParameter("tnumber");
        String amountStr = request.getParameter("amount");

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
        RequestDispatcher dispatcher = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/bankdb?useSSL=false", "root", "");

            // Check if the from account exists and has sufficient balance
            String query = "SELECT balance FROM users WHERE accountNum = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, faccount);
            rs = ps.executeQuery();

            if (rs.next()) {
                double currentBalance = rs.getDouble("balance");

                if (currentBalance < amount) {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    out.write("{\"status\": \"error\", \"message\": \"Insufficient funds.\"}");
                    return;
                }

                double newFromBalance = currentBalance - amount;

                // Check if the target account exists
                query = "SELECT balance FROM users WHERE accountNum = ?";
                ps = conn.prepareStatement(query);
                ps.setString(1, tnumber);
                rs = ps.executeQuery();

                if (rs.next()) {
                    double targetBalance = rs.getDouble("balance");
                    double newTargetBalance = targetBalance + amount;

                    // Begin transaction
                    conn.setAutoCommit(false);

                    // Update the balance of the from account
                    query = "UPDATE users SET balance = ? WHERE accountNum = ?";
                    ps = conn.prepareStatement(query);
                    ps.setDouble(1, newFromBalance);
                    ps.setString(2, faccount);
                    ps.executeUpdate();

                    // Update the balance of the target account
                    query = "UPDATE users SET balance = ? WHERE accountNum = ?";
                    ps = conn.prepareStatement(query);
                    ps.setDouble(1, newTargetBalance);
                    ps.setString(2, tnumber);
                    ps.executeUpdate();

                    // Commit transaction
                    conn.commit();
                    conn.setAutoCommit(true);

                    out.write("{\"status\": \"success\", \"message\": \"Transfer successful.\"}");
                    dispatcher = request.getRequestDispatcher("transfer.jsp");
                } else {
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    out.write("{\"status\": \"error\", \"message\": \"Target account not found.\"}");
                }
            } else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.write("{\"status\": \"error\", \"message\": \"From account not found.\"}");
            }
            dispatcher.forward(request, response);
        } catch (Exception e) {
            try {
                if (conn != null) conn.rollback();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.write("{\"status\": \"error\", \"message\": \"" + e.getMessage() + "\"}");
        }
    }
}