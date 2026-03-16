<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="navbar">
    <div class="brand">Building Maintenance System</div>
</div>

<div class="layout">
    <div class="sidebar">
        <h3>Admin</h3>
        <a class="active" href="adminLogin.jsp">Admin Login</a>
        <a href="index.jsp">Back to Home</a>
    </div>

    <div class="main">
        <div class="page-title">Admin Login</div>

        <div class="content-card">
            <%
                String msg = (String) request.getAttribute("msg");
                if(msg != null){
            %>
                <p class="msg-error"><%= msg %></p>
            <%
                }
            %>

            <form action="adminLogin" method="post">
                Username:
                <input type="text" name="username" required>

                Password:
                <input type="password" name="password" required>

                <input class="btn btn-dark" type="submit" value="Login">
            </form>
        </div>
    </div>
</div>

</body>
</html>
