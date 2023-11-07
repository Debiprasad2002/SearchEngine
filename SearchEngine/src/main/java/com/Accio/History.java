package com.Accio;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/History")
public class History extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response){

        Connection connection=DatabaseConnection.getConnection();
        try{
            ResultSet resultSet=connection.createStatement().executeQuery("select * from history;");
            ArrayList<HistoryResults> results=new ArrayList<>();
            while(resultSet.next()){
                HistoryResults historyResults=new HistoryResults();
                historyResults.setKeyword(resultSet.getString("keyword"));
                historyResults.setLink(resultSet.getString("link"));
                results.add(historyResults);
            }
            request.setAttribute("results",results);
            request.getRequestDispatcher("history.jsp").forward(request,response);
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

        }
        catch (SQLException sqlException){
            sqlException.printStackTrace();
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}