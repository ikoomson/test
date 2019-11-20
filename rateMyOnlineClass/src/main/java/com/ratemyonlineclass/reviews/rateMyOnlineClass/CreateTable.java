// 
// Decompiled by Procyon v0.5.36
// 

package com.ratemyonlineclass.reviews.rateMyOnlineClass;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;

public class CreateTable
{
    public static void main(final String[] args) {
        Connection c = null;
        Statement stmt = null;
        try {
            Class.forName("org.postgresql.Driver");
            c = DriverManager.getConnection("jdbc:postgresql://localhost:5432/RateMyOnlineClass", "postgres", "YellowJackets2k21");
            System.out.println("Opened database successfully");
            stmt = c.createStatement();
            final String sql = "CREATE TABLE SURVEYENTRIES (ID SERIAL PRIMARY KEY     NOT NULL, COURSENAME           VARCHAR    NOT NULL, INSTRUCTORNAME       VARCHAR    NOT NULL, UNIVERSITYNAME       VARCHAR    NOT NULL, SATISFICATION        VARCHAR    NOT NULL, DIFFICULTY\t       VARCHAR    NOT NULL, ENROLLYEAR\t       VARCHAR    NOT NULL, GRADERECEIVED\t       VARCHAR    NOT NULL, DESCRIBEXP\t       VARCHAR(500)    NOT NULL, STUDENTRACE          VARCHAR    NOT NULL, ISHISPANIC           VARCHAR    NOT NULL, COUNTRY\t           VARCHAR    NOT NULL, AGEGROUP\t           VARCHAR    NOT NULL, STUDENTGENDER        VARCHAR    NOT NULL, ISMARRIED            VARCHAR    NOT NULL, SALARY          \t   VARCHAR    NOT NULL, WORKHOURS            VARCHAR    NOT NULL, TOTALCHILDREN        VARCHAR    NOT NULL, EDUCATIONLVL         VARCHAR    NOT NULL, TAKENCOURSE          VARCHAR    NOT NULL, WILLTAKECOURSE       VARCHAR    NOT NULL, LEARNINGPREF\t       VARCHAR    NOT NULL, LEARNINGSTYLE        VARCHAR    NOT NULL, CPUSKILL\t\t       VARCHAR    NOT NULL, AGREETOCONSENT       VARCHAR    NOT NULL, TIMESTAMP\t\t       DATE    NOT NULL)";
            stmt.executeUpdate(sql);
            stmt.close();
            c.close();
        }
        catch (Exception e) {
            System.err.println(String.valueOf(e.getClass().getName()) + ": " + e.getMessage());
            System.exit(0);
        }
        System.out.println("Table created successfully");
    }
}
