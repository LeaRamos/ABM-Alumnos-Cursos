# Proyecto-candoIT

Configuracion del Proyecto

El Proyecto se hizo con Intellij

Tecnologias necesarias: Java 11
                         Tomcat 8.5.70
                         Mysql 8
                         Spring Framework 4.2.6
                         Hibernate 5.4.2
                         Apache Maven 3.8.2

En el archivo "pom.xml" se encuentran todas las dependecias.

En el archivo "hibernateContext.xml" en la linea 12,13 y 14 se puede configurar la base de datos si fuera necesario
Linea 12 = nombre de la base
linea 13 = user
linea 14 = contraseña
(el archivo se encuentra en la ruta Proyecto-candoIT\src\main\resources\hibernateContext.xml)

////////////////////////////////////////////

Aclaraciones del Proyecto

Se utiliza una relacion mucho-1 entre Alumno y curso, por lo que cada alumno solo podra estar inscripto en un solo curso pero cada curso puede tener muchos Alumnos.
El proyecto no controla errores ni excepciones,por lo que si se busca romper el proyecto,se rompera.
Los links de la navegacion "curso" y "alumnos" no hacen nada.Solo funciona el link "Home" y "Candoit".
El proyecto usa "MVC" (Model,View, Controller).






