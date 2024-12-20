<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <link rel="stylesheet" href="./css/create-style.css"/>
  <link rel="shortcut icon" type="image/x-icon" href="./files/pics/logo.png"/>
  <title>Admin Create Account</title>
</head>
<body>
<input type="hidden" id="status" value="<%= request.getAttribute("status") %>">

<header>
  <h1 onclick="window.location.href='index.html'">BANKIFY</h1>
</header>
<main>
  <section>
    <div class="container">
      <div class="create">
        <p class="title"><span>Create your Account</span></p>
        <form action="adminregister" method="post">
          <div class="column">
            <label for="email">Email Address</label>
            <input type="email" id="email" name="email"/>

            <label for="name">Username</label>
            <input type="text" id="name" name="name" required/>
          </div>
          <div class="column">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required/>

          </div>
          <div class="button">
            <button type="submit">Create Account</button>
          </div>
        </form>

        <p class="login">
                    <span>Already have an Account?
                        <a href="login.jsp">Click here to login</a>
                    </span>
        </p>
        <p class="login">
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
