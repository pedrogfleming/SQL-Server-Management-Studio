CREATE DATABASE Escuela

go

use Escuela
go

/* Creando tabla Alumno, asignatura y profesor */

Create table alumnos(
Id int not null primary key,
Nombre varchar(20) not null,
Apellido varchar(20) not null
)

Create table materias(
Id int not null primary key,
Nombre varchar(50) not null
)

Create table profesores(
Id int not null primary key,
Nombre varchar(20) not null,
Apellido varchar(20) not null
)

/* Creando tabla Inscripción con campos para llaves foraneas */

Create table inscripciones(
Id int identity(1,1) not null primary key,
Id_Materia int not null,
Id_Alumno int not null,
Id_Profesor int not null,
Fecha DATE,
CONSTRAINT fk_Materia FOREIGN KEY (Id_Materia) REFERENCES materias (Id),
CONSTRAINT fk_Alumno FOREIGN KEY (Id_Alumno) REFERENCES alumnos (Id),
CONSTRAINT fk_Profesor FOREIGN KEY (Id_Profesor) REFERENCES profesores (Id)
)

--Modificando clave foranea
ALTER TABLE inscripciones
ADD FOREIGN KEY (Id_Profesor) REFERENCES profesores(id)