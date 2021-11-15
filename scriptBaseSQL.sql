use candoIT;

insert into curso(nombreCurso, dia, horaInicio, horaFin)
values('Angular','Lunes',12,14),
      ('Css','Martes',10,12),
      ('JavaScript','Miercoles',15,17),
      ('Python','Jueves',08,10),
      ('React','Sabado',20,22),
      ('Wordpress','viernes',18,20);

insert into alumno(nombre, apellido, edad, sexo,mail,nacionalidad,curso_id)
values('eric','cuevas',20,'Masculino',"eric@algo.com","argentino",null),
      ('Lalo','Landa',24,'Masculino',"lalo@algo.com","argentino",null),
      ('Carla','Cur',30,'Femenino',"carla@algo.com","argentino",null),
      ('Ana','Nani',19,'Femenino',"ana@algo.com","argentino",null),
      ('Rob','Stark',29,'Masculino',"rob@algo.com","argentino",null),
      ('lea','ramos',24,'Masculino',"lea@algo.com","argentino",null);

select *
from alumno;

select *
from curso;
