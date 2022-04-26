
SELECT * FROM profesores
SELECT * FROM materias


--INSERT INTO alumnos
--values (7,'Mariela','Lamela','Mar del Plata',28,39184456)

--INSERT INTO inscripciones
--VALUES (1,7,2,'2022-03-17')


SELECT * FROM inscripciones
SELECT * FROM alumnos
SELECT * FROM alumnos LEFT JOIN inscripciones
ON alumnos.Id_Alumno = inscripciones.Id_Alumno

CREATE TABLE autos(
	Id int IDENTITY (1000,50) not null,
	nombre varchar (20)
)
SELECT * FROM autos
INSERT INTO autos
VALUES('Toyota')
INSERT INTO autos
VALUES('Ford')
DELETE FROM autos
WHERE nombre = 'Ford'

INSERT INTO autos
VALUES ('Nissan')