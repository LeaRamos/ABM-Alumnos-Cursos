<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
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

    <title>Alumnos</title>
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


<!-- Modal curso Alumno-->
<div class="modal fade" id="exampleModalCursoAlumno" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">¡Elija una materia!</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="fondo-login col-12 text-center text-white align-items-center py-1 mt-2">
                    <p class="m-0">Lista de Cursos Disponibles</p>
                </div>

                <div class="mb-5 mt-5 text-center">
                    <%--@elvariable id="altaCursoAlumno" type="ar.edu.unlam.tallerweb1.modelo.AltaCursoAlumno"--%>
                    <form:form action="agregarAlumnoACurso" method="POST">
                        <div class="col-12 p-2 ">
                            <div class="w-100 sombra d-flex rounded-3 p-2 bg-white mt-3 justify-content-around">
                                <p class="text-uppercase text-muted font-weight-bold my-auto" style="width:20%;">Curso</p>
                                <p class="text-uppercase text-muted font-weight-bold my-auto" style="width:20%;">Dia</p>
                                <p class="text-uppercase text-muted font-weight-bold my-auto" style="width:20%;">Hora</p>
                                <p class="text-uppercase text-muted font-weight-bold my-auto" style="width:20%;"></p>
                            </div>
                            <c:forEach items="${listaCurso}" var="curso">
                                <div class="w-100 sombra d-flex rounded-3 p-2 bg-white mt-3 justify-content-around">
                                    <p class="my-auto" style="width:20%;">${curso.nombreCurso}</p>
                                    <p class="my-auto" style="width:20%;">${curso.dia}</p>
                                    <p class="my-auto" style="width:20%;">${curso.horaInicio}hs a ${curso.horaFin}hs</p>
                                    <input type="radio" name="cursos" value="${curso.id}"/>
                                </div>
                            </c:forEach>

                        </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary text-white">Inscribir Curso</button>
                </div>

                <input type="hidden" id="id" name="idAlumno" value="${alumnoBuscado.id}">
                </form:form>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid  mt-5 rounded-3 ">
    <div class="row w-100 bg-light m-auto p-1 justify-content-md-center px-0 rounded mb-5" style="max-width: 1440px;">
        <div class="col-12 px-0 rounded" style="min-height:300px;">
            <div class="tab tab-primary">
                <ul class="nav nav-pills nav-pills-sm nav-light mb-2 mx-3"> <!-- empieza botones-->
                    <li class="nav-item">
                        <a class="nav-link btn btn-active-light btn-color-muted py-2 px-4 active fw-bolder me-2"
                           data-bs-toggle="tab" href="#primary-tab-1">Mi Perfil</a>
                    </li>
                </ul><!-- Termina botones-->
                <div class="tab-content">
                    <!-- Empieza primer boton-->
                    <div class="tab-pane active" id="primary-tab-1" role="tabpanel">
                        <div class="row w-100 bg-light row w-100 h-100 m-auto justify-content-md-center">
                            <!-- Informacion con Foto-->
                            <div class="bg-danger col-12 col-md-6 d-flex bg-white align-content-center justify-content-center">
                                <div class="d-flex align-items-center flex-column w-75  align-content-center justify-content-center flex-wrap text-center">

                                    <c:if test="${alumnoBuscado.sexo == 'Masculino'}">
                                        <img src="imagenes/perfilHombre.png" alt="Foto Perfil" class="rounded" width=200 height=150 />
                                    </c:if>
                                    <c:if test="${alumnoBuscado.sexo == 'Femenino'}">
                                        <img src="imagenes/perfilMujer.png" alt="Foto Perfil" class="rounded" width=200 height=150 />
                                    </c:if>


                                    <h3 class="mt-3">${alumnoBuscado.nombre} ${alumnoBuscado.apellido}</h3>
                                    <p class="text-muted m-0">${alumnoBuscado.mail}</p>
                                    <p class="text-muted m-0">${alumnoBuscado.nacionalidad}</p>
                                </div>
                            </div>

                            <!-- Informacion De la Tabla-->
                            <div class="col-12 col-md-6 d-flex align-items-center bg-white">
                                <div class="w-100">
                                    <table class="table table-hover table-borderless mt-2">
                                        <tbody>
                                        <tr class="table-primary">
                                            <th scope="row">
                                                <spa class="text-muted fw-normal">Nombre</spa>
                                            </th>
                                            <td class="user-avatar fw-bold">${alumnoBuscado.nombre}
                                                ${alumnoBuscado.apellido}</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">
                                                <spa class="text-muted fw-normal">Edad</spa>
                                            </th>
                                            <td class="user-avatar fw-bold">${alumnoBuscado.edad}</td>
                                        </tr>
                                        <tr class="table-primary">
                                            <th scope="row">
                                                <spa class="text-muted fw-normal">Mail</spa>
                                            </th>
                                            <td class="user-avatar fw-bold">${alumnoBuscado.mail}</td>
                                        </tr>
                                        <tr class="">
                                            <th scope="row">
                                                <spa class="text-muted fw-normal">Sexo</spa>
                                            </th>
                                            <td class="user-avatar fw-bold">${alumnoBuscado.sexo}
                                            </td>
                                        </tr>
                                        <tr class="table-primary">
                                            <th scope="row">
                                                <spa class="text-muted fw-normal">Fecha Alta</spa>
                                            </th>
                                            <td class="user-avatar fw-bold">12/07/2020</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <!-- Informacion Del Curso-->
                            <div class="bg-white col-12 col-md-10 d-flex flex-column flex-md-row p-2 mb-2 mt-3 align-items-center justify-content-evenly">

                                <c:if test="${not empty alumnoBuscado.curso.id}">
                                     <div class=" d-flex w-25 align-content-center justify-content-center flex-wrap">
                                        <i class="fas fa-book fa-6x text-primary"></i>
                                    </div>

                                    <div class=" d-flex flex-column ">
                                        <h4 class="mb-3 text-sm">${alumnoBuscado.curso.nombreCurso}</h4>
                                        <span class="mb-2 text-xs">Docente:
                                        <span class="text-dark font-weight-bold ms-sm-2">
                                                ${alumnoBuscado.curso.nombreCurso}
                                        </span>
                                    </span>
                                        <span class="mb-2 text-xs">Dia:
                                        <span class="text-dark ms-sm-2 font-weight-bold">
                                                ${alumnoBuscado.curso.dia}
                                        </span>
                                    </span>
                                        <span class="mb-2 text-xs">Horario:
                                        <span class="text-dark ms-sm-2 font-weight-bold">
                                            ${alumnoBuscado.curso.horaInicio}hs a ${alumnoBuscado.curso.horaFin}hs
                                        </span>
                                    </span>

                                    </div>

                                    <div class="text-end">
                                        <form:form action="quitarAlumnoDelCurso" method="POST">
                                            <button type="button" class="btn btn-link text-danger text-gradient px-3 mb-0" data-bs-toggle="modal" data-bs-target="#exampleModalDarBajaMateria">
                                                <i class="far fa-trash-alt me-2" aria-hidden="true"></i>Desvincularse del Curso
                                            </button>

                                            <!-- Modal Quitar Alumno-->
                                            <div class="modal fade" id="exampleModalDarBajaMateria" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header fondo-login">
                                                            <h5 class="modal-title text-white" id="exampleModalLabel">¡Estas a punto de Quitar un Alumno!</h5>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="mb-5 mt-5 text-center">
                                                                <h5> ¿Estas seguro/a de <span class="text-uppercase font-weight-bold">quitar</span> a ${alumnoBuscado.nombre} ${alumnoBuscado.apellido} del curso?</h5>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <form:hidden  path="id" id="id" name="id" value="${alumnoBuscado.id}"/>
                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                                                                <button type="submit" class="btn btn-danger">Borrar</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form:form>
                                    </div>
                                </c:if>
                                <c:if test="${empty alumnoBuscado.curso.id}">
                                    <div class="fondo-login col-12 text-center text-white align-items-center py-1 mt-2">
                                        <p class="m-0">¡No tiene un Curso Activo! Puede elegir uno
                                            <button type="button" class="btn btn-link text-white text-gradient px-0 pt-0 mb-0 " data-bs-toggle="modal" data-bs-target="#exampleModalCursoAlumno">
                                                aca
                                            </button>
                                        </p>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                    <!-- Termina primer boton-->
                </div>
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
