package ar.edu.unlam.tallerweb1.servicios;

import ar.edu.unlam.tallerweb1.modelo.Alumno;
import ar.edu.unlam.tallerweb1.modelo.Curso;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioCurso;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioAlumno;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service("servicioCurso")
@Transactional
public class ServicioCursoImpl implements ServicioCurso {


    private RepositorioCurso repositorioCurso;
    private RepositorioAlumno repositorioUsuario;

    @Autowired
    public ServicioCursoImpl(RepositorioCurso repositorioCurso, RepositorioAlumno repositorioUsuario) {
        this.repositorioCurso = repositorioCurso;
        this.repositorioUsuario = repositorioUsuario;
    }


    @Override
    public List<Curso> traerTodosLosCursos() {
        List<Curso> listaTodosLosCursos = repositorioCurso.mostrarTodosLosCursos();
        return listaTodosLosCursos;
    }

    @Override
    public void guardarCurso(Curso curso) {
        repositorioCurso.guardarCurso(curso);
    }

    @Override
    public Curso buscarCursoPorId(Long idCurso) {
        return repositorioCurso.buscarCursoPorId(idCurso);
    }
}
