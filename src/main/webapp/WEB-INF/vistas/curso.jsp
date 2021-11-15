<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="command" class="ar.edu.unlam.tallerweb1.modelo.Alumno" scope="request"></jsp:useBean>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">

    <title>Cursos</title>
</head>
<body class="fondoVerde pb-5" style="min-height: 100vh;">
    <!-- Navbar -->
    <nav class="container-fluid navbar navbar-expand-lg navbar-dark bg-dark " style="min-height: 80px">
    <div class="container-fluid">
        <a class="navbar-brand me-auto ms-lg-2 ms-3 text-uppercase fw-bold mr-5" href="home"> candoIt</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#topNavBar"
                aria-controls="topNavBar" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse ml-5 justify-content-end" id="topNavBar">
            <ul class="navbar-nav">
                <li class="nav-item ml-3 ">
                    <a href="home" id="botones" class="rounded px-3 py-1 text-white text-uppercase text-decoration-none font-weight-bold" aria-current="page">
                        Home
                    </a>
                </li>
                <a href="#" id="botones" class="rounded px-3 py-1 text-white text-uppercase text-decoration-none font-weight-bold" aria-current="page">
                    Alumnos
                </a>
                </li>
                <li class="nav-item mx-3">
                    <a href="#" id="botones" class="rounded px-3 py-1 text-uppercase text-white text-decoration-none font-weight-bold" aria-current="page">
                        Cursos
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
    <!--Fin Navbar -->
    <main class="container-fluid w-100" style="max-width: 1440px">
        <div class="row my-3 p-0 pb-3 bg-body rounded shadow-sm justify-content-center justify-content-lg-around">

            <!--Titulo -->
            <div class="d-flex align-items-center p-3 my-3 mt-0 text-dark fondo-login rounded shadow-sm align-items-center align-content-center">
                <i class="fas fa-book ext-danger me-3  accordion-collapse fa-2x text-white " width="48" height="38"></i>
                <div class="lh-1 text-white">
                    <h1 class="h6 mb-0 lh-1  ">${cursoActual.nombreCurso}</h1>
                </div>
            </div>

            <!--Boton Agregar alumno a la materia -->
            <div class="col-12 d-inline-flex align-items-center justify-content-center rounded py-2 mx-5" style="width: 100%;">
                <button type="button" class="btn btn-success text-gradient px-3 mb-0 " data-bs-toggle="modal" data-bs-target="#exampleModalAgregarAlumnoACurso">
                    <span class="fw-bolder text-white mr-2">Agregar Alumno/a</span>
                    <i class="fas fa-plus-circle text-white" aria-hidden="true"></i>
                </button>
            </div>


            <c:if test=" ${ empty listaAlumnosConCurso}">
                <div class="fondo-login col-12 text-center text-white align-items-center py-1 mt-2">
                    <p class="m-0">¡No hay alumno en el Curso!</p>
               </div>
            </c:if>

            <!--Lista De Alumnos -->
            <c:forEach items="${listaAlumnosConCurso}" var="alumno" >
                <div class="col-12 d-flex col-md-6 col-lg-4 align-items-center mt-5 sombra rounded" style="min-height: 100px;max-width: 400px;">
                    <div class="symbol symbol-100 mr-2">
                        <img class="symbol-label" src="imagenes/perfil.png" width="110" height="100"/>
                        <i class="symbol-badge bg-success"></i>
                        <a href="alumno?alumno=${alumno.id}">perfil</a>
                    </div>
                    <div class="d-flex flex-column">
                        <a href="#" class=" text-decoration-none text-dark font-weight-bold font-size-h5 text-dark-75 text-hover-primary">${alumno.nombre} ${alumno.apellido}</a>
                        <div class="text-muted mt-1">Edad: ${alumno.edad}</div>
                        <div class="navi mt-1">
                            <a href="#" class="navi-item text-decoration-none">
						<span class="navi-link p-0 pb-2">
							<span class="navi-text text-muted text-hover-primary">${alumno.id}</span>
						</span>
                            </a>
                        </div>
                    </div>
                    <div class="d-flex flex-column w-100 align-items-center">
                        <form:form action="quitarAlumnoDelCurso" method="POST">
                            <button type="button" class="btn btn-link text-danger text-gradient px-3 mb-0 " data-bs-toggle="modal" data-bs-target="#exampleModalQuitarAlumno${alumno.id}">
                                <i class="fas fa-trash-alt me-2 fs-4 fa-2x" aria-hidden="true"></i>
                            </button>

                            <!-- Modal Quitar Alumno-->
                            <div class="modal fade" id="exampleModalQuitarAlumno${alumno.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header fondo-login">
                                            <h5 class="modal-title text-white" id="exampleModalLabel">¡Estas a punto de Quitar un Alumno!</h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="mb-5 mt-5 text-center">
                                                <h5> ¿Estas seguro/a de <span class="text-uppercase font-weight-bold">quitar</span> a ${alumno.nombre} ${alumno.apellido} del curso?</h5>
                                            </div>
                                            <div class="modal-footer">
                                                <form:hidden  path="id" id="id" name="id" value="${alumno.id}"/>
                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                <button type="submit" class="btn btn-danger">Borrar</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </c:forEach>
        </div>
    </main>



    <!-- Modal Agregar Alumno a Curso-->
    <div class="modal fade" id="exampleModalAgregarAlumnoACurso" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header fondo-login">
                    <h5 class="modal-title text-white" id="exampleModalLabel ">Alumnos sin Cursos activos</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-5 mt-5 text-center">
                        <form:form action="agregarAlumnoACurso" method="POST">
                        <div class="col-12 p-2 ">
                            <div class="w-100 sombra d-flex rounded-3 p-2 bg-white mt-3 justify-content-around">
                                <p class="text-uppercase text-muted font-weight-bold my-auto" style="width:20%;">Nombre</p>
                                <p class="text-uppercase text-muted font-weight-bold my-auto" style="width:20%;">Apellido</p>
                                <p class="text-uppercase text-muted font-weight-bold my-auto" style="width:20%;">Edad</p>
                                <p class="text-uppercase text-muted font-weight-bold my-auto" style="width:20%;"></p>
                            </div>
                            <c:forEach items="${listaAlumnosSinCurso}" var="alumno">
                                <div class="w-100 sombra d-flex rounded-3 p-2 bg-white mt-3 justify-content-around">
                                    <p class="my-auto" style="width:20%;">${alumno.nombre}</p>
                                    <p class="my-auto" style="width:20%;">${alumno.apellido}</p>
                                    <p class="my-auto" style="width:20%;">${alumno.edad}</p>
                                    <input type="radio" name="idAlumno" value="${alumno.id}"/>
                                </div>
                            </c:forEach>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                        <button type="submit" class="btn btn-primary text-white">Agregar Alumno</button>
                    </div>

                    <input type="hidden" id="id" name="cursos" value="${cursoActual.id}">
                    </form:form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"
    integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
    integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
    crossorigin="anonymous"></script>
    </body>
</html>
