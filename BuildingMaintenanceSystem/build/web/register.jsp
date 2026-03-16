<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="navbar">
    <div class="brand">Building Maintenance System</div>
</div>

<div class="layout">
    <div class="sidebar">
        <h3>Features</h3>
        <a class="active" href="register.jsp">User Registration</a>
        <a href="login.jsp">User Login</a>
        <a href="payBill.jsp">Pay Maintenance</a>
        <a href="complaint.jsp">Raise Complaint</a>
        <a href="adminLogin.jsp">Admin Login</a>
    </div>

    <div class="main">
        <div class="page-title">User Registration</div>

        <div class="content-card">
            <form action="register" method="post">
                Full Name:
                <input type="text" name="full_name" required><br></br>

                Flat No:
                <input type="text" name="flat_no" required><br></br>

                Phone No:
                <input type="text" name="phone_no"><br></br>

                Email:
                <input type="email" name="email" required><br></br>

                Password:
                <input type="password" name="password" required><br></br>

                <input class="btn btn-success" type="submit" value="Register"><br></br>
            </form>
        </div>
    </div>
</div>

</body>
</html>
