package com.bms.controller;

import com.bms.util.DBConnection;
import java.io.IOException;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/testdb")
public class TestDBServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        try {
            Connection con = DBConnection.getConnection();
            if(con != null){
                response.getWriter().println("<h2>Oracle DB Connected ✅</h2>");
            } else {
                response.getWriter().println("<h2>Connection Failed ❌</h2>");
            }
        } catch (Exception e) {
            response.getWriter().println("<pre>" + e.getMessage() + "</pre>");
        }
    }
}
