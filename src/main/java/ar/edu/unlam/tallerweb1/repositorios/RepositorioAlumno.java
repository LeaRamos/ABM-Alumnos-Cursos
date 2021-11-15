package ar.edu.unlam.tallerweb1.repositorios;

import ar.edu.unlam.tallerweb1.modelo.Alumno;
import ar.edu.unlam.tallerweb1.modelo.Curso;

import java.util.List;

public interface RepositorioAlumno {
	void modificarAlumno(Alumno alumno);
    List<Alumno> traerTodosLosAlumnos();
	void crearAlumno(Alumno alumnoACrear);
	void eliminarAlumno(Alumno alumnoAEliminar);
	Alumno buscarAlumnoPorId(Long idAlumno);
    List<Alumno> buscarAlumnosDeUnCurso(Long Idcurso);
	List<Alumno> buscarAlumnosSinCurso();

	List<Alumno> sinCurso();
}
