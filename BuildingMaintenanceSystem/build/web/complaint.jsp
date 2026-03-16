<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Raise Complaint</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<%
    if(session == null || session.getAttribute("userEmail") == null){
        response.sendRedirect("login.jsp");
        return;
    }
%>

<div class="navbar">
    <div class="brand">Building Maintenance System</div>
    <div class="nav-links">
        <a href="index.jsp">Home</a>
        <a href="userDashboard.jsp">Dashboard</a>
        <a href="logout">Logout</a>
    </div>
</div>

<div class="layout">
    <div class="sidebar">
        <h3>User Menu</h3>
        <a href="userDashboard.jsp">User Dashboard</a>
        <a href="payBill.jsp">Pay Maintenance</a>
        <a class="active" href="complaint.jsp">Raise Complaint</a>
        <a href="logout">Logout</a>
    </div>

    <div class="main">
        <div class="page-title">Raise Complaint</div>

        <div class="content-card">
            <form action="complaint" method="post">

                <strong>User ID</strong>
                <input type="number" name="user_id" required><br><br>

                <strong>Complaint Type</strong>
                <select name="type">
                    <option>Water</option>
                    <option>Lift</option>
                    <option>Electricity</option>
                    <option>Security</option>
                </select><br><br>

                <strong>Description</strong>
                <textarea name="desc" rows="4"></textarea><br><br>

                <input class="btn btn-success" type="submit" value="Submit Complaint">

            </form>
        </div>
    </div>
</div>

</body>
</html>
