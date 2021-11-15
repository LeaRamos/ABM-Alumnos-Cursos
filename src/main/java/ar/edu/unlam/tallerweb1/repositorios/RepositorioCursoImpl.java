package ar.edu.unlam.tallerweb1.repositorios;

import ar.edu.unlam.tallerweb1.modelo.Alumno;
import ar.edu.unlam.tallerweb1.modelo.Curso;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("repositorioCurso")
public class RepositorioCursoImpl implements RepositorioCurso {

    private SessionFactory sessionFactory;

    @Autowired
    public RepositorioCursoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<Curso> mostrarTodosLosCursos() {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Curso.class);
        List<Curso> listaDeCursos = criteria.list();
        return listaDeCursos;
    }

    @Override
    public void modificarCurso(Curso curso) {
        sessionFactory.getCurrentSession().update(curso);
    }

    @Override
    public void guardarCurso(Curso curso) {
        sessionFactory.getCurrentSession().save(curso);
    }

    @Override
    public Curso buscarCursoPorId(Long idCurso) {
        return (Curso) sessionFactory.getCurrentSession().createCriteria(Curso.class)
                .add(Restrictions.eq("id", idCurso))
                .uniqueResult();
    }


}
