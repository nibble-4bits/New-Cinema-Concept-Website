USE Cinema
GO

CREATE PROCEDURE dbo.sp_RegistrarUsuario
@Nombre NVARCHAR(200), @ApellidoP NVARCHAR(200),
@ApellidoM NVARCHAR(200), @Email NVARCHAR(200),
@Username NVARCHAR(200), @Password NVARCHAR(200),
@FechaNacimiento DATE
AS
	INSERT INTO Usuario(Nombre, ApellidoP, ApellidoM, Email, Username, [Password], FechaNacimiento)
	VALUES(@Nombre, @ApellidoP, @ApellidoM, @Email, @Username, @Password, @FechaNacimiento)

	SELECT * 
	FROM Usuario
	WHERE Id = (SELECT MAX(Id) FROM Usuario)
GO

CREATE PROCEDURE dbo.sp_ActualizarUsuario
@Id INT, @Nombre NVARCHAR(200) = NULL, 
@ApellidoP NVARCHAR(200) = NULL, @ApellidoM NVARCHAR(200) = NULL, 
@Email NVARCHAR(200) = NULL, @Password NVARCHAR(200) = NULL
AS
	UPDATE Usuario
	SET Nombre = ISNULL(@Nombre, Nombre),
		ApellidoP = ISNULL(@ApellidoP, ApellidoP),
		ApellidoM = ISNULL(@ApellidoM, ApellidoM),
		Email = ISNULL(@Email, Email),
		[Password] = ISNULL(@Password, [Password])
	WHERE Id = @Id
GO

CREATE PROCEDURE dbo.sp_CambiarTipoUsuario
@IdUsuario INT, @Tipo INT
AS
	UPDATE Usuario
	SET Tipo = @Tipo
	WHERE Id = @IdUsuario
GO