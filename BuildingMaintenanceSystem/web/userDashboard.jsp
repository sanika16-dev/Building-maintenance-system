<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String email = (String) session.getAttribute("user");

    if(email == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="navbar">
    <div class="brand">Building Maintenance System</div>
</div>

<div class="layout">

   
    <div class="sidebar">
        <h3>Features</h3>
        <a href="register.jsp">User Registration</a>
        <a href="login.jsp">User Login</a>
        <a href="payBill.jsp">Pay Maintenance</a>
        <a href="complaint.jsp">Raise Complaint</a>
        <a href="adminLogin.jsp">Admin Login</a>
    </div>

   
    <div class="main">

        <div class="page-title">User Dashboard</div>

        <div class="content-card">

            <h3>Welcome User</h3>
            <p><strong>Email:</strong> <%= email %></p>

            <br>

            <a class="btn btn-success" href="payBill.jsp">Pay Maintenance</a>
            <br><br>

            <a class="btn btn-success" href="complaint.jsp">Raise Complaint</a>
            <br><br>

            <a class="btn btn-danger" href="logout">Logout</a>

        </div>

    </div>
</div>

</body>
</html>
