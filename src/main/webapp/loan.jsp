<%
    if(session.getAttribute("name")==null){
        response.sendRedirect("login.jsp");
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
    <title>Create Account</title>
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

<header>
    <h1 onclick="window.location.href='index.jsp'">BANKIFY</h1>
</header>
<main>
    <section>
        <div class="container">
            <div class="create">
                <p class="title"><span>Request For Loan</span></p>
                <form action="loan" method="post">
                    <div class="column">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="email"/>
                        <label for="phone">Phone Number</label>
                        <input type="tel" id="phone" name="phone" pattern="[0-9]{4}[0-9]{3}[0-9]{4}"
                               placeholder="0999-888-7766" required/>
                        <label for="name">Username</label>
                        <input type="text" id="name" name="name" required/>
                    </div>
                    <div class="column">
                        <label for="amount">Amount</label>
                        <input type="number" id="amount" name="amount" required/>
                        <label for="accountNum">Account Number</label>
                        <input type="number" id="accountNum" name="accountNum" required
                               onkeyup="check()"/>
                        <label for="idpic">Description</label>
                        <textarea id="desc" name="desc"></textarea>

                    </div>
                    <div class="button">
                        <button type="submit">Loan</button>
                    </div>
                </form>

                <p class="login">
                    <span>
                        <a href="index.jsp">Home Page</a>
                    </span>
                </p>
            </div>
        </div>
    </section>
</main>

<script src="vendor/jquery/jquery.min.js"></script>
<script src="js/main.js"></script>
<script src="http://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">
<script type="text/javascript">
    var status = document.getElementById("status").value;
    if(status == "success"){
        swal("congrats","Account created successfully","success");
    }
</script>

</body>
</html>
