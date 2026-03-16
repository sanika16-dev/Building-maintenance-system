package com.bms.controller;

import com.bms.util.DBConnection;
import java.io.IOException;
import java.sql.CallableStatement;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/payBill")
public class PayBillServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int billId = Integer.parseInt(request.getParameter("bill_id"));
        int userId = Integer.parseInt(request.getParameter("user_id"));
        double amount = Double.parseDouble(request.getParameter("amount"));
        String mode = request.getParameter("mode");
        String txnId = request.getParameter("txn_id");

        try {
            Connection con = DBConnection.getConnection();

            CallableStatement cs = con.prepareCall("{call PROC_PAY_BILL(?,?,?,?,?)}");
            cs.setInt(1, billId);
            cs.setInt(2, userId);
            cs.setDouble(3, amount);
            cs.setString(4, mode);
            cs.setString(5, txnId);

            cs.execute();
            con.close();

            response.getWriter().println("<h2>Payment Successful ✅</h2>");

        } catch (Exception e) {
            response.getWriter().println("<h2>Payment Failed ❌</h2>");
            response.getWriter().println("<pre>" + e + "</pre>");
        }
    }
}
