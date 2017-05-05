PRAGMA foreign_keys = ON; --establece la integridad referencial

--creación de las tablas

DROP TABLE IF EXISTS alumno;
CREATE TABLE alumno (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT,
        apellidos TEXT
);

DROP TABLE IF EXISTS modulo;
CREATE TABLE modulo (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT,
        numeroHoras INTEGER
);

DROP TABLE IF EXISTS curso;
CREATE TABLE curso (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT,
        aula TEXT
);

DROP TABLE IF EXISTS evaluacion;
CREATE TABLE evaluacion (
        idAlumno INTEGER,
        idModulo INTEGER,
        idCurso INTEGER,
        notas INTEGER,
        PRIMARY KEY(idAlumno,idModulo,idCurso),
        FOREIGN KEY(idAlumno) REFERENCES alumno(id) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY(idModulo) REFERENCES modulo(id) ON DELETE CASCADE ON UPDATE CASCADE,
        FOREIGN KEY(idCurso) REFERENCES curso(id) ON DELETE CASCADE ON UPDATE CASCADE
);

--creación del índice
CREATE INDEX apell ON alumno(apellidos);INSERT INTO alumno (nombre,apellidos) VALUES ("Juan", "García Paniagua");

--insercción de datos

--tabla aluno
INSERT INTO alumno (nombre,apellidos) VALUES ("Pedro", "Buendía García");
INSERT INTO alumno (nombre,apellidos) VALUES ("Jacinto", "Piedra Hita");
INSERT INTO alumno (nombre,apellidos) VALUES ("Pedro", "Nuñez García");
INSERT INTO alumno (nombre,apellidos) VALUES ("Inmaculada", "Beñat Polonia");
INSERT INTO alumno (nombre,apellidos) VALUES ("Rocío", "Cornejo García");
INSERT INTO alumno (nombre,apellidos) VALUES ("Victoria", "Buendía Benito");
INSERT INTO alumno (nombre,apellidos) VALUES ("Mª Dolores", "Molinos Codoba");
INSERT INTO alumno (nombre,apellidos) VALUES ("Alejandro ", "Zapatero Aznar");
INSERT INTO alumno (nombre,apellidos) VALUES ("Ángel", "Gómez Gómez");
INSERT INTO alumno (nombre,apellidos) VALUES ("Luisa", "Peralez Santiago");
INSERT INTO alumno (nombre,apellidos) VALUES ("Felix", "Barou García-Concha");
INSERT INTO alumno (nombre,apellidos) VALUES ("Samuel", "García Fernández");

--tabla modulo

INSERT INTO modulo (nombre,numeroHoras) VALUES ("Base de datos", 8);
INSERT INTO modulo (nombre,numeroHoras) VALUES ("Programación", 8);
INSERT INTO modulo (nombre,numeroHoras) VALUES ("Lenguajes de marcas", 4);


--tabla curso
INSERT INTO curso (nombre, aula) VALUES ("Segundo A", "Aula 1");
INSERT INTO curso (nombre, aula) VALUES ("Segundo B", "Aula 2");


--tabla evaluacion
INSERT INTO evaluacion VALUES (1,1,1,5);
INSERT INTO evaluacion VALUES (1,2,1,6);
INSERT INTO evaluacion VALUES (1,3,1,4);
INSERT INTO evaluacion VALUES (2,1,1,4);
INSERT INTO evaluacion VALUES (2,2,1,5);
INSERT INTO evaluacion VALUES (2,3,1,6);
INSERT INTO evaluacion VALUES (3,1,1,6);
INSERT INTO evaluacion VALUES (3,2,1,1);
INSERT INTO evaluacion VALUES (3,3,1,10);
INSERT INTO evaluacion VALUES (4,1,1,5);
INSERT INTO evaluacion VALUES (4,2,1,6);
INSERT INTO evaluacion VALUES (4,3,1,1);
INSERT INTO evaluacion VALUES (5,1,1,6);
INSERT INTO evaluacion VALUES (5,2,1,6);
INSERT INTO evaluacion VALUES (5,3,1,6);
INSERT INTO evaluacion VALUES (6,1,1,2);
INSERT INTO evaluacion VALUES (6,2,1,8);
INSERT INTO evaluacion VALUES (6,3,1,7);
INSERT INTO evaluacion VALUES (7,1,1,6);
INSERT INTO evaluacion VALUES (7,2,1,6);
INSERT INTO evaluacion VALUES (7,3,1,6);
INSERT INTO evaluacion VALUES (8,1,1,3);
INSERT INTO evaluacion VALUES (8,2,1,0);
INSERT INTO evaluacion VALUES (8,3,1,1);
INSERT INTO evaluacion VALUES (9,1,2,6);
INSERT INTO evaluacion VALUES (9,2,2,6);
INSERT INTO evaluacion VALUES (9,3,2,6);
INSERT INTO evaluacion VALUES (10,1,2,1);
INSERT INTO evaluacion VALUES (10,2,2,1);
INSERT INTO evaluacion VALUES (10,3,2,1);
INSERT INTO evaluacion VALUES (11,1,2,6);
INSERT INTO evaluacion VALUES (11,2,2,8);
INSERT INTO evaluacion VALUES (11,3,2,9);
INSERT INTO evaluacion VALUES (12,1,2,9);
INSERT INTO evaluacion VALUES (12,2,2,10);
INSERT INTO evaluacion VALUES (12,3,2,3);
INSERT INTO evaluacion VALUES (13,1,2,3);
INSERT INTO evaluacion VALUES (13,2,2,3);
INSERT INTO evaluacion VALUES (13,3,2,4);

--creacion de vistas
CREATE VIEW bd_2A AS select alumno.nombre, alumno.apellidos, evaluacion.notas from alumno, curso, modulo, evaluacion where alumno.id=evaluacion.idAlumno and curso.id=evaluacion.idCurso and modulo.id=evaluacion.idModulo and modulo.nombre="Base de datos" and curso.nombre='Segundo A';DROP TABLE IF EXISTS historial;

--creación de trigger
CREATE TABLE historial (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        nombre TEXT,
        apellidos TEXT,
	fecha_baja TEXT
);

DROP TRIGGER IF EXISTS borrado;
CREATE TRIGGER borrado BEFORE DELETE
ON alumno
BEGIN
	INSERT INTO historial (nombre, apellidos, fecha_baja) VALUES (old.nombre, old.apellidos, datetime('now'));
END;
