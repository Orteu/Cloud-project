<%--
  Created by IntelliJ IDEA.
  User: Carlos
  Date: 12/02/2018
  Time: 19:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registrar nou usuari</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://bootswatch.com/4/flatly/bootstrap.min.css">

    <!-- Custom styles for this template -->
    <link href="css/login.css" rel="stylesheet">
    <link rel="icon" type="image/png" href="https://icon-icons.com/icons2/881/PNG/512/Hamburger_icon-icons.com_68741.png" />
</head>
<body>

<div>
    <%
        String register = request.getParameter("register");
        if (register != null && register.equals("OK")){
            out.println("<div class=\"alert alert-dismissible alert-success\">\n" +
                    "  <button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>\n" +
                    "  <strong>Ben fet, has aconseguit registar-te, </strong><a href=\"login.jsp\" class=\"alert-link\">ara fes el teu primer login!</a>.\n" +
                    "  </div>");

        }
    %>
    <form action="register" method="POST">
        <fieldset>
            <h2><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAIISURBVGhD7Zi9L0NRHIbrYyDtRCcGA7EYCIMIiYVIsBCJhMFi8QdIdBOj2BkkYjCQ+NiJwWA0+AskvroYSDQVSes5+ppo9N72OgfnSd7co72/9zwXjevGPB6Px+NxjXw+X0uGcrncCtlivWfCukOnuA2yVcjOkVvWn+D1XZ3qLnjWILpZUP4a3jdcsFwiCY26BYJr77YlwvlXpFPjboBQP8nJsWQYSZMm1dgHmSO5BYbZTdXYBZE4eZVXYJjNkHrV2QOJQTmFho5+1dkDiTH5hIaOadXZA4lJ+YSGjinV2QOProJOeLiQPtXZA49EQSc8XEiL6uyCyI2cAsPsE4dqVdkFmbOCVnCYPVeNfZBZlVdgmF1UjX2QaSNZuZUMM5cc6lTjBkjNk5Lvtzj1mrRq3C0QmyBpuRaFc05Js8bcBEFz77VAjsmj3I38A9knozr1d8E1JJCP60uP59/CZ8E8QWkns6yXOW6TQ2I+9CYH5jW9N0PaNeoGiPUgtUHuWAeCmVuyTrpV9/Ow+Qg5kVPZ0GV+asOqjx72TBLz5DAqTHdS20UDGwzwXfv2L3e5sMc9ieb/eIrHSUZ7RQ57PZPK3gVQ2EdetMePwZ5Z0iuN8qCokUT+61QMszdpkE54KAn0TDcKjIN0wkPJjvqsYRykEx5/IRWkUheSIh/3S7aSko7H4/H8CWKxN2ZU99ZN/mexAAAAAElFTkSuQmCC">
                Crea un nou compte</h2><br>

            <div class="form-group">
                <label>Nom complet</label>
                <input name="name" class="form-control" aria-describedby="emailHelp" placeholder="Introdueix el teu nom complet">
            </div>

            <div class="form-group">
                <label>Correu electrònic</label>
                <input name="email" class="form-control" aria-describedby="emailHelp" placeholder="Introdueix el teu email">
            </div>

            <div class="form-group">
                <label>Nom d'usuari</label>
                <input name="user" class="form-control" aria-describedby="emailHelp" placeholder="Introdueix el teu nom d'usuari">
            </div>

            <div class="form-group">
            <label for="exampleInputPassword1">Contrasenya</label>
            <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Contrasenya">
        </div>

        <div class="form-group">
             <label for="exampleInputPassword1">Validació de contrasenya</label>
             <input name="password_validate" type="password" class="form-control" placeholder="Repeteix la contrasenya">
        </div>


            <button type="submit" class="btn btn-warning">Registrar nou usuari</button>
        </fieldset>
    </form><br>


    <!-- Code for checking if the user already exists or if both password and validate are not equal -->
    <%
        String reg = request.getParameter("reg");
        String passError= request.getParameter("passError");
        if(reg != null && reg.equals("E")){
            out.println("<div class=\"alert alert-dismissible alert-danger\">\n" +
                    "<p>Usuari o correu electrònic ja registrat, prova amb un altre!</p>" +
                    "</div>");
        }
        else if(passError != null && passError.equals("S")){
            out.println("<div class=\"alert alert-dismissible alert-danger\">\n" +
                    "<p>Les dues contrasenyes no coincideixen!</p>" +
                    "</div>");
        }
    %>


</div><br>

</body>
</html>
