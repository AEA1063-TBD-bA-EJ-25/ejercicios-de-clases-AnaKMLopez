--29-04-25
CREATE LOGIN jaime
WITH PASSWORD = 'pAco1.23+';

CREATE LOGIN rosa 
WITH PASSWORD = 'JAIME321.o';

CREATE DATABASE empresagrande

USE empresagrande

CREATE USER jaime
FOR LOGIN jaime
GO

CREATE USER rosa 
FOR LOGIN rosa
GO

CREATE ROLE vendedor;
GO

CREATE ROLE headhr;
GO

CREATE SCHEMA ventas
GO

CREATE SCHEMA produccion
GO

CREATE SCHEMA recursoshumanos
GO

CREATE TABLE ventas.venta (
    folio int not null PRIMARY key,
    fecha DATE,
    clienteid INT not null
)

CREATE TABLE ventas.detalle_venta (
    folio INT NOT NULL,
    productoid int not null,
    cantidad FLOAT,
    precio money,
    PRIMARY KEY (folio, productoid)
)

CREATE TABLE recursoshumanos.empleados (
    empleadoid INT not null PRIMARY KEY,
    nombre NVARCHAR(50) NOT NULL,
    apellidos NVARCHAR(50) NOT NULL,
    departamentoid INT
)

CREATE TABLE recursoshumanos.deparamento (
    departamentoid INT NOT NULL PRIMARY KEY,
    nombre NVARCHAR(50),
    descripcion NVARCHAR(255)
)

GRANT SELECT, INSERT ON ventas.venta TO vendedor;
GRANT SELECT, INSERT ON ventas.detalle_venta TO vendedor;

GRANT SELECT, INSERT, UPDATE, DELETE ON recursoshumanos.empleados TO headhr;
GRANT SELECT, INSERT, UPDATE, DELETE ON recursoshumanos.deparamento TO headhr;

ALTER ROLE vendedor ADD MEMBER Jaime;
ALTER ROLE headhr ADD MEMBER Rosa;