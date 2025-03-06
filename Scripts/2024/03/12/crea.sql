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

SELECT * FROM empleado

UPDATE empleado 
    SET RFC = 'FJ01'
    WHERE idEmpleado = 1

UPDATE empleado 
    SET RFC = 'ABC02'
    WHERE idEmpleado = 2

UPDATE empleado 
    SET RFC = 'AA333'
    WHERE idEmpleado = 4

UPDATE empleado 
    SET RFC = 'J4560D'
    WHERE idEmpleado = 5

SELECT * FROM empleado

INSERT INTO empleado (idEmpleado, nombre, sexo, RFC) VALUES (6, 'Delia Barrante', 'F', 'J4560D')

CREATE TABLE Departamento (
    idDepartamento INT NOT NULL PRIMARY KEY,
    Nombre NVARCHAR (30)
)

INSERT INTO Departamento (idDepartamento, Nombre) 
    VALUES (1, 'Ventas'), (2, 'MKT'), (3, 'TIC') 

SELECT * FROM Departamento

ALTER TABLE empleado  
    ADD TabrajaEn INT NULL FOREIGN KEY REFERENCES Departamento (idDepartamento)

SELECT * FROM empleado

UPDATE empleado 
    SET TabrajaEn = 1
    WHERE idEmpleado IN (1, 2)


UPDATE empleado 
    SET TabrajaEn = 2
    WHERE idEmpleado IN (3, 5)


UPDATE empleado 
    SET TabrajaEn = 3
    WHERE idEmpleado IN (4, 6)

DELETE FROM Departamento
    WHERE idDepartamento = 2

ALTER TABLE empleado
    DROP CONSTRAINT FK__empleado__Tabraj__2A164134

ALTER TABLE empleado   
    ADD CONSTRAINT FK_empleado_TrabajaEn FOREIGN KEY (TabrajaEn) REFERENCES Departamento (idDepartamento)
    ON DELETE SET NULL

DELETE FROM Departamento
    WHERE idDepartamento = 2

SELECT * FROM empleado

CREATE TABLE Familiares (
    nombre NVARCHAR (50) NOT NULL,
    idEmpleado INT NOT NULL FOREIGN KEY REFERENCES empleado(idEmpleado) ON DELETE CASCADE
)

INSERT INTO Familiares (nombre, idEmpleado)
    VALUES ('Gertrudis', 1), ('Daniel', 1), ('Manuel', 2)

SELECT * FROM Familiares

DELETE FROM empleado 
    WHERE idEmpleado = 1