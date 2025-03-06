CREATE DATABASE escuelita

go

use escuelita

CREATE TABLE Persona (
    CURP CHAR (18) NOT NULL PRIMARY KEY,
    Nombre NVARCHAR (50) NOT NULL,
    Direccion NVARCHAR (100) NULL,
    Nacimiento DATE NOT NULL

)

CREATE TABLE Carrera (
    Clave CHAR(13) NOT NULL PRIMARY KEY,
    Nombre VARCHAR (60) NOT NULL
)

CREATE TABLE Alumno (
    CURP CHAR (18) NOT NULL PRIMARY KEY FOREIGN KEY REFERENCES Persona(CURP),
    NumeroDeControl CHAR (8) NOT NULL UNIQUE,
    CarreraClave CHAR (13) FOREIGN KEY REFERENCES Carrera(Clave)
)

SELECT * From Persona

CREATE TABLE Docente (
    CURP CHAR(18) NOT NULL PRIMARY KEY,
    RFC CHAR (13) NOT NULL UNIQUE,
    Profesion NVARCHAR (30)
)

CREATE TABLE Administrativo (
    CURP CHAR (18) NOT NULL 
        PRIMARY KEY 
        FOREIGN KEY REFERENCES Persona(CURP)
)

INSERT INTO Carrera (Clave, Nombre)
    VALUES ('ITIC-2010-225', 'Ingenieria en Tecnologias de la Informacion y Comuncaciones')

select * from Carrera


INSERT INTO Carrera (Clave, Nombre)
    VALUES ('ISIC-2010-224', 'Ingenieria en Sistemas Computacionales'),
           ('IMCT-2010-229','Ingenieria Mecatronica')

INSERT INTO Persona(CURP, Nombre, Direccion, Nacimiento)
    VALUES ('JS20FR', 'Johane Sacrebleu', 'Por alla', '2003-04-05')

INSERT INTO Alumno (CURP, NumeroDeControl, CarreraClave)
    VALUES ('JS20FR', '20170005', 'ITIC-2010-225')


Select NumeroDeControl, Nombre, CarreraClave from Persona
    JOIN Alumno ON Persona.CURP = Alumno.CURP

