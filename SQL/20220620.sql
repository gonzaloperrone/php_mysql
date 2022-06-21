-- Clase 2022-06-20

SHOW TABLES;

CREATE TABLE alumnos(
documento INT(9),
nombre VARCHAR(50),
apellido VARCHAR(50),
fechaNacimiento DATE,
tipoDocumento ENUM("CI", "Pasaporte"),
PRIMARY KEY(documento)
);

CREATE TABLE tiposCursos(
	id INT(5) NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(50),
	descripcion TEXT,
	PRIMARY KEY(id)
);

CREATE TABLE profesores(
	documento INT(9),
	nombre VARCHAR(50),
	apellido VARCHAR(50),
	fechaNacimiento DATE,
	PRIMARY KEY(documento)
);

CREATE TABLE cursos(
	codigo INT(10) NOT NULL AUTO_INCREMENT,
	nombre VARCHAR(100),
	anio YEAR,
	tipoCurso INT(5),
	profesor INT(9),
	PRIMARY KEY(codigo),
	KEY cur_tipoCurso (tipoCurso),
	KEY cur_profesor (profesor),
	-- Creo la primera contraints dandole un nombre (cur_tipoCurso_fk1) y enganchando
	-- el campo "tipoCurso" de la cursos con el campo "id" de la tabla tiposCursos
	CONSTRAINT cur_tipoCurso_fk1 FOREIGN KEY (tipoCurso) REFERENCES tiposCursos(id),
	CONSTRAINT cur_profesor_fk2 FOREIGN KEY (profesor) REFERENCES profesores(documento)
);

CREATE TABLE alumnos_cursos(
	id BIGINT(10) NOT NULL AUTO_INCREMENT,
	codigoCurso INT(10),
	documento INT(9) COMMENT 'Es el documento del alumno',
	PRIMARY KEY (id),
	KEY alcur_codigoCurso (codigoCurso),
	KEY alcur_documento (documento),
	CONSTRAINT alcur_codigoCurso_fk1 FOREIGN KEY (codigoCurso) REFERENCES cursos(codigo),
	CONSTRAINT alcur_documento_fk2 FOREIGN KEY (documento) REFERENCES alumnos(documento)
);


INSERT INTO alumnos SET
	documento = "49835091",
	nombre = "Gonzalo",
	apellido = "Perrone",
	fechaNacimiento = "2000-05-04",
	tipoDocumento = "CI";

INSERT INTO alumnos SET
	documento = 10000,
	nombre = "Fabian",
	apellido = "Rofo",
	fechaNacimiento = "2009-04-05",
	tipoDocumento = "Pasaporte";

DELETE FROM alumnos;

SELECT * FROM alumnos;

INSERT INTO alumnos (documento,nombre,apellido,fechaNacimiento,tipoDocumento) VALUES
	 (235,'Sofia','Delgado','1990-05-10','CI'),
	 (531284,'Antonio','Delgado','1987-09-10','CI'),
	 (2659855,'4512351','Delgado','1890-09-03','CI'),
	 (44553128,'Damian','Delgado','1987-09-10','CI'),
	 (45781215,'Elisa','Tavarez','1950-03-07','Pasaporte'),
	 (65523694,'Anna','Delgado','1890-09-03','CI'),
	 (89715332,'Javier','Tavarez','1950-03-07','CI'),
	 (445531284,'Alfredo','Delgado','1987-09-10','CI'),
	 (456432158,'Camila','Israel','2000-03-07','Pasaporte'),
	 (456434458,'Sofia','Garcia','2001-03-07','Pasaporte');

SELECT * FROM alumnos WHERE nombre = "Damian";

SELECT * FROM alumnos WHERE apellido = "Delgado" ORDER BY documento DESC LIMIT 3;

SELECT * FROM alumnos WHERE apellido = "Delgado" ORDER BY nombre DESC LIMIT 8;

SELECT * FROM alumnos WHERE apellido = "Delgado" ORDER BY fechaNacimiento DESC LIMIT 8;

SELECT * FROM alumnos ORDER BY tipoDocumento;

SELECT * FROM alumnos WHERE nombre LIKE ("%ian");

SELECT * FROM alumnos WHERE nombre LIKE ("%ia%");

SELECT * FROM alumnos WHERE nombre LIKE ("S%ia%");

SELECT * FROM alumnos WHERE fechaNacimiento > "2000-01-01";

SELECT * FROM alumnos WHERE fechaNacimiento > "1987-01-01" AND apellido = "delgado";

SELECT * FROM alumnos WHERE fechaNacimiento > "1985-01-01" AND fechaNacimiento < "2000-01-01";

SELECT * FROM alumnos WHERE fechaNacimiento BETWEEN "1985-01-01" AND "2000-01-01";

SELECT * FROM alumnos WHERE fechaNacimiento 
		BETWEEN "1985-01-01" AND "2010-01-01"
		ORDER BY apellido DESC,nombre ASC;

SELECT documento,nombre,apellido FROM alumnos;

SELECT documento AS numero_documento,nombre,apellido FROM alumnos;
	
SELECT tipoDocumento  FROM alumnos GROUP BY tipoDocumento;

SELECT apellido  FROM alumnos GROUP BY apellido ;

SELECT nombre,apellido  FROM alumnos GROUP BY nombre,apellido ;

SELECT count(*) AS total FROM alumnos;

SELECT count(*) AS total FROM alumnos WHERE apellido LIKE ("%del%");

SELECT tipoDocumento, count(tipoDocumento) AS total  FROM alumnos GROUP BY tipoDocumento;

UPDATE alumnos SET
	nombre = "Gimena"
	WHERE documento = "123";
	
SELECT * FROM alumnos;

DELETE FROM alumnos WHERE documento = "123";

TRUNCATE TABLE alumnos;

SELECT  * FROM alumnos WHERE apellido != "delgado";

SELECT  * FROM alumnos WHERE apellido NOT LIKE "%ado";

SELECT * FROM alumnos WHERE apellido = "tavarez" OR apellido = "ronaldo";

SELECT * FROM alumnos WHERE apellido IN ("TAVAREZ","Ronaldo");

SELECT * FROM alumnos WHERE apellido NOT IN ("TAVAREZ","Ronaldo");


SELECT [Campos] 
	FROM [tabla]
	JOIN [tabla]
	WHERE [Condiociones]
    GROUP BY [campos]
	ORDER BY [campos]
	LIMIT [Punto de salida, cantidad de registro]
	HAVING [Filtros despues del resultado de los campos]
