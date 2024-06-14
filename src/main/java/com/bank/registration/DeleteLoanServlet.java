package com.bank.registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/deleteLoan")
public class DeleteLoanServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accountNumStr = request.getParameter("accountNum");

        long accountNum;
        try {
            double accountNumDouble = Double.parseDouble(accountNumStr);
            accountNum = (long) accountNumDouble;
        } catch (NumberFormatException e) {
            request.setAttribute("status", "error");
            request.setAttribute("message", "Invalid account number format.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("loanrequest.jsp");
            dispatcher.forward(request, response);
            return;
        }

        Connection conn = null;
        PreparedStatement ps = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/bankdb?useSSL=false", "root", "");

            String query = "DELETE FROM loan WHERE accountNum = ?";
            ps = conn.prepareStatement(query);
            ps.setLong(1, accountNum);
            ps.executeUpdate();

            response.sendRedirect("loanrequest.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("status", "error");
            request.setAttribute("message", e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("loanrequest.jsp");
            dispatcher.forward(request, response);
        }
    }
}
