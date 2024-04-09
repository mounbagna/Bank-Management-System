<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Name Display</title>
</head>
<body>
<h1>Welcome, <%= session.getAttribute("name") %></h1>
</body>
</html>
