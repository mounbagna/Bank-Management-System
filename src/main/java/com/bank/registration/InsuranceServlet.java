package com.bank.registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

@WebServlet("/insurance")
public class InsuranceServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        String faccount = request.getParameter("faccount");
        String taccount = request.getParameter("taccount");
        String amountStr = request.getParameter("amount");
        String billPaymentType = request.getParameter("bill-payment");
        String email = request.getParameter("email");

        final String username = "abdellaabasse@iut-dhaka.edu";
        final String password = "kamikaze.10";
        Properties props = new Properties();
        props.put("mail.smtp.auth", true);
        props.put("mail.smtp.starttls.enable", true);
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

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
                query = "SELECT balance FROM bills WHERE accountNum = ?";
                ps = conn.prepareStatement(query);
                ps.setString(1, taccount);
                rs = ps.executeQuery();

                if (rs.next()) {
                    double targetBalance = rs.getDouble("balance");
                    double newTargetBalance = targetBalance + amount;



                    // Update the balance of the from account
                    query = "UPDATE users SET balance = ? WHERE accountNum = ?";
                    ps = conn.prepareStatement(query);
                    ps.setDouble(1, newFromBalance);
                    ps.setString(2, faccount);
                    ps.executeUpdate();

                    // Update the balance of the target account
                    query = "UPDATE bills SET balance = ? WHERE accountNum = ?";
                    ps = conn.prepareStatement(query);
                    ps.setDouble(1, newTargetBalance);
                    ps.setString(2, taccount);
                    ps.executeUpdate();

                    out.write("{\"status\": \"success\", \"message\": \"Insurance fee successfully paid.\"}");
                } else {
                    // Insert new target account
                    query = "INSERT INTO bills (AccountNum, Type, email, balance) VALUES (?, ?, ?, ?)";
                    ps = conn.prepareStatement(query);
                    ps.setString(1, taccount);
                    ps.setString(2, billPaymentType);
                    ps.setString(3, email);
                    ps.setDouble(4, amount);
                    ps.executeUpdate();

                    // Update the balance of the from account
                    query = "UPDATE users SET balance = ? WHERE accountNum = ?";
                    ps = conn.prepareStatement(query);
                    ps.setDouble(1, newFromBalance);
                    ps.setString(2, faccount);
                    ps.executeUpdate();

                }
            } else {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.write("{\"status\": \"error\", \"message\": \"From account not found.\"}");
            }
            // Execute the PreparedStatement
            ps.executeUpdate();
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
            MimeBodyPart textPart = new MimeBodyPart();
            Multipart multipart = new MimeMultipart();
            String final_Text = "Account Number: " + faccount + "    " + "Email: " + email + "    " + "Subject: " + "Insurance Payment" + "    " + "Amount Paid: " + amountStr;
            textPart.setText(final_Text);
            message.setSubject("Insurance Fee");
            multipart.addBodyPart(textPart);
            message.setContent(multipart);
            message.setSubject("Insurance Fee");
            Transport.send(message);

            out.println("<script>");
            out.println("alert('Email Sent Successfully. Thank you " + faccount + ", for banking with us.');");
            out.println("</script>");

            dispatcher = request.getRequestDispatcher("insurance.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.write("{\"status\": \"error\", \"message\": \"" + e.getMessage() + "\"}");
        }
    }
}
