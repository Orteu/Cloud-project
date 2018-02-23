<%@ page import="com.iesemilidarder.projectozero.beans.User" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://bootswatch.com/4/flatly/bootstrap.min.css">

<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet">



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
</nav>

<main role="main">

    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
        <div class="container"><br><br>
            <h1 class="display-3">Cerca de Restaurants</h1>
            <h5>Troba el restaurant que encaixi amb el que et ve de gust en aquest moment!</h5>
            <p><a class="btn btn-primary btn-lg" href="test" role="button">Descobreix més</a></p>
        </div>
    </div>
