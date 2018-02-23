package com.iesemilidarder.projectefinal.servlets;


import com.iesemilidarder.projectozero.utils.SHA256;
import com.iesemilidarder.projectozero.beans.User;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginServlet extends HttpServlet implements Servlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);



        String user = null;
        String password = null;
        user = request.getParameter("user");
        password = request.getParameter("password");

        PrintWriter out = response.getWriter();

        String securePass = SHA256.sha256(password);

        try {

            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@35.205.41.45:1521:XE", "usuari", "usuari");

            // Consulta a base de dades (encara s'ha de millorar)
            String sql = "SELECT USU_CODI, USU_NOM, USU_ADRECA_ELECTRONICA FROM USUARIS WHERE USU_CODI ='"+user+"' AND USU_PASSWORD='"+securePass+"'";
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

                if (rs.next()) {

                    // Prueba login mediante objeto usuario

                    User usuario = new User();

                    String code = rs.getString("USU_CODI");
                    String name = rs.getString("USU_NOM");
                    String email = rs.getString("USU_ADRECA_ELECTRONICA");

                    usuario.setId(code);
                    usuario.setName(name);
                    usuario.setEmail(email);


                    HttpSession sessio = request.getSession(true);
                    sessio.setAttribute("user", usuario);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    response.sendRedirect("index.jsp");

                } else {

                    response.sendRedirect("login.jsp?log=E");
                }

        }catch (Exception e){
            out.println(e);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}

