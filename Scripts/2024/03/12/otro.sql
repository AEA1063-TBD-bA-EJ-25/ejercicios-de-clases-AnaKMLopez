USE empresagrande

SELECT * FROM ventas.venta;

INSERT INTO ventas.venta(folio, fecha, clienteid) VALUES (1, GETDATE(), 1)