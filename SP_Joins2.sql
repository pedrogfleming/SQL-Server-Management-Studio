select * from territorios
select * from clientes




--Traer las provincias sin clientes
select * from territorios LEFT join clientes
on territorios.id_territorio = clientes.id_territorio
where clientes.id_cliente  IS NULL

SELECT *
FROM dbo.territorios DF
WHERE NOT EXISTS(SELECT 1 FROM clientes
                 WHERE clientes.id_territorio = DF.id_territorio)

				 
begin tran
DELETE
FROM territorios 
WHERE NOT EXISTS(SELECT 1 FROM clientes c
                 WHERE c.id_territorio = territorios.id_territorio )

rollback tran




select * from clientes full outer join territorios
on territorios.id_territorio = clientes.id_territorio

SELECT * FROM  clientes
SELECT * FROM productos

INSERT INTO productos
