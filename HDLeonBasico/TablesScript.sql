CREATE TABLE clientes(
	id INT not null PRIMARY KEY IDENTITY (1,1),
	nombre varchar(50) not null,
	edad INT
)


CREATE TABLE ventas(
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	fecha DATETIME NOT NULL,
	id_cliente INT NOT NULL ,
	total DECIMAL(18,2) NOT NULL
)
CREATE TABLE conceptos(
	id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	id_venta INT NOT NULL,
	descripcion varchar(50) NOT NULL,
	precio_unitario decimal(18,2) NOT NULL,
	cantidad INT NOT NULL,
	importe decimal(18,2) NOT NULL
)


INSERT INTO personas(nombre,edad) values('')