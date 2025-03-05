CREATE DATABASE escueltia;

GO

use escuelita

CREATE TABLE empleado (
    idEmpleado INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    sueldo money DEFAULT 1500
)

INSERT INTO empleado (idEmpleado, nombre, sueldo)
    VALUES (1, 'Felipde de Jesus', 2000)

SELECT * FROM empleado;

INSERT INTO empleado (idEmpleado, nombre)
    VALUES (2, 'Chuerk')

SELECT * FROM empleado

CREATE TABLE personita (
    idEmpleado INT NOT NULL PRIMARY KEY,
    nombre NVARCHAR (50) NOT NULL,
    sueldo money DEFAULT 1500,
    telefono VARCHAR (20) CHECK (telefono LIKE '667[0-9][0-9]')
)

SELECT * FROM personita

INSERT INTO personita VALUES (1, 'Juana', NULL, '667123')

ALTER TABLE empleado    
    ADD sexo CHAR(1) NULL CHECK (sexo in ('H', 'M'))

SELECT * FROM empleado

INSERT INTO empleado (idEmpleado, nombre, sexo) VALUES (3, 'Alexis Jara Rodriguez', 'M')

INSERT INTO empleado (idEmpleado, nombre, sexo) VALUES (4, 'Matilde Sandoval', 'F')

ALTER TABLE empleado
    DROP CONSTRAINT CK__empleado__sexo__1AD3FDA4

INSERT INTO empleado (idEmpleado, nombre, sexo) VALUES (4, 'Matilde Sandoval', 'F')

SELECT * FROM empleado

ALTER TABLE empleado
    ADD CONSTRAINT sexonuevasopciones CHECK (sexo in ('H', 'M', 'T', 'F'))

INSERT INTO empleado (idEmpleado, nombre, sexo) VALUES (5, 'Refugio Saldivar', 'F')

INSERT INTO empleado (idEmpleado, nombre, sexo) VALUES (6, 'Delia Barrante', 'R')

SELECT getdate()

ALTER TABLE empleado
    ADD nacimiento date not null check (date < getDate())

SELECT * FROM empleado

ALTER TABLE empleado   
    ADD RFC char(13) NULL

ALTER TABLE empleado
    ADD CONSTRAINT rfc_unico UNIQUE (RFC)

UPDATE empleado 
    SET RFC = 'JARA12345678'
    WHERE idEmpleado = 3