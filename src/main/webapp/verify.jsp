<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Verify Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        form {
            margin-top: 20px;
        }

        input[type="text"] {
            padding: 10px;
            width: 200px;
            margin-right: 10px;
            border-radius: 3px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        input[type="submit"] {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        span {
            display: block;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <span>We already sent a verification code to your email.</span>
    <form action="VerifyCode" method="post">
        <input type="text" name="authcode" placeholder="Enter verification code">
        <input type="submit" value="Verify">
    </form>
</div>
</body>
</html>
