// 
// Decompiled by Procyon v0.5.36
// 

package com.ratemyonlineclass.reviews.rateMyOnlineClass;

import java.io.IOException;
import javax.servlet.ServletException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Connection;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.sql.DriverManager;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet({ "/SearchDatabase" })
public class SearchDatabase extends HttpServlet
{
    public void doGet(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException {
        final PrintWriter out = resp.getWriter();
        final String id = req.getParameter("id");
        out.print("<html><br><center><h1>Search for Online course reviews</h1></center></br></html>");
        out.print("<table><tr><th>Review #</th><th>Course Name</th><th>Instructor Name</th><th>University Name</th><th>Satisfaction</th><th>Difficulty</th><th>Year Enrolled</th><th>Grade Received</th><th>Description of Learning Experience</th></tr>");
        try {
            final Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/RateMyOnlineClass", "postgres", "YellowJackets2k21");
            final Statement stmt = con.createStatement();
            final String sql = "SELECT * FROM SURVEYENTRIES where coursename='" + id + "' ";
            final ResultSet rs = stmt.executeQuery(sql);
            final ArrayList<Integer> rlist = new ArrayList<Integer>();
            while (rs.next()) {
                out.println("<tr><td>");
                final int i = rs.getInt("id");
                final String in = rs.getString("instructorname");
                System.out.println(String.valueOf(i) + in);
                stmt.close();
                con.close();
            }
        }
        catch (Exception e2) {
            System.out.println("No records were found");
        }
        out.print("</table>");
    }
}
