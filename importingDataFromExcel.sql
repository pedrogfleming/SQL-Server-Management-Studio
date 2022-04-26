CREATE TABLE empleados (
[id_empleado] int PRIMARY KEY NOT NULL IDENTITY(1,1),
[Apellido] nvarchar(60) NOT NULL,
[Nombre] nvarchar(60) NOT NULL,
[Sueldo] float NOT NULL,
[Fecha Ingreso] date NOT NULL,
[Fecha de Baja] date,
)