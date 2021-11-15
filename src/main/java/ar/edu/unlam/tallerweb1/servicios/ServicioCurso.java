package ar.edu.unlam.tallerweb1.servicios;


import ar.edu.unlam.tallerweb1.modelo.Alumno;
import ar.edu.unlam.tallerweb1.modelo.Curso;

import java.util.List;

public interface ServicioCurso {
    List<Curso> traerTodosLosCursos();

    void guardarCurso(Curso curso);

    Curso buscarCursoPorId(Long idCurso);
}
