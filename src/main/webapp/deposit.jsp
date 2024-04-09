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
    <title>Deposit</title>
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
                <p class="title"><span>Deposit Form</span></p>
                <form action="withdraw" method="post">
                    <div class="column">
                        <label for="accountNum">Account Number</label>
                        <input type="number" id="accountNum" name="accountNum"/>
                        <label for="ahname">Account Name</label>
                        <input type="text" id="ahname" name="ahname" required/>
                    </div>
                    <div class="column">
                        <label for="phone">Mobile Number</label>
                        <input type="number" id="phone" name="phone" required/>
                        <label for="amount">Amount</label>
                        <input type="number" id="amount" name="amount" required/>
                    </div>
                    <div class="button">
                        <button type="submit">Deposit</button>
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
