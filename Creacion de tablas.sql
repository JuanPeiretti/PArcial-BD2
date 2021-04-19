CREATE TABLE participante(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    legajo INT,
    nombre VARCHAR(50)
);

CREATE TABLE rol(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);

CREATE TABLE proyecto(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
);

CREATE TABLE participacion(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    participante_legajo INT,
    participante_nombre VARCHAR(50),
    proyecto_nombre VARCHAR(50),
    rol_nombre VARCHAR(50)
);

CREATE TABLE asignacion (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	id_participacion INT,
	cantidad_horas_dia INT,
	dias VARCHAR (50),
	participante_legajo INT
)

CREATE TABLE dia(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR (50) 
)
practico
