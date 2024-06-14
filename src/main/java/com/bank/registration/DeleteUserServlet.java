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

@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        Connection conn = null;
        PreparedStatement ps = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/bankdb?useSSL=false", "root", "");

            String query = "DELETE FROM users WHERE id = ?";
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();

            response.sendRedirect("adminIndex.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("status", "error");
            request.setAttribute("message", e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("adminLogin.jsp");
            dispatcher.forward(request, response);
        }
    }
}
