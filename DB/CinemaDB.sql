CREATE DATABASE Cinema
GO

USE Cinema
GO

CREATE TABLE Usuario(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Nombre NVARCHAR(200) NOT NULL,
	ApellidoP NVARCHAR(200) NOT NULL,
	ApellidoM NVARCHAR(200) NOT NULL,
	Email NVARCHAR(200) NOT NULL,
	Username NVARCHAR(200) NOT NULL UNIQUE,
	[Password] NVARCHAR(200) NOT NULL,
	Tipo TINYINT NOT NULL DEFAULT 1, -- 0 admin, 1 comun, 2 gold, 3 platinum
	FechaNacimiento DATE NOT NULL
)
GO

CREATE TABLE Producto(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Nombre NVARCHAR(200) NOT NULL,
	PrecioUnitario MONEY NOT NULL
)
GO

CREATE TABLE Pedido(
	Id INT PRIMARY KEY IDENTITY(1,1),
	IdUsuario INT NOT NULL FOREIGN KEY REFERENCES Usuario(Id) ON DELETE CASCADE ON UPDATE CASCADE,
	PrecioTotal MONEY NOT NULL,
	FechaCompra DATETIME NOT NULL
)
GO

CREATE TABLE Producto_Pedido(
	Id INT PRIMARY KEY IDENTITY(1,1),
	IdProducto INT NOT NULL FOREIGN KEY REFERENCES Producto(Id) ON DELETE CASCADE ON UPDATE CASCADE,
	IdPedido INT NOT NULL FOREIGN KEY REFERENCES Pedido(Id) ON DELETE CASCADE ON UPDATE CASCADE,
	Cantidad INT NOT NULL
)
GO

CREATE TABLE Ticket( --es para quejas
	Id INT PRIMARY KEY IDENTITY(1,1),
	IdUsuario INT NOT NULL FOREIGN KEY REFERENCES Usuario(Id) ON DELETE CASCADE ON UPDATE CASCADE,
	Titulo NVARCHAR(200) NOT NULL,
	Motivo NVARCHAR(200) NOT NULL,
	Descripcion NVARCHAR(300),
)
GO

CREATE TABLE Sala(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Precio MONEY NOT NULL,
	NumAsientos TINYINT NOT NULL DEFAULT 200 -- segun varias fuentes el numero promedio de asientos por sala de un cine es de 200
)
GO

CREATE TABLE Proyectable(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Titulo NVARCHAR(100) NOT NULL,
	Duracion TIME NOT NULL,
	Sinopsis NVARCHAR(1000) NOT NULL,
	RutaImagen NVARCHAR(300) NOT NULL,
	Estatus TINYINT NOT NULL DEFAULT 0 -- 0 baja, 1 cartelera(normal), 2 estreno, 3 preventa
)
GO

CREATE TABLE Funcion(
	Id INT PRIMARY KEY IDENTITY(1,1),
	IdProyectable INT NOT NULL FOREIGN KEY REFERENCES Proyectable(Id) ON DELETE CASCADE ON UPDATE CASCADE,
	IdSala INT NOT NULL FOREIGN KEY REFERENCES Sala(Id) ON DELETE CASCADE ON UPDATE CASCADE,
	DiaHora DATETIME NOT NULL,
	AsientosDisponibles TINYINT NOT NULL DEFAULT 200
)
GO

CREATE TABLE Usuario_Funcion(
	Id INT PRIMARY KEY IDENTITY(1,1),
	IdUsuario INT NOT NULL FOREIGN KEY REFERENCES Usuario(Id) ON DELETE CASCADE ON UPDATE CASCADE,
	IdFuncion INT NOT NULL FOREIGN KEY REFERENCES Funcion(Id) ON DELETE CASCADE ON UPDATE CASCADE,
	FechaCompra DATE NOT NULL,
	Cantidad INT NOT NULL
)
GO

CREATE TABLE Serie(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Nombre NVARCHAR(200) NOT NULL,
	Clasificacion NVARCHAR(5) NOT NULL,
	Genero NVARCHAR(50) NOT NULL,
	Reparto NVARCHAR(300) NOT NULL
)
GO

CREATE TABLE Episodio(
	Id INT PRIMARY KEY IDENTITY(1,1),
	IdProyectable INT NOT NULL FOREIGN KEY REFERENCES Proyectable(Id) ON DELETE CASCADE ON UPDATE CASCADE,
	IdSerie INT NOT NULL FOREIGN KEY REFERENCES Serie(Id) ON DELETE CASCADE ON UPDATE CASCADE
)
GO

CREATE TABLE Pelicula(
	Id INT PRIMARY KEY IDENTITY(1,1),
	IdProyectable INT NOT NULL FOREIGN KEY REFERENCES Proyectable(Id) ON DELETE CASCADE ON UPDATE CASCADE,
	Clasificacion NVARCHAR(5) NOT NULL,
	Genero NVARCHAR(50) NOT NULL,
	Reparto NVARCHAR(300) NOT NULL
)
GO

-- Tipos de dato personalizados
CREATE TYPE Producto_Pedido_Tipo AS TABLE(
	IdProducto INT,
	Cantidad INT
)
GO