<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Pay Maintenance</title>
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

</div>

<div class="layout">
    <div class="sidebar">
        <h3>User Menu</h3>
        <a href="userDashboard.jsp">User Dashboard</a>
        <a class="active" href="payBill.jsp">Pay Maintenance</a>
        <a href="complaint.jsp">Raise Complaint</a>
        <a href="logout">Logout</a>
    </div>

    <div class="main">
        <div class="page-title">Pay Maintenance</div>

        <div class="content-card">
            <form action="payBill" method="post">
                Bill ID:
                <input type="number" name="bill_id" required><br></br>

                User ID:
                <input type="number" name="user_id" required><br></br>

                Amount:
                <input type="number" name="amount" required><br></br>

                Mode:
                <select name="mode">
                    <option>UPI</option>
                    <option>CARD</option>
                    <option>CASH</option>
                </select><br></br>

                Transaction ID:
                <input type="text" name="txn_id" required><br></br>

                <input class="btn btn-success" type="submit" value="Pay Bill">
            </form>
        </div>
    </div>
</div>

</body>
</html>
