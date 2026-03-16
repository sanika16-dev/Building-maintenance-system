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

@WebServlet("/complaint")
public class ComplaintServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int userId = Integer.parseInt(request.getParameter("user_id"));
        String type = request.getParameter("type");
        String desc = request.getParameter("desc");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO COMPLAINT_BMS(complaint_id, user_id, complaint_type, description) VALUES(seq_complaint_id.NEXTVAL, ?, ?, ?)"
            );

            ps.setInt(1, userId);
            ps.setString(2, type);
            ps.setString(3, desc);

            ps.executeUpdate();
            con.close();

            response.getWriter().println("<h2>Complaint Submitted ✅</h2>");

        } catch (Exception e) {
            response.getWriter().println("<h2>Error ❌</h2>");
            response.getWriter().println("<pre>" + e + "</pre>");
        }
    }
}
