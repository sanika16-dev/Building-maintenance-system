<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<%
    if(session == null || session.getAttribute("admin") == null){
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%> 

<div class="form-box">
    <h2>Admin Dashboard</h2>
    <h1 style="text-align:center;">WELCOME TO THE ADMIN PAGE <h1><%= session.getAttribute("admin") %></h1></h1>

    <a class="btn btn-warning" href="viewPayments.jsp">View Payments</a>
    <a class="btn btn-warning" href="viewComplaints.jsp">View Complaints</a>
    <a class="btn btn-dark" href="logout">Logout</a>
</div>

</body>
</html>
