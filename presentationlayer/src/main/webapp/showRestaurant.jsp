<%@page import="com.iesemilidarder.projectozero.beans.Restaurant" %>
<%@page import="com.iesemilidarder.projectozero.utils.ReadDB" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.iesemilidarder.projectozero.beans.Opinio" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
    }
%>

<html>
<head>
    <title>Cercador de Restaurants</title>


    <jsp:include page="include/header.jsp"></jsp:include>



    <div class="alert alert-dismissible alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        <center>Informació detallada sobre el restaurant
            <%
                Restaurant rest1 = (Restaurant) request.getAttribute("restaurants");
                out.println("<strong> "+rest1.getName()+"</strong>");

            %>
        </center>
    </div><br>

        <%
        out.println("<br><div><h2>"+rest1.getName()+"</h2><h4>"+rest1.getAddress()+"</h4></div><br>"+"<div>\n" +
                "<div class=\"centrar\"><img src=\" "+rest1.getImages()+"\" height=\"455px\" width=\"60%\"><br>"+
                "<br><table class=\"table table-hover\">" +
                    "<thead>" +
                        "<tr>"+
                            "<th scope=\"col\">Tipus de restaurant</th>"+
                            "<th scope=\"col\">"+rest1.getType()+"</th>"+
                        "</tr>"+
                    "</thead>"+

                    "<tbody>"+
                        "<tr class=\"table-active\">"+
                            "<th scope=\"row\">Puntuació</th>"+
                            "<td>"+rest1.getMitjana()+"</td>"+
                        "</tr>"+
                        "<tr>"+
                            "<th scope=\"row\">Telèfon de contacte</th>"+
                            "<td>"+rest1.getNumero()+"</td>"+
                        "</tr>"+
                        "<tr class=\"table-active\">"+
                            "<th scope=\"row\">Adreça del restaurant</th>"+
                            "<td>"+rest1.getAddress()+"</td>"+
                        "</tr>"+
                        "<tr>"+
                            "<th scope=\"row\">Lloc web oficial</th>"+
                            "<td><a target=\"_blank\" href=\""+rest1.getWebsite()+"\">"+rest1.getWebsite()+"</a></td>"+
                        "</tr>"+
                    "</tbody>"+
                "</table>"+
                "</div>"+

                "<br><div><center>"+
                "<a target=\"_blank\" class=\"btn btn-primary btn-lg" +
                "\" href=\"addOpinion.jsp?rest="+rest1.getCode()+"\" role=\"button\">Afegeix una opinió!</a>"+
                "</center></div><br><br>");




    %>

    <div class="alert alert-dismissible alert-success">
        <center>Opinions dels nostres clients </center>
    </div><br>


        <%
        ReadDB llegir = new ReadDB();
        List arrayOpinions = llegir.readOpinions(request.getParameter("id"));
        Iterator itr = arrayOpinions.iterator();
        while(itr.hasNext()){
            Opinio op1 = (Opinio) itr.next();
            out.println("<table class=\"table table-hover\">" +
                    "<thead>" +
                    "<tr>"+
                    "<th scope=\"col\">Valoració </th>"+
                    "<th scope=\"col\">Usuari </th>"+
                    "<th scope=\"col\"><center>Observació del client</center></th>"+
                    "</tr></thead>"+
                    "<tbody>"+
                    "<tr class=\"table-active\">"+
                    "<th scope=\"row\"><center>"+op1.getPuntuacio()+" ★</center></th>"+
                    "<td>"+op1.getUser()+"</td>"+
                    "<td>"+op1.getOpinio()+"</td>"+

                    "</tr>"+
                    "</tbody>"+"</table>");
            }
    %>

    <%
        if (session.getAttribute("user") != null) {
            out.println("");
        }
    %>


    </main>
    <div class="alert alert-dismissible alert-success">
        <footer class="container">
            <p align="center">Copyright by &copy; Carlos Saiz Orteu, all rights reserved</p>
        </footer>
    </div>
    <script src="js/modal.js"></script>

    </body>
</html>
