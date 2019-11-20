// 
// Decompiled by Procyon v0.5.36
// 

package com.ratemyonlineclass.reviews.rateMyOnlineClass;

import java.io.IOException;
import javax.servlet.ServletException;
import java.sql.Statement;
import java.sql.Connection;
import java.text.DateFormat;
import java.sql.DriverManager;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet({"/WebApp" })
public class WebApp extends HttpServlet
{
    public void doPost( HttpServletRequest req,  HttpServletResponse resp) throws ServletException, IOException {
         String course = req.getParameter("courseName");
         String instructor = req.getParameter("instructorName");
         String university = req.getParameter("universityName");
         String satisfied = req.getParameter("satisfaction");
         String difficult = req.getParameter("difficulty");
         String year = req.getParameter("enrollYear");
         String grade = req.getParameter("gradeReceived");
         String exp = req.getParameter("describExp");
         String race = req.getParameter("race");
         String hispanic = req.getParameter("hisp");
         String country = req.getParameter("country");
         String age = req.getParameter("agegroup");
         String gender = req.getParameter("gender");
         String married = req.getParameter("married");
         String salary = req.getParameter("salary");
         String hours = req.getParameter("workHours");
         String children = req.getParameter("numOfChildren");
         String cpuSkill = req.getParameter("cpuSkill");
         String eduLevel = req.getParameter("eduLevel");
         String playSport = req.getParameter("playSport");
         String takeAnother = req.getParameter("anotherOnlineCourse");
         String learnStyle = req.getParameter("learningStyle");
         String learnPref = req.getParameter("learnPref");
         String consent = req.getParameter("consent");
         
         Date date = new Date();
         DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy");
         String timeStamp = dateFormat.format(date);
        try {
            Connection con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/RateMyOnlineClass", "postgres", "YellowJackets2k21");
             Statement stmt = con.createStatement();
             String sql = "INSERT INTO SURVEYENTRIES (COURSENAME, INSTRUCTORNAME, UNIVERSITYNAME, SATISFICATION, DIFFICULTY, ENROLLYEAR, GRADERECEIVED, DESCRIBEXP, STUDENTRACE, ISHISPANIC, COUNTRY, AGEGROUP, STUDENTGENDER, ISMARRIED, SALARY, WORKHOURS, TOTALCHILDREN, EDUCATIONLVL, TAKENCOURSE, WILLTAKECOURSE, LEARNINGPREF, LEARNINGSTYLE, CPUSKILL, AGREETOCONSENT, TIMESTAMP)VALUES('" + course + "','" + instructor + "','" + university + "','" + satisfied + "','" + difficult + "','" + year + "','" + grade + "','" + exp + "','" + race + "','" + hispanic + "','" + country + "','" + age + "','" + gender + "','" + married + "','" + salary + "','" + hours + "','" + children + "','" + cpuSkill + "','" + eduLevel + "','" + playSport + "','" + takeAnother + "','" + learnStyle + "','" + learnPref + "','" + consent + "','" + timeStamp + "');";
            stmt.executeUpdate(sql);
            stmt.close();
            con.close();
        }
        catch (Exception e2) {
            System.out.println(e2);
        }
    }
}
