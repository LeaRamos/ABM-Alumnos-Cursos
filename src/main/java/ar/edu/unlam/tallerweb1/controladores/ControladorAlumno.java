package ar.edu.unlam.tallerweb1.controladores;

import ar.edu.unlam.tallerweb1.modelo.AltaCursoAlumno;
import ar.edu.unlam.tallerweb1.modelo.Alumno;
import ar.edu.unlam.tallerweb1.modelo.Curso;
import ar.edu.unlam.tallerweb1.servicios.ServicioAlumno;

import ar.edu.unlam.tallerweb1.servicios.ServicioCurso;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.time.temporal.ChronoUnit;
import java.util.List;

@Controller
public class ControladorAlumno {
    private ServicioAlumno servicioAlumno;
    private ServicioCurso servicioCurso;


    @Autowired
    public ControladorAlumno(ServicioAlumno servicioAlumno,ServicioCurso servicioCurso){
        this.servicioAlumno = servicioAlumno;
        this.servicioCurso = servicioCurso;
    }

    @RequestMapping(path = "/alumno", method = RequestMethod.GET)
    public ModelAndView irAAlumno(@RequestParam(value = "alumno") Long alumnoId ) {
        ModelMap model = new ModelMap();


        List<Curso>	listaCurso = servicioCurso.traerTodosLosCursos();
        Alumno alumnoBuscado = servicioAlumno.buscarAlumnoPorId(alumnoId);

        model.put("alumnoBuscado",alumnoBuscado);
        model.put("listaCurso",listaCurso);
        return new ModelAndView("alumnos",model);
    }

    @RequestMapping(path = "/crearAlumno", method = RequestMethod.POST)
    public ModelAndView crearAlumno(@ModelAttribute("alumno")Alumno alumnoACrear) {
        ModelMap model = new ModelMap();
        servicioAlumno.crearAlumno(alumnoACrear);
        return new ModelAndView("redirect:/home",model);
    }

    @RequestMapping(path = "/modificarAlumno", method = RequestMethod.POST)
    public ModelAndView editarAlumno(@ModelAttribute("alumno")Alumno alumnoAModificar) {
        ModelMap model = new ModelMap();
        Alumno alumno = servicioAlumno.buscarAlumnoPorId(alumnoAModificar.getId());

        alumno.setNombre(alumnoAModificar.getNombre());
        alumno.setApellido(alumnoAModificar.getApellido());
        alumno.setEdad(alumnoAModificar.getEdad());
        alumno.setSexo(alumnoAModificar.getSexo());

        servicioAlumno.modificarAlumno(alumno);
        return new ModelAndView("redirect:/home",model);
    }

    @RequestMapping(path = "/agregarAlumnoACurso", method = RequestMethod.POST)
    public ModelAndView agregarAlumno(@RequestParam (value = "cursos") Long cursos,
                                      @RequestParam(value = "idAlumno") Long idAlumno) {
        ModelMap model = new ModelMap();

        Alumno alumno = servicioAlumno.buscarAlumnoPorId(idAlumno);
        Curso curso = servicioCurso.buscarCursoPorId(cursos);
        alumno.setCurso(curso);
        servicioAlumno.modificarAlumno(alumno);

        return new ModelAndView("redirect:/home",model);
    }

    @RequestMapping(path = "/eliminarAlumno", method = RequestMethod.POST)
    public ModelAndView eliminarAlumno(@RequestParam(value = "idAlumno") Long alumnoAEliminar) {
        ModelMap model = new ModelMap();
        Alumno alumno = servicioAlumno.buscarAlumnoPorId(alumnoAEliminar);
        alumno.setCurso(null);
        servicioAlumno.modificarAlumno(alumno);
        servicioAlumno.eliminarAlumno(alumno);
        return new ModelAndView("redirect:/home",model);
    }

    @RequestMapping(path = "/quitarAlumnoDelCurso", method = RequestMethod.POST)
    public ModelAndView quitarAlumno(@ModelAttribute("alumno") Alumno alumnoAQuitar) {
        ModelMap model = new ModelMap();
        Alumno alumno = servicioAlumno.buscarAlumnoPorId(alumnoAQuitar.getId());

        alumno.setCurso(null);
        servicioAlumno.modificarAlumno(alumno);

        return new ModelAndView("redirect:/home",model);
    }
}
