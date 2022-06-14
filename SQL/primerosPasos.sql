-- Muestro las bases de datos
SHOW DATABASES;

-- Muestro las tablas
SHOW TABLES;

-- Creo la base de datos
CREATE DATABASE curso_2140;

-- Selecciono la base de datos
USE curso_2140;

-- Nombre  VARCHAR(50)
-- Apellido VARCHAR(50)
-- Email  TINYTEXT()
-- Cedula  INT(8)
-- Fecha de nacimiento  DATE()
-- Telefono  VARCHART(15)
-- Genero  ENUM("Masculino", "Femenino", "Otros")
-- Domicilio  TEXT
-- Pais  (Country iso 2) char(2)

-- Para crear una tabla en la base de datos
CREATE TABLE personas(
nombre varchar(50),
apellido varchar(50),
email TINYTEXT,
cedula INT(8),
fechaNacimiento DATE,
telefono varchar(15),
genero ENUM("Masculino", "Femenino", "Otros"),
domicilio TEXT,
pais CHAR(2),
PRIMARY KEY(cedula)
)

DROP TABLE personas;

SHOW CREATE TABLE personas;
CREATE TABLE `personas` (
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `email` tinytext,
  `cedula` int(8) NOT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `genero` enum('Masculino','Femenino','Otros') DEFAULT NULL,
  `domicilio` text,
  `pais` char(2) DEFAULT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1

-- Extraemos datos de la tabla
SELECT * FROM personas;

INSERT INTO personas (nombre,apellido,email,cedula,fechaNacimiento,telefono,genero,domicilio,pais)
VALUES ("Gonzalo", "Perrone", "gonzalodamianperrone@gmail.com","12345678", "2000-04-05", "099999999", "Masculino", "En la esquina", "UY")

INSERT INTO personas SET
nombre = "Carla",
apellido = "Po",
email = "carlapo@gmail.com",
cedula = 87654321,
fechaNacimiento = "2002-10-10",
telefono = "nop tengo",
genero = NULL,
domicilio = "La casa negra",
pais = "UY";

INSERT INTO personas SET
nombre = "Damian",
apellido = "Cuozzo",
email = "gonza@gmail.com",
cedula = 87654320,
fechaNacimiento = "2002-10-10",
telefono = "nop tengo",
genero = "Masculino",
domicilio = "La casa negra",
pais = "UY";

-- Borrar toda la tabla
DELETE FROM personas;

SELECT * FROM personas 
WHERE nombre = "Gonzalo";

SELECT nombre,apellido,cedula FROM personas 
WHERE genero = "Masculino";