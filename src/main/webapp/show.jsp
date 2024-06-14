<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.SQLException" %>

<%
    if(session.getAttribute("name") == null) {
        response.sendRedirect("login.jsp");
        return; // Ensure no further code is executed
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="./css/create-style.css"/>
    <link rel="shortcut icon" type="image/x-icon" href="./files/pics/logo.png"/>
    <title>Balance Display</title>
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

<header>
    <h1 onclick="window.location.href='index.jsp'">A.S.I.G bank</h1>
</header>
<main>
    <section>
        <div class="container">
            <div class="create">


                <%
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
                            request.setAttribute("balance", balance);
                            request.setAttribute("status", "success");
                        } else {
                            request.setAttribute("status", "error");
                            request.setAttribute("message", "Account not found.");
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                        request.setAttribute("status", "error");
                        request.setAttribute("message", e.getMessage());
                    }
                %>

                <div>
                    <%
                        String status = (String) request.getAttribute("status");
                        if ("success".equals(status)) {
                            Double balance = (Double) request.getAttribute("balance");
                    %>

                            <p class="title"><span>Your balance is: <%= balance %></span></p>
                    <%
                        } else {
                            String message = (String) request.getAttribute("message");
                    %>
                            <p>Error: <%= message %></p>
                    <%
                        }
                    %>
                </div>

                <p class="login">
                    <span>
                        <a href="index.jsp">Home Page</a>
                    </span>
                </p>
            </div>
        </div>
    </section>
</main>
</body>
</html>
