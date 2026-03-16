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

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String uname = request.getParameter("username");
        String pass = request.getParameter("password");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM ADMIN_BMS WHERE username=? AND password=?"
            );

            ps.setString(1, uname);
            ps.setString(2, pass);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                HttpSession session = request.getSession();
                session.setAttribute("admin", uname);
                response.sendRedirect(request.getContextPath() + "/adminDashboard.jsp");

            } else {
                request.setAttribute("msg", "Invalid Admin Login");
                request.getRequestDispatcher("adminLogin.jsp").forward(request, response);
            }

            con.close();

        } catch (Exception e) {
            response.getWriter().println("Error: " + e);
        }
    }
}
