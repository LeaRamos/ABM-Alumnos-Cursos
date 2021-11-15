package ar.edu.unlam.tallerweb1.servicios;


import ar.edu.unlam.tallerweb1.modelo.Alumno;
import ar.edu.unlam.tallerweb1.modelo.Curso;

import java.util.List;

public interface ServicioAlumno {
    void modificarAlumno(Alumno alumno);
    List<Alumno> traerTodosLosAlumnos();
    void crearAlumno(Alumno alumnoACrear);
    void eliminarAlumno(Alumno alumnoAEliminar);
    Alumno buscarAlumnoPorId(Long id);
    List<Alumno> buscarAlumnosDeUnCurso(Long Idcurso);
    List<Alumno> buscarAlumnosSinCurso();

    List<Alumno> sinCurso();
}

