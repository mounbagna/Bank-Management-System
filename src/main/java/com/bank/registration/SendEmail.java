package com.bank.registration;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import java.util.Properties;
import java.util.Random;

public class SendEmail {
    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);

        return String.format("%06d", number);
    }

    public boolean sendEmail(User user, HttpServletRequest request) {
        boolean test = false;
        String toEmail = user.getEmail();

        //provide valid email address and password
        String fromEmail = "abassledesigner@gmail.com";
        String password = "fiqq rjbw nnwc onsz";
        try {
            Properties pr = new Properties();

            pr.put("mail.smtp.auth", true);
            pr.put("mail.smtp.starttls.enable", true);
            pr.put("mail.smtp.host", "smtp.gmail.com");
            pr.put("mail.smtp.port", "587");

            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }

            });
            Message mess = new MimeMessage(session);

            mess.setFrom(new InternetAddress(fromEmail));
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));

            mess.setSubject("User Email Verification And Account Number");

            String accountNumber = (String) request.getAttribute("accountNumber");

            mess.setText("Registered Successfully.\nPlease verify your account using this code: " + user.getCode() +
                    "\nThis is your account number: " + accountNumber);


            Transport.send(mess);

            test = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return test;
    }
}
