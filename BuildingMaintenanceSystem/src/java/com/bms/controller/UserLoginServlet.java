package com.bms.controller;

import com.bms.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login")
public class UserLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM USERS_BMS WHERE email=? AND password=?"
            );
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                HttpSession session = request.getSession();
                session.setAttribute("userEmail", email);
                response.sendRedirect("userDashboard.jsp");
            } else {
                request.setAttribute("msg", "Invalid Email or Password");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

            con.close();

        } catch (Exception e) {
            response.getWriter().println("Error: " + e);
        }
    }
}
