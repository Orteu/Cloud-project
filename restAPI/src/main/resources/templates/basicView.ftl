<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/css/bootstrap.min.css"
          integrity="sha384-Zug+QiDoJOrZ5t4lssLdxGhVrurbmBWopoEl+M6BdEfwnCJZtKxi1KgxUyJq13dy" crossorigin="anonymous">
    <title>${title!""}</title>

    <link rel="icon" type="image/png" href="https://icon-icons.com/icons2/881/PNG/512/Hamburger_icon-icons.com_68741.png" />


    <!-- Navbar and footer Bootstrap CSS -->
    <link rel="stylesheet" href="https://bootswatch.com/4/flatly/bootstrap.min.css">



</head>
<body>

<!-- Custom navbar -->

<nav class="navbar navbar-expand-lg navbar-dark bg-primary" style="height: 70px">
    <a class="navbar-brand" href="index.jsp"><img src="https://i1.wp.com/blueashchili.com/wp-content/uploads/2017/06/logo-FootNetwork.png" height="90px"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp">Inici <span class="sr-only">(current)</span></a>
            </li>
        </ul>

        <form class="form-inline my-lg-0" action="index.jsp" method="GET">
            <input name="search" class="form-control mr-sm-2" type="text" placeholder="Cercar" aria-label="Cercar">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Cercar</button>
        </form>

    </div>
</nav>

<br/><br/><main role="main" class="container">
    <div class="row featurette">
        <div class="col-md-7">
            <h2 class="featurette-heading">${subtitle!""}
                <br/><span class="text-muted">Restaurantes de nuestra base de datos: </span>
            </h2>
        </div>
    </div>
<#if posts??>
    <div class="row center mt-2">
        <#list posts as item>
            <div class="col-md-3">
                <div class="media mt-5 ml-5">
                    <img class="align-self-start mr-3 rounded-circle"
                         src="${item.images!""}"
                         width="100" height="100">
                    <div class="media-body">
                        <h5 class="mt-0">${item.name!""}</h5>
                        <p>Tipus: ${item.type!""}</p>
                        <p>Valoració: ${item.mitjana!""}</p>
                    </div>
                </div>
            </div>
        </#list>
    </div>
</#if>
</main>


<br/><br/><div class="alert alert-dismissible alert-success" style="background-color: #2c3e50;">
    <footer class="container">
        <p align="center">Copyright by &copy; Carlos Saiz Orteu, all rights reserved</p>
    </footer>
</div>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.3/js/bootstrap.min.js"
        integrity="sha384-a5N7Y/aK3qNeh15eJKGWxsqtnX/wWdSZSKp+81YjTmS15nvnvxKHuzaWwXHDli+4"
        crossorigin="anonymous"></script>
</body>
</html>