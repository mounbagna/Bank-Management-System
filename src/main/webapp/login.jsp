<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <link rel="stylesheet" href="./css/login-style.css"/>
  <link rel="shortcut icon" type="image/x-icon" href="./files/pics/logo.png"/>
  <title>Login Page</title>
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

<header>
  <h1 onclick="window.location.href='index.html'">BANKIFY</h1>
</header>
<main>
  <section>
    <div class="container">
      <div class="login">
        <p class="title"><span>Login to your Account</span></p>
        <form action="login" method="post">
          <label for="username">Username</label>
          <input type="text" id="username" name="name" required/>
          <label for="password">Password</label>
          <input type="password" id="password" name="password" required/>
          <button type="submit">Login</button>
        </form>
        <p class="password">
          <span><a href="forget.html">Forget password</a></span>
        </p>
        <p class="create">
                    <span>Want to Create an Account?
                        <a href="registration.jsp">Click here</a>
                    </span>
        </p>
        <p class="create">
                            <span>Login-In as Administrator?
                                <a href="adminLogin.jsp">Click here</a>
                            </span>
                </p>
        <p class="create">
        <span><a href="index.jsp">Home Page</a></span>
        </p>

      </div>
    </div>
  </section>
</main>

<script src="vendor/jquery/jquery.min.js"></script>
<script src="js/main.js"></script>
<script src="validation.js"></script>
<script src="http://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">
<script type="text/javascript">
  var status = document.getElementById("status").value;
  if (status === "success") {
    swal("Congrats", "Account created successfully", "success");
  }

  // Attach validation to the form
  const form = document.getElementById("createAccountForm");
  attachValidation(form);
</script>

</body>
</html>
