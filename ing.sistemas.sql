CREATE DATABASE proyectparcial;
USE proyectparcial;

CREATE TABLE Alumnos (
    id_alumno INT PRIMARY KEY,
    nombre_alumno VARCHAR(50),
    apellido_paterno VARCHAR(50),
    apellido_materno VARCHAR(50)
);

CREATE TABLE Grupos (
    id_grupo INT PRIMARY KEY,
    nombre_grupo VARCHAR(20)
);

CREATE TABLE Semestre (
    id_semestre INT PRIMARY KEY,
    semestre VARCHAR(10)
);

CREATE TABLE Materias (
    id_materia INT PRIMARY KEY,
    materia VARCHAR(30),
    numerocredito INT
);

CREATE TABLE Maestros (
    id_maestro INT PRIMARY KEY,
    nombre VARCHAR(20),
    apellidopaterno VARCHAR(20),
    apellidomaterno VARCHAR(20)
);

CREATE TABLE Rol (
id_rol INT PRIMARY KEY,
nombrerol VARCHAR (50)
);

CREATE TABLE Permisos (
id_permisos INT PRIMARY KEY,
nombreoperacion VARCHAR (50)
);

CREATE TABLE UsuariosAlumnos (
    id_usuarioalumno INT PRIMARY KEY,
    email VARCHAR (50),
    contraseña VARCHAR (50),
    id_rol INT,
    id_alumno INT,
    FOREIGN KEY (id_rol) REFERENCES Rol (id_rol),
	FOREIGN KEY (id_alumno) REFERENCES Alumnos (id_alumno)
);

CREATE TABLE RolAccion (
    id_rolaccion INT PRIMARY KEY,
    id_permisos INT,
    id_rol INT,
    FOREIGN KEY (id_permisos) REFERENCES Permisos (id_permisos),
	FOREIGN KEY (id_rol) REFERENCES Rol (id_rol)
);

CREATE TABLE UsuarioMaestro (
    id_usuariomaestro INT PRIMARY KEY,
    email VARCHAR (50),
    contraseña VARCHAR (50),
    id_rol INT,
    id_maestro INT,
    FOREIGN KEY (id_rol) REFERENCES Rol (id_rol),
    FOREIGN KEY (id_maestro) REFERENCES Maestros (id_maestro)
);

CREATE TABLE GrupoSemestral (
    id_gruposemestral INT PRIMARY KEY,
    id_grupo INT,
    id_semestre INT,
    FOREIGN KEY (id_grupo) REFERENCES Grupos (id_grupo),
    FOREIGN KEY (id_semestre) REFERENCES Semestre (id_semestre)
);

CREATE TABLE MateriasImpartidas (
    id_materiaimpartidas INT PRIMARY KEY,
    id_maestro INT,
    id_materia INT,
    FOREIGN KEY (id_maestro) REFERENCES Maestros (id_maestro),
    FOREIGN KEY (id_materia) REFERENCES Materias (id_materia)
);

CREATE TABLE MaestrosGrupo (
    id_maestrogrupal INT PRIMARY KEY,
    id_gruposemestral INT,
    id_materiasimpartidas INT,
    FOREIGN KEY (id_gruposemestral) REFERENCES GrupoSemestral (id_gruposemestral),
    FOREIGN KEY (id_materiasimpartidas) REFERENCES MateriasImpartidas (id_materiaimpartidas)
);

CREATE TABLE AlumnosClases (
    id_alumnos_clases INT PRIMARY KEY,
    id_alumno INT,
    id_maestrogrupal INT,
    FOREIGN KEY (id_alumno) REFERENCES Alumnos (id_alumno),
    FOREIGN KEY (id_maestrogrupal) REFERENCES MaestrosGrupo (id_maestrogrupal)
);

CREATE TABLE Calificaciones (
    id_calificacionesparciales INT PRIMARY KEY,
    primer_parcial FLOAT,
    segundo_parcial FLOAT,
    tercer_pacrcial FLOAT,
    id_alumnos_clases INT,
    FOREIGN KEY (id_alumnos_clases) REFERENCES AlumnosClases (id_alumnos_clases)
);


