<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.bms.util.DBConnection"%>
<%
    if(session == null || session.getAttribute("admin") == null){
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Payments</title>
    <link rel="stylesheet" href="style.css">

</head>
<body>

<h2>All Payments</h2>

<table border="1" cellpadding="10">
    <tr>
        <th>Payment ID</th>
        <th>Bill ID</th>
        <th>User ID</th>
        <th>Amount</th>
        <th>Mode</th>
        <th>Txn ID</th>

    </tr>

<%
    try{
        Connection con = DBConnection.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM PAYMENT_BMS ORDER BY payment_id DESC");

        while(rs.next()){
%>
    <tr>
        <td><%= rs.getInt("payment_id") %></td>
        <td><%= rs.getInt("bill_id") %></td>
        <td><%= rs.getInt("user_id") %></td>
        <td><%= rs.getDouble("amount_paid") %></td>
        <td><%= rs.getString("payment_mode") %></td>
        <td><%= rs.getString("txn_id") %></td>
        <td><%= rs.getDate("payment_date") %></td>
    </tr>
<%
        }
        con.close();
    } catch(Exception e){
        out.println("Error: " + e);
    }
%>

</table>

</body>
</html>
