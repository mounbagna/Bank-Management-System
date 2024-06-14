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
    <title>Tuition</title>

       <style>
            body main section .container .create form .column select {
                border: 2px solid #3c486b;
                border-radius: 30px;
                background-color: #f0f0f0;
                font-family: "Noto Serif", serif;
                font-size: 16px;
                text-align: center;
                padding: 10px;
                margin-right: 50px;
                margin-left: 50px;
                appearance: none; /* Remove default arrow for custom styling */
                -webkit-appearance: none; /* Safari and Chrome */
                -moz-appearance: none; /* Firefox */
                position: relative;
            }

            /* Add a custom arrow */
            body main section .container .create form .column select::after {
                content: '\25BC'; /* Unicode character for down arrow */
                font-size: 16px;
                color: #3c486b;
                position: absolute;
                right: 15px;
                top: 50%;
                transform: translateY(-50%);
                pointer-events: none;
            }

            body main section .container .create form .column {
                position: relative; /* Ensure the custom arrow is positioned correctly */
            }
        </style>
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
                <p class="title"><span>Tuition Fee Payment Form</span></p>
                <form action="tuition" method="post">
                    <div class="column">
                        <label for="taccount">Target Account Number</label>
                        <input type="number" id="taccount" name="taccount"/>
                        <label for="faccount">From Account</label>
                        <input type="number" id="faccount" name="faccount" required/>
                        <label for="bill-payment">Select Bill Payment</label>
                                <select id="bill-payment" name="bill-payment">
                                    <option value="tuition">Tuition</option>
                                    <option value="creditcard">Credit Card</option>
                                    <option value="electricity">Electricity</option>
                                    <option value="mobile-recharge">Mobile Recharge</option>
                                    <option value="insurance-payment">Insurance Payment</option>
                                </select>
                    </div>
                    <div class="column">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" required/>
                        <label for="amount">Amount</label>
                        <input type="number" id="amount" name="amount" required/>
                    </div>
                    <div class="button">
                        <button type="submit">Pay</button>
                    </div>
                </form>

                <p class="login">
                    <span>
                        <a href="bill.jsp">Back</a>
                    </span>
                </p>
            </div>
        </div>
    </section>
</main>

<script type="text/javascript">
        var status = document.getElementById("status").value;
        if(status == "success"){
            swal("congrats","Account created successfully","success");
        }

        // JavaScript to autofill target account number based on selected bill payment
        document.getElementById('bill-payment').addEventListener('change', function() {
            var targetAccount = '';
            switch (this.value) {
                case 'tuition':
                    targetAccount = '4018123451300';
                    break;
                case 'creditcard':
                    targetAccount = '4018123452300';
                    break;
                case 'electricity':
                     targetAccount = '4018123453300';
                     break;
                case 'mobile-recharge':
                    targetAccount = '4018123454300';
                    break;
                case 'insurance-payment':
                    targetAccount = '4018123455300';
                    break;
            }
            document.getElementById('taccount').value = targetAccount;
        });
    </script>

</body>
</html>
