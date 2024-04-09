package com.bank.registration;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/VerifyCode")
public class VerifyCode extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()){
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("authcode");

            String code = request.getParameter("authcode");

            if (code.equals(user.getCode())){
                response.sendRedirect("login.jsp");
            }else{
                out.println("Incorrect Verification code");
            }

        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        processRequest(request,response);
    }
}
