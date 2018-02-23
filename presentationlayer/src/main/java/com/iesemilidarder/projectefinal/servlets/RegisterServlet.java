package com.iesemilidarder.projectefinal.servlets;

import com.iesemilidarder.projectozero.utils.SHA256;

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

public class RegisterServlet extends HttpServlet implements Servlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);

        String name = null;
        String email = null;
        String user = null;
        String password = null;
        String validate = null;

        name = request.getParameter("name");
        email = request.getParameter("email");
        user = request.getParameter("user");
        password = request.getParameter("password");
        validate = request.getParameter("password_validate");

        PrintWriter out = response.getWriter();

        try {

            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@35.205.41.45:1521:XE", "usuari", "usuari");

            String sql = "SELECT USU_CODI, USU_NOM, USU_PASSWORD FROM USUARIS WHERE USU_CODI ='"+user+"' OR USU_ADRECA_ELECTRONICA='"+email+"'";
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            // Checking if the username or the email are already registered
            if(rs.next()){
                response.sendRedirect("register.jsp?reg=E");
            }
            else{
                if(password.equals(validate)){

                    // Setting up a new user in the database
                    String insertUser = "INSERT INTO USUARIS (USU_CODI, USU_PASSWORD,USU_NOM, USU_ADRECA_ELECTRONICA) VALUES ('"+user+"','"+ SHA256.sha256(password)+"','"+name+"','"+email+"')";
                    PreparedStatement statement = con.prepareStatement(insertUser);
                    ResultSet resultSet = statement.executeQuery();
                    PreparedStatement commit = con.prepareStatement("COMMIT");
                    ResultSet rsCommit = commit.executeQuery();
                    response.sendRedirect("register.jsp?register=OK");

                }
                // It will pop up if the password and the validate password field are different
                else{
                    response.sendRedirect("register.jsp?passError=S");
                }
            }



        }catch (Exception e){
            out.println(e);
        }

        }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}

