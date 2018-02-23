<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="ca">
<head>
    <title>Login</title>
    <!-- Required meta tags -->
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

<%
    String logout = request.getParameter("logout");
    if (logout != null && logout.equals("S")) {
        session.invalidate();
    }
%>


<div>
    <form action="login" method="POST">
        <fieldset>
            <h2><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAIISURBVGhD7Zi9L0NRHIbrYyDtRCcGA7EYCIMIiYVIsBCJhMFi8QdIdBOj2BkkYjCQ+NiJwWA0+AskvroYSDQVSes5+ppo9N72OgfnSd7co72/9zwXjevGPB6Px+NxjXw+X0uGcrncCtlivWfCukOnuA2yVcjOkVvWn+D1XZ3qLnjWILpZUP4a3jdcsFwiCY26BYJr77YlwvlXpFPjboBQP8nJsWQYSZMm1dgHmSO5BYbZTdXYBZE4eZVXYJjNkHrV2QOJQTmFho5+1dkDiTH5hIaOadXZA4lJ+YSGjinV2QOProJOeLiQPtXZA49EQSc8XEiL6uyCyI2cAsPsE4dqVdkFmbOCVnCYPVeNfZBZlVdgmF1UjX2QaSNZuZUMM5cc6lTjBkjNk5Lvtzj1mrRq3C0QmyBpuRaFc05Js8bcBEFz77VAjsmj3I38A9knozr1d8E1JJCP60uP59/CZ8E8QWkns6yXOW6TQ2I+9CYH5jW9N0PaNeoGiPUgtUHuWAeCmVuyTrpV9/Ow+Qg5kVPZ0GV+asOqjx72TBLz5DAqTHdS20UDGwzwXfv2L3e5sMc9ieb/eIrHSUZ7RQ57PZPK3gVQ2EdetMePwZ5Z0iuN8qCokUT+61QMszdpkE54KAn0TDcKjIN0wkPJjvqsYRykEx5/IRWkUheSIh/3S7aSko7H4/H8CWKxN2ZU99ZN/mexAAAAAElFTkSuQmCC">
                Login d'usuaris</h2><br>

            <div class="form-group">
                <label>Nom d'usuari</label>
                <input name="user" class="form-control" aria-describedby="emailHelp" placeholder="Introdueix el teu nom d'usuari">
            </div>

            <div class="form-group">
                <label for="exampleInputPassword1">Contrasenya</label>
                <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Contrasenya">
            </div>


            <button type="submit" class="btn btn-primary">Enviar</button>
        </fieldset>
    </form><br>
    <%
        String log = request.getParameter("log");
        if (log != null && log.equals("E")) {
            out.println("<div class=\"alert alert-dismissible alert-danger\">\n" +
                    "<p> <img src=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAYAAAAeP4ixAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAATBSURBVGhD7ZpfaFZlHMenTi0xVmlUExdYYhnzQhhdWUEQOFHswnK7aUFMdGAmdjkh0RxsgSRKC6ybcGhdOJxaF6FU3mkX3vQHVDBdZKaikJG618/37Hs8W9te3/c857wb4he+POd8f8/z/T3P+56/z3OqHuB+RaFQqIMtAwMDn1Eeo+yH19guUN6Cl+Ev8AD8CL5OaIabjy/ozOPwfXhSHS4XtPsH9sCl7E6ybeVA0tkk74TXox4Btv+i2E/ZRvkqZS3lQ26iNjXwebiS2Fb4I7zFfgS2T8E32cx/QEoCW0n4t5MLOlSWszvV1UoG7WrhRnhGfoYOyxdcJXuQQP9C32CuaBC9sN7hIGBXjdfb8IK9b1C0OpwdMF4IzznJH3C5Q5kC+5l474QDzrWHotrhMGDWAOND6TuKpxzKDeTQeXTFOQ9STHMoHTCphxdt2BNsWAbItwj2O/fXFFMcKg801DkRH05fUkx2qGIg73Mw/iE/tlw6aDeJhodscJSiYv/E/0H+l6DuN8IKy6WBjrd6EDqxn7Q8bqAPa9yfi3CW5eKg4hPwkhvmcnVKA/oSXfopP7VUHFTsdINeS6mBx26sTohsL7acCnjMw+MG1HPbfMujgwp6droOheCbHR4/6EcR2F5mOTXw+MReeyyNDipscMXgf0PAJ+uBzIU3oe78j1oeCSr85KSZnBv4ZDoQAR/dIIXRH2Go8IyilDrRy34AHA05DaTJfoctDQexFlfYZykYOQ1kFrwN9dI28gcn0O2EbZaCgVfmAxHwOmXPkVdCxO8dfMVSMPDKayB77dlkKQHieQfnWAoGXnkNZIs92y0lQIwnCh62FAy88hrIent2WUrgwG3vZoIcB/KOPXdbSoB4U0HvZoIcBxI/RO6ylAAxeiMDNZaCkeNANtlzu6UEiD87uNBSMPDKayA77PmepQSIvQ6W9/JSBHi9hqWmj96lfMxyMPCLX/oaLSVA3ObgVksTEnRRb6/R6y+os5yAoOZiNZDjliYk6F+9+3na0nAQm0FQ78Z6cXna8oQDfWv3QMZ+UySoKR9V2mQpCPhoOlWz8OJqy6lB13RY/eY+jv0oRVCz4qqkudjgGT58hl611lpODTwa7XWWYuzJbgWpFD1ZghbLqZHDQI7ba52lsUG9Va58Hj5iORVorwuIppbEkVeYMoBXs/v1O7z38yB1tXRwzI12Wh5X0BXNesbTp6Wfa1R+EWrqRcjsBpkG9H3orOe3lksHjaIHM3CV7UzWQdKA3NvVCUqtSaab9aThFzbRcbnAcsVAzo3Or/tb+jdXPKZgED+Dad61waFcQTqdpx3Oqxt0+OGNyXT4lU3zWRIbAnJoliSe59V5+oZD4cBT/0wXjJfE+uCzDmcGPJthfHXSSsASh7IF/loS0zK0Eum41Vxs0P1BwGcpjG52AtvfUOS7xEcSTXR3w2iNnPI/eAiuZne2qxUF9XRJ1bJeO/xVPgLbF+BbrlYZkHA+/Bz+636oI5oB1MK/vmb4EK6HeqnSy9UHcAc8Av8cbDEI9s9CfWhw9wODioPk+qJBHdW/cvdLiHuBuqeh/tmX2a34+mRR0CEt/C+GTXAz1Gce6uwuYh2UG6DOh7lu8gD3Kaqq7gCoPi5J6hvQdwAAAABJRU5ErkJggg==\">" +
                    "   Error d'identificació d'usuari</p>" +
                    "</div>");
        }
    %>
    <br>


    <h2><img src="https://png.icons8.com/color/40/ffffff/question.png">
        No estas registrat?</h2><br>

    <a href="register.jsp"><button type="button" class="btn btn-warning">Fes-te un compte d'usuari!</button></a>

</div><br>






</body>
</html>
