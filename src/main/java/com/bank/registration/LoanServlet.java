package com.bank.registration;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.mindrot.jbcrypt.BCrypt;


import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Properties;
import java.util.Random;

@WebServlet("/loan")
public class LoanServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String name = request.getParameter("name");
        String amountStr = request.getParameter("amount");
        String accountNum = request.getParameter("accountNum");
        String desc = request.getParameter("desc");
        double amount = Double.parseDouble(amountStr);

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

        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/bankdb?useSSL=false", "root", "");
            PreparedStatement pst = conn.prepareStatement("INSERT INTO loan(email,  phone, name,amount, accountNum,description) VALUES (?, ?, ?, ?, ?, ?)");
            pst.setString(1, email);
            pst.setString(2, phone);
            pst.setString(3, name);
            pst.setDouble(4, amount);
            pst.setString(5, accountNum);
            pst.setString(6, desc);

            // Execute the PreparedStatement
            pst.executeUpdate();
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(email));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(username));
            MimeBodyPart textPart = new MimeBodyPart();
            Multipart multipart = new MimeMultipart();
            String final_Text = "Name: " + name + "    " + "Email: " + email + "    " + "Subject: " + "Loan Request" + "    " + "Description: " + desc;
            textPart.setText(final_Text);
            message.setSubject("Loan Request");
            multipart.addBodyPart(textPart);
            message.setContent(multipart);
            message.setSubject("Loan Request");
            Transport.send(message);

            out.println("<script>");
            out.println("alert('Email Sent Successfully. Thank you " + name + ", your message has been submitted to us.');");
            out.println("window.location.href='loan.jsp';");
            out.println("</script>");



        } catch (Exception e) {
            e.printStackTrace();
            // Handle any exceptions
            out.println("<center><h2 style='color:red;'>Error occurred while processing your request.</h2>");
            out.println("Please try again later.</center>");
            out.println("<p><span><a href='loan.jsp'>Home Page</a></span></p>");
        }
    }
}
