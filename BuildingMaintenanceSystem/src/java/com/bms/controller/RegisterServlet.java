package com.bms.controller;

import com.bms.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("full_name");
        String flat = request.getParameter("flat_no");
        String phone = request.getParameter("phone_no");
        String email = request.getParameter("email");
        String pass = request.getParameter("password");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO USERS_BMS (USER_ID, FULL_NAME, FLAT_NO, PHONE_NO, EMAIL, PASSWORD) " +
                "VALUES (SEQ_USER_ID.NEXTVAL, ?, ?, ?, ?, ?)"
            );

            ps.setString(1, name);
            ps.setString(2, flat);
            ps.setString(3, phone);
            ps.setString(4, email);
            ps.setString(5, pass);

            ps.executeUpdate();

            con.close();

            response.sendRedirect("login.jsp");

        } catch (Exception e) {
            response.getWriter().println("Error: " + e);
        }
    }
}
