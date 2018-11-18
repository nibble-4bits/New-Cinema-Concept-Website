USE Cinema
GO

-- Usuarios
EXEC dbo.sp_RegistrarUsuario 'Luis Andrés', 'De Anda', 'Cuéllar', 'ldeanda@gmail.com', 'nullptr', 'mipass', '1998-04-03'
EXEC dbo.sp_RegistrarUsuario 'Jorge Arturo', 'Rangel', 'Luna', 'jarangel@gmail.com', 'elYorch', 'supass', '1999-03-11'
GO

-- Productos
INSERT INTO Producto(Nombre, PrecioUnitario)
			VALUES('Palomitas chicas', 37.99),
				  ('Palomitas medianas', 47.99),
				  ('Refresco de 355ml', 25.99),
				  ('Hot-Dog', 29.99)
GO