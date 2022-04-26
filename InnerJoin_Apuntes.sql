--INSERT INTO alumnos
--VALUES (7,'Sofia','Invernizzi','Buenos Aires',26,'39489759')

SELECT * FROM alumnos
SELECT * FROM profesores
SELECT * FROM materias
SELECT * FROM inscripciones

--EXPLICITA JOIN
SELECT inscripciones.Id,inscripciones.Id_Alumno,
	Nombre,Apellido,Ciudad,Edad,Dni  
FROM alumnos INNER JOIN inscripciones
ON inscripciones.Id_Alumno = alumnos.Id_Alumno
ORDER BY alumnos.Ciudad
--IMPLICITA WHERE
SELECT *  FROM alumnos,inscripciones
WHERE inscripciones.Id_Alumno = alumnos.Id_Alumno


--Tabla temporal
BEGIN TRAN
ALTER TABLE alumnos


CREATE TABLE #Temp(
	Materia varchar(30),
	Apellido_Alumno varchar (30),
	Nombre_Alumno varchar (30),
	Apellido_Profesor varchar (30),
	Fecha date
)
ROLLBACK TRAN
