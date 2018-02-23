package com.iesemilidarder.projectefinal.servlets;


import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class NewOpinionServlet extends HttpServlet implements Servlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);

        String user = null;
        String valoració = null;
        String opinio = null;
        String resCodi = null;

        user = request.getParameter("user");
        valoració = request.getParameter("valoracio");
        opinio = request.getParameter("opinio");
        resCodi = request.getParameter("codi");

        PrintWriter out = response.getWriter();

        try {

            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@35.205.41.45:1521:XE", "usuari", "usuari");

            // Crec que necessitare més dades per poder saber com fer els inserts de les opinions

            String insertOpinion = "INSERT INTO OPINIONS (OPI_OBSERVACIO, OPI_PUNTUACIO, OPI_RES_CODI, OPI_USU_CODI, OPI_OPINIO_REVISADA)" +
                                   "VALUES ('"+opinio+"','"+valoració+"','"+resCodi+"','"+user+"','N' )";





            PreparedStatement statement = con.prepareStatement(insertOpinion);
            ResultSet resultSet = statement.executeQuery();
            PreparedStatement commit = con.prepareStatement("COMMIT");
            ResultSet rsCommit = commit.executeQuery();
            response.sendRedirect("addOpinion.jsp?add=S");


        }catch (Exception e){
            out.println(e);
        }

    }




    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}

