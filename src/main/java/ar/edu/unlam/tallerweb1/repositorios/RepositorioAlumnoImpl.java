package ar.edu.unlam.tallerweb1.repositorios;

import ar.edu.unlam.tallerweb1.modelo.*;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("repositorioAlumno")
public class RepositorioAlumnoImpl implements RepositorioAlumno {
	private SessionFactory sessionFactory;

    @Autowired
	public RepositorioAlumnoImpl(SessionFactory sessionFactory){
		this.sessionFactory = sessionFactory;
	}

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public List<Alumno> traerTodosLosAlumnos() {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Alumno.class);
		List<Alumno> listaDeAlumnos = criteria.list();
		return listaDeAlumnos;
	}

	@Override
	public void crearAlumno(Alumno alumnoACrear) {
		sessionFactory.getCurrentSession().save(alumnoACrear);
	}

	@Override
	public void modificarAlumno(Alumno alumno) {
		sessionFactory.getCurrentSession().update(alumno);
	}

	@Override
	public void eliminarAlumno(Alumno alumnoAEliminar) {
		sessionFactory.getCurrentSession().delete(alumnoAEliminar);
	}

	@Override
	public Alumno buscarAlumnoPorId(Long idAlumno) {
		return (Alumno) sessionFactory.getCurrentSession().createCriteria(Alumno.class)
				.add(Restrictions.eq("id", idAlumno))
				.uniqueResult();
	}

	@Override
	public List<Alumno> buscarAlumnosDeUnCurso(Long Idcurso) {
		return  (List<Alumno>) sessionFactory.getCurrentSession().createCriteria(Alumno.class)
				.add(Restrictions.eq("curso.id", Idcurso))
				.list();
	}

	@Override
	public List<Alumno> buscarAlumnosSinCurso() {
	var query = getSession().createQuery("from Alumno where curso.id= :null");
		query.setParameter("null", null);

		List<Alumno> alumnosSinCurso = query.list();

		return alumnosSinCurso;
	}

	@Override
	public List<Alumno> sinCurso() {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Alumno.class)
				.add(Restrictions.eqOrIsNull("curso.id",null));
		List<Alumno> listaDeAlumnos = criteria.list();
		return listaDeAlumnos;
	}
}
