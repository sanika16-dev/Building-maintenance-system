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
    <title>View Complaints</title>
    <link rel="stylesheet" href="style.css">

</head>
<body>

<h2>All Complaints</h2>

<table border="1" cellpadding="10">
    <tr>
        <th>ID</th>
        <th>User ID</th>
        <th>Type</th>
        <th>Description</th>
        <th>Status</th>
        <th>Date</th>
    </tr>

<%
    try{
        Connection con = DBConnection.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM COMPLAINT_BMS ORDER BY complaint_id DESC");

        while(rs.next()){
%>
    <tr>
        <td><%= rs.getInt("complaint_id") %></td>
        <td><%= rs.getInt("user_id") %></td>
        <td><%= rs.getString("complaint_type") %></td>
        <td><%= rs.getString("description") %></td>
        <td><%= rs.getString("status") %></td>
        <td><%= rs.getDate("complaint_date") %></td>
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
