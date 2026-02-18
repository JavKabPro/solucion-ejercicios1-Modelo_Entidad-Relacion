CREATE DATABASE cooperativa; -- Creamos la base de datos

USE cooperativa; -- Opcional, pero es mejor indicar con lo que vas a trabajar

/*======================================*/
/*- Creamos las tablas independientes --*/
/*======================================*/

CREATE TABLE Empresa(					-- CREAMOS LA TABLA "Empresa"
	Id INT IDENTITY (1,1) PRIMARY KEY,	-- Las columnas se llenan con autoincremento en el id, la misma como clave primaria
	Nombre VARCHAR(100) NOT NULL,
	Correo VARCHAR(50),
	Telefono VARCHAR(20),
	Direccion VARCHAR(50),
	);

CREATE TABLE Modalidad(					-- CREAMOS LA TABLA "Modalidad"
	Id INT IDENTITY (1,1) PRIMARY KEY,
	Tipo VARCHAR(50) NOT NULL,
	PlazoMaximo INT NOT NULL,			-- en meses
	TasaInteres DECIMAL(5,2) NOT NULL	-- en porcentaje
	);

CREATE TABLE Socio(						-- CREAMOS LA TABLA "Socio"
	Id INT IDENTITY (1,1) PRIMARY KEY,
	Nombre VARCHAR(50) NOT NULL,
	FechaNacimiento DATE NOT NULL
	);

CREATE TABLE Prestamo(					-- CREAMOS LA TABLA "Prestamo"
	Id INT IDENTITY (1,1) PRIMARY KEY,
	Valor DECIMAL(12,2) NOT NULL,
	FechaInicio DATETIME NOT NULL,
	PlazoMeses INT NOT NULL
	);

CREATE TABLE Codeudor(					-- CREAMOS LA TABLA "Codeudor"
	Id INT IDENTITY (1,1) PRIMARY KEY,	-- 
	Nombre VARCHAR(100) NOT NULL,
	Salario DECIMAL(12,2) NOT NULL,
	Telefono VARCHAR(20),
	Direccion VARCHAR(50)
	);
/*****************************/
/* Agregamos claves foráneas */
/*****************************/
ALTER TABLE Prestamo 
ADD IdEmpresa INT NOT NULL;
ALTER TABLE Prestamo
ADD CONSTRAINT FK_Prestamo_Empresa				-- El enunciado dice que cada préstamo pertenece a una modalidad 
FOREIGN KEY (IdEmpresa) REFERENCES Empresa(Id); -- (vivienda, vehículo, etc.).

ALTER TABLE Socio 
ADD IdEmpresa INT NOT NULL;
ALTER TABLE Socio
ADD CONSTRAINT FK_Socio_Empresa			
FOREIGN KEY (IdEmpresa) REFERENCES Empresa(Id); 

ALTER TABLE Prestamo 
ADD IdSocio INT NOT NULL;
ALTER TABLE Prestamo
ADD CONSTRAINT FK_Prestamo_Socio			
FOREIGN KEY (IdSocio) REFERENCES Socio(Id); 

ALTER TABLE Prestamo 
ADD IdModalidad INT NOT NULL;
ALTER TABLE Prestamo
ADD CONSTRAINT FK_Prestamo_Modalidad			
FOREIGN KEY (IdModalidad) REFERENCES Modalidad(Id); 

ALTER TABLE Prestamo 
ADD IdCodeudor INT NOT NULL;
ALTER TABLE Prestamo
ADD CONSTRAINT FK_Prestamo_Codeudor			
FOREIGN KEY (IdCodeudor) REFERENCES Codeudor(Id); 