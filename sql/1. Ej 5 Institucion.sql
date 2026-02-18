CREATE DATABASE InstucionEducativa; -- Error al nombra la base de datos

ALTER DATABASE InstucionEducativa
MODIFY NAME = InstitucionEducativa; -- Instruccion para corregir el nombre

USE InstitucionEducativa;

/*======================================*/
/*- Creamos las tablas independientes --*/
/*======================================*/

CREATE TABLE Estudiante(				-- Creamos la tabla "Estudiante"
	Id INT IDENTITY (1,1) PRIMARY KEY,	-- Las columnas se llenan con autoincremento en el id, la misma como clave primaria
	Nombre VARCHAR(100) NOT NULL,
	Apellido VARCHAR(100),
	Telefono VARCHAR(20),
	Direccion VARCHAR(50),
	);

CREATE TABLE PeriodoAcademico(			-- Creamos la tabla "PeriodoAcadémico"
	Id INT IDENTITY (1,1) PRIMARY KEY,	
	Semestre INT NOT NULL,
	Fecha DATE NOT NULL,
	);

CREATE TABLE Materia(					-- Creamos la tabla "Materia"
	Id INT IDENTITY (1,1) PRIMARY KEY,	
	Nombre VARCHAR(50) NOT NULL,
	IdPeriodoAcademico INT NOT NULL,
	CONSTRAINT FK_Materia_PeriodoAcademico
	FOREIGN KEY (IdPeriodoAcademico) REFERENCES PeriodoAcademico(Id)
	);

CREATE TABLE Calificacion(				-- Creamos la tabla "Calificacion"
	Id INT IDENTITY (1,1) PRIMARY KEY,	
	Nota DECIMAL(5,2) NOT NULL,
	Tipo VARCHAR(20),
	IdEstudiante INT NOT NULL,
	IdMateria INT NOT NULL,
	CONSTRAINT FK_Calificacion_Estudiante
	FOREIGN KEY (IdEstudiante) REFERENCES Estudiante(Id),
	CONSTRAINT FK_Calificacion_Materia
	FOREIGN KEY (IdMateria) REFERENCES Materia(Id)
	);
