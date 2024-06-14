package com.bank.balance;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;

@WebServlet("/balance")
public class BalanceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        String accountNum = request.getParameter("accountNum");

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/bankdb?useSSL=false", "root", "");

            // Check if the account exists and retrieve the balance
            String query = "SELECT balance FROM users WHERE accountNum = ?";
            ps = conn.prepareStatement(query);
            ps.setString(1, accountNum);

            rs = ps.executeQuery();

            if (rs.next()) {
                double balance = rs.getDouble("balance");
                out.write("{\"status\": \"success\", \"balance\": \"" + balance + "\"}");
                out.println("<a href='index.jsp'>Home Page</a>");
            } else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.write("{\"status\": \"error\", \"message\": \"Account not found.\"}");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.write("{\"status\": \"error\", \"message\": \"" + e.getMessage() + "\"}");
        }
    }
}
