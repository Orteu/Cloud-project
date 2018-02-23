<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.iesemilidarder.projectozero.utils.ReadDB" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.iesemilidarder.projectozero.beans.Restaurant" %>
<%@ page import="java.util.Iterator" %>

<%
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
    }
%>

<!doctype html>
<html lang="ca">
<head>


    <title>Cercador de Restaurants</title>
    <jsp:include page="include/header.jsp"/>

    <div class="alert alert-dismissible alert-success">
        <button type="button" class="close" data-dismiss="alert">&times;</button>
        Aquesta web de cerca de restaurants ha estat creada per Carlos Saiz Orteu en un exercici a l'institut <strong><a target="_blank" href="http://www.iesemilidarder.com/web/">IES Emili Darder</a></strong>
        per l'assignatura IAW.
    </div><br>

    <div class="container">

            <%
            ReadDB readDB = new ReadDB();
            ArrayList arrayRestaurants = readDB.readRestaurant(request.getParameter("search"));
            Iterator itr = arrayRestaurants.iterator();
            while (itr.hasNext()) {
                Restaurant std = (Restaurant) itr.next();
		        out.println("<div class='row'>"+"<div class=\"col-md-4\">"+"<img class=\"img-fluid\" src=\""+std.getImages()+"\">"+"</div>"+
		            "<div class=\"col-md-8\">"+"<h3>"+std.getName()+"</h3>"+"<p>"+std.getAddress()+"</p>"+"<p>"+std.getNumero()+"</p>"+"<p><a href="+std.getWebsite()+">Pàgina web</a></p>"
		            +"<p>"+std.getType()+"</p>"+"<p>"+"Valoració de "+std.getMitjana()+ "<img src=\"https://png.icons8.com/color/40/ffffff/christmas-star.png\">" + "</p>"+"<a class=\"btn btn-primary btn-lg" +
		             "\" href=\"./restaurant?id="+std.getCode()+"\" role=\"button\">"+
		              "Més informació</a>"+"</div></div>");
}
%>




        </main>

        <div class="alert alert-dismissible alert-success">
            <footer class="container">
                <p align="center">Copyright by &copy; Carlos Saiz Orteu, all rights reserved</p>
            </footer>
        </div>





        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>
        <script src="js/modal.js"></script>
        </body>



</html>

