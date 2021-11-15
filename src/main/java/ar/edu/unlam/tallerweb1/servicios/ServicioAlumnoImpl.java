package ar.edu.unlam.tallerweb1.servicios;

import ar.edu.unlam.tallerweb1.modelo.Alumno;
import ar.edu.unlam.tallerweb1.modelo.Curso;
import ar.edu.unlam.tallerweb1.repositorios.RepositorioAlumno;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service("servicioAlumno")
@Transactional
public class ServicioAlumnoImpl implements ServicioAlumno {

    private RepositorioAlumno repositorioAlumno;

    @Autowired
    public ServicioAlumnoImpl(RepositorioAlumno repositorioAlumno) {
        this.repositorioAlumno = repositorioAlumno;
    }

    @Override
    public List<Alumno> traerTodosLosAlumnos() {
        List<Alumno> listaTodosLosAlumnos = repositorioAlumno.traerTodosLosAlumnos();
        return listaTodosLosAlumnos;
    }

    @Override
    public void crearAlumno(Alumno alumnoACrear) {
        repositorioAlumno.crearAlumno(alumnoACrear);
    }

    @Override
    public void eliminarAlumno(Alumno alumnoAEliminar) {
        repositorioAlumno.eliminarAlumno(alumnoAEliminar);
    }

    @Override
    public Alumno buscarAlumnoPorId(Long idAlumno) {
        return repositorioAlumno.buscarAlumnoPorId(idAlumno);
    }

    @Override
    public List<Alumno> buscarAlumnosDeUnCurso(Long Idcurso) {
        return repositorioAlumno.buscarAlumnosDeUnCurso(Idcurso);
    }

    @Override
    public void modificarAlumno(Alumno alumno) {
        repositorioAlumno.modificarAlumno(alumno);
    }

    @Override
    public List<Alumno> buscarAlumnosSinCurso(){
        return repositorioAlumno.buscarAlumnosSinCurso();
    }

    @Override
    public List<Alumno> sinCurso() {
        return repositorioAlumno.sinCurso();
    }
}
