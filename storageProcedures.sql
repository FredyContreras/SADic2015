--WS03 --------------------------------------------------------------------------------------

CREATE PROCEDURE WS03 @NIT nvarchar(16), @IDUsuario integer
AS

INSERT INTO Bitacora (Fecha,TipoTransaccion,Detalle,IDUsuario)
VALUES(SYSDATETIME(),'Busqueda de cliente','Se busco el cliente con NIT '+@NIT,@IDUsuario);

SELECT * 
FROM Cliente
WHERE NIT = @NIT
GO

--LogIn --------------------------------------------------------------------------------------

CREATE PROCEDURE Ingresar @Nombre nvarchar(128), @Password nvarchar(128)
AS

DECLARE @codUsuario integer;
SELECT @codUsuario = -1

SELECT @codUsuario = IDUsuario
FROM Usuario
WHERE Nombre = @Nombre
AND Password = @Password;
IF(@codUsuario > 0) BEGIN
	INSERT INTO Bitacora (Fecha,TipoTransaccion,Detalle,IDUsuario)
	VALUES(SYSDATETIME(),'Ingreso de usuario','El usuario '+@Nombre+' ingreso al sistema',@codUsuario);
	SELECT 1;
END
ELSE BEGIN
	INSERT INTO Bitacora (Fecha,TipoTransaccion,Detalle,IDUsuario)
	VALUES(SYSDATETIME(),'Ingreso de usuario','El usuario '+@Nombre+' intento ingresar al sistema sin exito',1);
	SELECT 0;
END

