<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<jsp:useBean id="command" class="ar.edu.unlam.tallerweb1.modelo.Alumno" scope="request"></jsp:useBean>
<!DOCTYPE html>
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
    <title>CandoIt</title>
</head>
<body class="fondoVerde" style="min-height: 100vh;">
<!-- Navbar -->
<nav class="container-fluid navbar navbar-expand-lg navbar-dark bg-dark" style="min-height: 80px">
    <div class="container-fluid">
        <a class="navbar-brand me-auto ms-lg-2 ms-3 text-uppercase fw-bold mr-5" href="home"> candoIt</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#topNavBar" aria-controls="topNavBar" aria-expanded="false"aria-label="Toggle navigation">
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
<main class="container-fluid w-100 pb-5" style="max-width: 1440px">

    <div class="row my-3 p-0 pb-5 bg-body rounded shadow-sm justify-content-center justify-content-lg-around">
        <div class="d-flex align-items-center p-3 text-dark  fondo-login rounded shadow-sm align-items-center align-content-center">
            <i class="fas fa-book ext-danger me-3  accordion-collapse fa-2x text-white"  width="48" height="38"></i>
            <div class="lh-1">
                <h1 class="h6 mb-0 lh-1 text-white ">Materias del Instituto</h1>
                <small class="text-white">Cantidad Total: 20</small>
            </div>
        </div>

        <c:forEach items="${listaCurso}" var="curso" >
            <div class="col-12 d-flex col-md-6 col-lg-4 align-items-center mt-5 sombra rounded" style="min-height: 100px;max-width: 400px;">
                <div class="symbol symbol-100 mr-2  w-100">
                    <c:if test="${curso.nombreCurso == 'Angular'}">
                        <img class="symbol-label" src="imagenes/course-angular.jpg" width="110" height="80"/>
                    </c:if>
                    <c:if test="${curso.nombreCurso == 'Css'}">
                        <img class="symbol-label" src="imagenes/course-css.jpg" width="110" height="80"/>
                    </c:if>
                    <c:if test="${curso.nombreCurso == 'JavaScript'}">
                        <img class="symbol-label" src="imagenes/course-javascript.jpg" width="110" height="80"/>
                    </c:if>
                    <c:if test="${curso.nombreCurso == 'Python'}">
                        <img class="symbol-label" src="imagenes/course-python.jpg" width="110" height="80"/>
                    </c:if>
                    <c:if test="${curso.nombreCurso == 'React'}">
                        <img class="symbol-label" src="imagenes/course-react.jpg" width="110" height="80"/>
                    </c:if>
                    <c:if test="${curso.nombreCurso == 'Wordpress'}">
                        <img class="symbol-label" src="imagenes/course-wordpress.jpg" width="110" height="80"/>
                    </c:if>
                    <i class="symbol-badge bg-success"></i>
                </div>
                <div class="d-flex flex-column w-100" >
                    <a href="#" class=" text-decoration-none text-dark font-weight-bold font-size-h5 text-dark-75 text-hover-primary">${curso.nombreCurso}</a>
                    <div class="text-muted mt-1">Horario: ${curso.horaInicio}hs a ${curso.horaFin}hs</div>
                    <div class="navi mt-1">
                        <a href="#" class="navi-item text-decoration-none">
						<span class="navi-link p-0 pb-2">
							<span class="navi-text text-muted text-hover-primary">Dia:${curso.dia}</span>
						</span>
                        </a>
                    </div>
                </div>
                <di class="d-flex flex-column w-100 align-items-center pl-3">
                    <a href="curso?curso=${curso.id}" class="btn btn-primary">Ver Materia</a>
                </di>
            </div>
        </c:forEach>

    </div>

    <!-- Titulo  Alumno-->
    <div class="row my-3 mt-3 mb-5 p-0 pb-5 bg-body rounded shadow-sm justify-content-center justify-content-lg-around">

        <div class="d-flex align-items-center p-3  text-dark fondo-login rounded shadow-sm align-items-center align-content-center">
            <i class="fas fa-user-graduate ext-danger me-3  accordion-collapse fa-2x text-white"  width="48" height="38"></i>
            <div class="lh-1">
                <h1 class="h6 mb-0 lh-1 text-white ">Alumnos del Instituto</h1>
                <small class="text-white">Cantidad Total: 20</small>
            </div>
        </div>

        <div class="d-flex align-items-center justify-content-center w-100 bg-white rounded py-2 mt-5">
            <button type="button" class="btn btn-success text-gradient px-3 mb-0 " data-bs-toggle="modal" data-bs-target="#exampleModalCrearAlumno">
                <span class="fw-bolder text-white mr-2">Crear Alumno/a Nuevo</span>
                <i class="fas fa-plus-circle text-white" aria-hidden="true"></i>
            </button>
        </div>
        <!-- Modal Crear Alumno-->
        <div class="modal fade" id="exampleModalCrearAlumno" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header fondo-login">
                        <h5 class="modal-title text-white"
                            id="exampleModalLabel">¡Vamos a Crear a un/a Alumno/a!</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form:form action="crearAlumno" method="POST">
                    <div class="modal-body">
                        <div class="mb-5 mt-5 text-center">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label for="inputEmail4" class="form-label">Nombre</label>
                                    <form:input type="text" class="form-control" id="inputEmail4" path="nombre" value="${alumno.nombre}"/>
                                </div>
                                <div class="col-md-6">
                                    <label for="inputPassword4" class="form-label">Apellido</label>
                                    <form:input type="text" class="form-control" id="inputPassword4" path="apellido" value="${alumno.apellido}"/>
                                </div>
                                <div class="col-md-6">
                                    <label for="inputPassword4" class="form-label">Edad</label>
                                    <form:input type="number" class="form-control" id="inputPassword4" path="edad" value="${alumno.edad}"/>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label ">Sexo</label>
                                    <form:select name="sexo" path="sexo" class="form-select">
                                        <option>Masculino</option>
                                        <option>Femenino</option>
                                        <option>Otro</option>
                                    </form:select>
                                </div>

                            </div>
                        </div>


                        <div class="modal-footer">
                            <button type="button" class="btn btn-dark text-white" data-bs-dismiss="modal">
                                Cancelar
                            </button>
                            <form:hidden  path="id" id="id" name="id" value="${alumno.id}"/>
                            <button type="submit" class="btn btn-success text-white">Crear Alumno</button>
                        </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>

        <c:forEach items="${listaAlumnos}" var="alumno" >
            <div class="col-12 d-flex col-md-6 col-lg-4 align-items-center mt-5 sombra rounded" style="min-height: 100px;max-width: 400px;">

                <div class="symbol symbol-100 mr-2  w-100 rounded">
                    <c:if test="${alumno.sexo == 'Masculino'}">
                        <img class="symbol-label rounded" src="imagenes/perfilHombre.png" width="110" height="80"/>
                    </c:if>
                    <c:if test="${alumno.sexo == 'Femenino'}">
                        <img class="symbol-label rounded" src="imagenes/perfilMujer.png" width="110" height="80"/>
                    </c:if>
                    <i class="symbol-badge bg-success"></i>
                </div>

                <div class="d-flex flex-column w-100" >
                    <div class=" text-decoration-none text-dark font-weight-bold font-size-h5 text-dark-75 text-hover-primary">${alumno.nombre} ${alumno.apellido}</div>
                    <div class="text-muted mt-1">${alumno.mail}</div>
                    <div class="text-muted mt-1">${alumno.edad} años</div>
                </div>

                <div class="d-flex flex-column w-100 align-items-center pl-3">
                    <a href="alumno?alumno=${alumno.id}" class="btn btn-link text-primary text-gradient px-3 mb-0">
                        <i class="fas fa-user-alt me-2" aria-hidden="true"></i>Perfil
                    </a>
                    <form:form action="eliminarAlumno" method="post">
                        <input  type="hidden" name="idAlumno" value="${alumno.id}">
                        <button type="submit" class="btn btn-link text-danger text-gradient px-3 mb-0" data-bs-toggle="modal" data-bs-target="#exampleModalBorrarAlumno${alumno.id}">
                            <i class="far fa-trash-alt me-2" aria-hidden="true"></i>Borrar
                        </button>
                    </form:form>
                    <button type="button" class="btn btn-link text-warning text-gradient px-3 mb-0" data-bs-toggle="modal" data-bs-target="#exampleModalModificarAlumno${alumno.id}">
                        <i class="fas fa-user-edit me-2" aria-hidden="true"></i>Editar
                    </button>

                    <!-- Modal Crear Alumno-->
                    <div class="modal fade" id="exampleModalModificarAlumno${alumno.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header fondo-login">
                                    <h5 class="modal-title text-white"
                                        id="exampleModalLabel">¡Vamos a Modificar un/a Alumno/a!</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <form:form action="modificarAlumno" method="POST">
                                <div class="modal-body">
                                    <div class="mb-5 mt-5 text-center">
                                        <div class="row g-3">
                                            <div class="col-md-6">
                                                <label for="inputEmail4" class="form-label">Nombre</label>
                                                <form:input type="text" class="form-control" id="inputEmail4" path="nombre" value="${alumno.nombre}"/>
                                            </div>
                                            <div class="col-md-6">
                                                <label for="inputPassword4" class="form-label">Apellido</label>
                                                <form:input type="text" class="form-control" id="inputPassword4" path="apellido" value="${alumno.apellido}"/>
                                            </div>
                                            <div class="col-md-6">
                                                <label for="inputPassword4" class="form-label">Edad</label>
                                                <form:input type="number" class="form-control" id="inputPassword4" path="edad" value="${alumno.edad}"/>
                                            </div>
                                            <div class="col-md-6">
                                                <label for="inputPassword4" class="form-label">Mail</label>
                                                <form:input type="mail" class="form-control" id="inputPassword4" path="mail" value="${alumno.mail}"/>
                                            </div>
                                            <div class="col-md-6">
                                                <label for="inputPassword4" class="form-label">Nacionalidad</label>
                                                <form:input type="text" class="form-control" id="inputPassword4" path="nacionalidad" value="${alumno.nacionalidad}"/>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="form-label ">Sexo</label>
                                                <form:select name="sexo" path="sexo" class="form-select">
                                                    <option>Masculino</option>
                                                    <option>Femenino</option>
                                                    <option>Otro</option>
                                                </form:select>
                                            </div>

                                        </div>
                                    </div>


                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-dark text-white" data-bs-dismiss="modal">
                                            Cancelar
                                        </button>
                                        <form:hidden  path="id" id="id" name="id" value="${alumno.id}"/>
                                        <button type="submit" class="btn btn-warning text-black">Modificar Alumno</button>
                                    </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

        </c:forEach>
    </div>

</main>


<style>
    #botones:hover {
        background: #0c63e4;
    }
</style>



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