CREATE VIEW vwConceptos
AS
SELECT c.descripcion,v.total FROM ventas as v
INNER JOIN concepto as c on c.id_venta = v.id