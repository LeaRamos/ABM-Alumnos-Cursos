package ar.edu.unlam.tallerweb1.repositorios;

import ar.edu.unlam.tallerweb1.modelo.Curso;

import java.util.List;

public interface RepositorioCurso {
    List<Curso> mostrarTodosLosCursos();
    void modificarCurso(Curso curso);
    void guardarCurso(Curso curso);

    Curso buscarCursoPorId(Long idCurso);
}
