USE Cinema
GO

--ADMIN SP PARA CONSULTAR GANANCIAS (HOY Y MES) (CONSULTA)
alter PROCEDURE [dbo].[sp_ConsultaGanancias]
@MesD INT 
AS
BEGIN
SET NOCOUNT ON;
DECLARE @TotalAlimentos MONEY
DECLARE @TotalBoletos MONEY
DECLARE @Fecha1 INT
DECLARE @Fecha2 INT
DECLARE @FechaInicio NVARCHAR(10)
DECLARE @FechaFinal NVARCHAR(10)
SET @Fecha1 = YEAR(GETDATE())
SET @Fecha2 = YEAR(GETDATE())
IF (@MesD = 1)
BEGIN
SET @FechaInicio = (SELECT CAST(@Fecha1 AS NVARCHAR(4)))
SET @FechaFinal = (SELECT CAST(@Fecha2 AS NVARCHAR(4)))
SET @FechaInicio = @FechaInicio + '/01/01';
SET @FechaFinal = @FechaFinal + '/01/31';
END
	
IF (@MesD = 2)
BEGIN
SET @FechaInicio = (SELECT CAST(@Fecha1 AS NVARCHAR(4)))
SET @FechaFinal = (SELECT CAST(@Fecha2 AS NVARCHAR(4)))
SET @FechaInicio = @FechaInicio + '/02/01';
SET @FechaFinal = @FechaFinal + '/02/28';
END
	 
IF (@MesD = 3)
BEGIN
SET @FechaInicio = (SELECT CAST(@Fecha1 AS NVARCHAR(4)))
SET @FechaFinal = (SELECT CAST(@Fecha2 AS NVARCHAR(4)))
SET @FechaInicio = @FechaInicio + '/03/01';
SET @FechaFinal = @FechaFinal + '/03/31';	
END
	 
IF (@MesD = 4 )
BEGIN
SET @FechaInicio = (SELECT CAST(@Fecha1 AS NVARCHAR(4)))
SET @FechaFinal = (SELECT CAST(@Fecha2 AS NVARCHAR(4)))
SET @FechaInicio = @FechaInicio + '/04/01';
SET @FechaFinal = @FechaFinal +'/04/30';	
END
	 
IF (@MesD = 5 )
BEGIN
SET @FechaInicio = (SELECT CAST(@Fecha1 AS NVARCHAR(4)))
SET @FechaFinal = (SELECT CAST(@Fecha2 AS NVARCHAR(4)))
SET @FechaInicio = @FechaInicio + '/05/01';
SET @FechaFinal = @FechaFinal + '/05/31';	
END
	 
IF (@MesD = 6)
BEGIN
SET @FechaInicio = (SELECT CAST(@Fecha1 AS NVARCHAR(4)))
SET @FechaFinal = (SELECT CAST(@Fecha2 AS NVARCHAR(4)))
SET @FechaInicio = @FechaInicio + '/06/01';
SET @FechaFinal =  @FechaFinal + '/06/30';	
END
	 
IF (@MesD = 7)
BEGIN
SET @FechaInicio = (SELECT CAST(@Fecha1 AS NVARCHAR(4)))
SET @FechaFinal = (SELECT CAST(@Fecha2 AS NVARCHAR(4)))
SET @FechaInicio = @FechaInicio + '/07/01';
SET @FechaFinal = @FechaFinal + '/07/31';	
END
	 
IF (@MesD = 8)
BEGIN
SET @FechaInicio = (SELECT CAST(@Fecha1 AS NVARCHAR(4)))
SET @FechaFinal = (SELECT CAST(@Fecha2 AS NVARCHAR(4)))
SET @FechaInicio = @FechaInicio + '/08/01';
SET @FechaFinal = @FechaFinal +'/08/31';	
END 

IF (@MesD = 9)
BEGIN
SET @FechaInicio = (SELECT CAST(@Fecha1 AS NVARCHAR(4)))
SET @FechaFinal = (SELECT CAST(@Fecha2 AS NVARCHAR(4)))
SET @FechaInicio = @FechaInicio + '/09/01';
SET @FechaFinal = @FechaFinal + '/09/30';	
END
	 
IF (@MesD = 10)
BEGIN
SET @FechaInicio = (SELECT CAST(@Fecha1 AS NVARCHAR(4)))
SET @FechaFinal = (SELECT CAST(@Fecha2 AS NVARCHAR(4)))
SET @FechaInicio = @FechaInicio + '/10/01';
SET @FechaFinal = @FechaFinal +'/10/31';	
END
	 
IF (@MesD = 11)
BEGIN
SET @FechaInicio = (SELECT CAST(@Fecha1 AS NVARCHAR(4)))
SET @FechaFinal = (SELECT CAST(@Fecha2 AS NVARCHAR(4)))
SET @FechaInicio = @FechaInicio + '/11/01';
SET @FechaFinal = @FechaFinal + '/11/30';	
END
	 
IF (@MesD = 12)
BEGIN
SET @FechaInicio = (SELECT CAST(@Fecha1 AS NVARCHAR(4)))
SET @FechaFinal = (SELECT CAST(@Fecha2 AS NVARCHAR(4)))
SET @FechaInicio = @FechaInicio + '/12/01';
SET @FechaFinal = @FechaFinal + '/12/31';
END
SET @TotalAlimentos = (SELECT SUM(PrecioTotal) FROM Pedido WHERE
FechaCompra BETWEEN @FechaInicio AND @FechaFinal)

SET @TotalBoletos = (SELECT SUM(UF.Cantidad * S.Precio) FROM Usuario_Funcion UF INNER
JOIN Funcion F ON UF.IdFuncion = F.Id INNER JOIN Sala S ON F.IdSala = S.Id WHERE FechaCompra BETWEEN 
(SELECT CONVERT (NVARCHAR(10), @FechaInicio)) AND (SELECT CONVERT (NVARCHAR(10) ,@FechaFinal)))

SELECT (SELECT @TotalAlimentos) 'TotalAlimentos',
(SELECT @TotalBoletos) 'TotalBoletos'

END
GO

--SP PARA CONSULTAR CUANTOS USUARIOS HAY DE CADA TIPO
CREATE PROCEDURE [dbo].[sp_TipoUsuarios]
AS
	SELECT Tipo, COUNT(Tipo) 'Cantidad'
	FROM Usuario 
	GROUP BY Tipo
GO