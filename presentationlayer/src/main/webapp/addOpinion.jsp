<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.iesemilidarder.projectozero.beans.User" %>

<%
    /**
    if (session.getAttribute("user") == null) {
        response.sendRedirect("login.jsp");
    }
    **/
%>

<!doctype html>
<html lang="ca">
    <head>
        <title>Afegeix la teva opinió</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://bootswatch.com/4/flatly/bootstrap.min.css">

        <!-- Custom styles for this template -->
        <link href="css/opinions.css" rel="stylesheet">
        <!-- Favicon -->
        <link rel="icon" type="image/png" href="https://icon-icons.com/icons2/881/PNG/512/Hamburger_icon-icons.com_68741.png" />

    </head>
    <body>



    <!-- Navigation bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <a class="navbar-brand" href="index.jsp"><img src="https://i1.wp.com/blueashchili.com/wp-content/uploads/2017/06/logo-FootNetwork.png" height="90px"></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Inici <span class="sr-only">(current)</span></a>
                </li>
                <%
                    User usuario = (User) session.getAttribute("user");

                    if (usuario != null) {
                        out.println("<li class=\"nav-item active\"><a class=\"nav-link\">"+ usuario.getEmail() + "</a></li>");
                        out.println("<a class=\"nav-link\" href=\"login.jsp?logout=S\">Logout <span class=\"sr-only\">Logout</span></a>");

                    }
                %>

            </ul>




            <button id="myBtn" class="btn btn-outline-success my-2 my-sm-0">Perfil</button>



            <div id="myModal" class="modal">
                <!-- Modal content -->
                <div class="modal-content">
                    <div class="modal-header">
                        <span class="close">&times;</span>
                    </div>

                    <!-- Java code for the modal box info-->
                    <%

                        out.println("<h5>Informació d'usuari:</h5>");
                        out.println("<p>Nom: "+ usuario.getName() + "</p>");
                        out.println("<p>Email: "+ usuario.getEmail() + "</p>");


                    %>
                </div>
            </div>

            <form class="form-inline my-lg-0" action="index.jsp" method="GET">
                <input name="search" class="form-control mr-sm-2" type="text" placeholder="Cercar" aria-label="Cercar">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Cercar</button>
            </form>

        </div>
    </nav><br>

    <%
        String add = request.getParameter("add");

        if (add != null && add.equals("S")){
            out.println("<div class=\"alert alert-dismissible alert-success\">\n" +
                    "  <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n" +
                    "  <strong>La teva opinió ha estat afegida! </strong><a href=\"index.jsp\" class=\"alert-link\">Fes click aquí per tornar a la pàgina principal.</a>.\n" +
                    "  </div>");

        }

    %>

    <div>
        <form action="opinion" method="POST">
            <fieldset>
                <legend>La teva opinió ens importa</legend>

                <div class="form-group row">
                    <label for="staticEmail" class="col-sm-2 col-form-label">Codi del restaurant</label>
                    <div class="col-sm-10">
                        <input name="codi" type="text" type="hidden" readonly="" class="form-control-plaintext"
                               value="<% out.println(""+request.getParameter("rest")+"");%>">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="staticEmail" class="col-sm-2 col-form-label">Usuari</label>
                    <div class="col-sm-10">
                        <input name="user" type="text" readonly="" class="form-control-plaintext"
                               id="staticEmail" value="<% out.println(""+usuario.getId()+"");%>">
                    </div>
                </div>

                <div class="form-group">
                    <label for="exampleSelect1">Valoració del restaurant</label>
                    <select name="valoracio" class="form-control" id="exampleSelect1">
                        <option>1</option>
                        <option>2</option>
                        <option>3</option>
                        <option>4</option>
                        <option>5</option>
                        <option>6</option>
                        <option>7</option>
                        <option>8</option>
                        <option>9</option>
                        <option>10</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="exampleTextarea">Comentari personal sobre el retaurant</label>
                    <textarea name="opinio" class="form-control" id="exampleTextarea" rows="3"></textarea>
                </div>

                <button type="submit" class="btn btn-primary">Submit</button>

            </fieldset>
        </form>
    </div>



    <!-- Footer of the website -->
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

