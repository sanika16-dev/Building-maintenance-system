<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Login</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="navbar">
    <div class="brand">Building Maintenance System</div>
    <div class="nav-links">
        
    </div>
</div>

<div class="layout">
    <div class="sidebar">
        <h3>Features</h3>
        <a href="register.jsp">User Registration</a>
        <a class="active" href="login.jsp">User Login</a>
        <a href="payBill.jsp">Pay Maintenance</a>
        <a href="complaint.jsp">Raise Complaint</a>
        <a href="adminLogin.jsp">Admin Login</a>
        
    </div>

    <div class="main">
        <div class="page-title">User Login</div>

        <div class="content-card">

            <%
                String msg = (String) request.getAttribute("msg");
                if(msg != null){
            %>
                <p class="msg-error"><%= msg %></p>
            <%
                }
            %>

            <form action="login" method="post">
                Email:
                <input type="email" name="email" required>

                Password:
                <input type="password" name="password" required>

                <input class="btn btn-primary" type="submit" value="Login">
            </form>
        </div>
    </div>
</div>

</body>
</html>
