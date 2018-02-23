
package com.iesemilidarder.projectefinal.servlets;

import com.iesemilidarder.projectozero.utils.ReadDB;
import com.iesemilidarder.projectozero.beans.Restaurant;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class ShowRestaurantServlet extends HttpServlet implements Servlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Restaurant restau = null;
        String id = request.getParameter("id");
        restau = ReadDB.readRestaurantInfo(id);

        response.setContentType("text/html");
        request.setAttribute("restaurants", restau);
        request.getRequestDispatcher("showRestaurant.jsp").forward(request, response);
    }
}
