package ar.edu.unlam.tallerweb1.controladores;

import ar.edu.unlam.tallerweb1.modelo.Alumno;
import ar.edu.unlam.tallerweb1.modelo.Curso;
import ar.edu.unlam.tallerweb1.servicios.ServicioAlumno;
import ar.edu.unlam.tallerweb1.servicios.ServicioCurso;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class ControladorCurso {

    private ServicioAlumno servicioAlumno;
    private ServicioCurso servicioCurso;

    @Autowired
    public ControladorCurso(ServicioAlumno servicioAlumno,ServicioCurso servicioCurso){
        this.servicioAlumno = servicioAlumno;
        this.servicioCurso = servicioCurso;
    }


    @RequestMapping(path = "/curso", method = RequestMethod.GET)
    public ModelAndView irACurso(@RequestParam(value = "curso") Long cursoId) {
        ModelMap model = new ModelMap();

        Curso cursoActual = servicioCurso.buscarCursoPorId(cursoId);
        List<Alumno> alumnosSinCurso = servicioAlumno.sinCurso();
        List<Alumno>listaAlumnosConCurso = servicioAlumno.buscarAlumnosDeUnCurso(cursoId);

        model.put("listaAlumnosSinCurso",alumnosSinCurso);
        model.put("listaAlumnosConCurso",listaAlumnosConCurso);
        model.put("cursoActual",cursoActual);
        return new ModelAndView("curso",model);
    }

}
