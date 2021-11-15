package ar.edu.unlam.tallerweb1.controladores;

import ar.edu.unlam.tallerweb1.modelo.Alumno;
import ar.edu.unlam.tallerweb1.modelo.Curso;
import ar.edu.unlam.tallerweb1.servicios.ServicioAlumno;

import ar.edu.unlam.tallerweb1.servicios.ServicioCurso;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class ControladorHome {

	private ServicioAlumno servicioAlumno;
	private ServicioCurso servicioCurso;

	@Autowired
	public ControladorHome(ServicioAlumno servicioAlumno,ServicioCurso servicioCurso){
		this.servicioAlumno = servicioAlumno;
		this.servicioCurso = servicioCurso;
	}

	@RequestMapping(path = "/home", method = RequestMethod.GET)
	public ModelAndView irAHome() {
		ModelMap model = new ModelMap();

		List<Alumno> alumnosSinCurso = servicioAlumno.sinCurso();

		List<Alumno> listaAlumnos = servicioAlumno.traerTodosLosAlumnos();
		List<Curso>	listaCurso = servicioCurso.traerTodosLosCursos();
		Curso cursoDiseño= servicioCurso.buscarCursoPorId(1l);

		model.put("listaAlumnos",listaAlumnos);
		model.put("listaCurso",listaCurso);
		model.put("alumnosSinCurso",alumnosSinCurso);
		return new ModelAndView("home",model);
	}

	@RequestMapping(path = "/", method = RequestMethod.GET)
	public ModelAndView inicio() {
		return new ModelAndView("redirect:/home");
	}


}
