// 
// Decompiled by Procyon v0.5.36
// 

package com.ratemyonlineclass.reviews.rateMyOnlineClass;

import java.io.IOException;
import javax.servlet.ServletException;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.text.DateFormat;
import java.sql.DriverManager;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet({ "/SurveyResponses" })
public class SurveyResponses extends HttpServlet
{
    public void doGet(final HttpServletRequest req, final HttpServletResponse resp) throws ServletException, IOException {
        final String qSearchVariable = req.getParameter("yesQuick");
        final Date date = new Date();
        final DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
        final String timeStamp = dateFormat.format(date);
        try {
            final Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/RateMyOnlineClass", "postgres", "YellowJackets2k21");
            final String sql = "SELECT FROM SURVEYENTRIES (COURSENAME, INSTRUCTORNAME, UNIVERSITYNAME, SATISFICATION, DIFFICULTY, ENROLLYEAR, GRADERECEIVED, DESCRIBEXP) WHERE COURSENAME LIKE ?";
            final PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, "%" + qSearchVariable + "%");
            stmt.executeQuery();
            stmt.close();
            con.close();
        }
        catch (Exception e2) {
            System.out.println(e2);
        }
    }
}
