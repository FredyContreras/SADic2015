--WS02 --------------------------------------------------------------------------------------
CREATE PROCEDURE WS02 @NIT varchar(16)
					,@Nombre varchar(128)
					,@Telefono integer
					,@Direccion varchar(128)
					,@IDUsuario integer
AS
DECLARE @usuario varchar(128);
SELECT @usuario = Nombre From Usuario where IDUsuario = @IDUsuario;
INSERT INTO Cliente (NIT,Nombre,Telefono,Direccion)
VALUES(@NIT,@Nombre,@Telefono,@Direccion);
INSERT INTO Bitacora (Fecha,TipoTransaccion,Detalle,IDUsuario)
VALUES(SYSDATETIME()
	,'Creacion de cliente'
	,'El usuario '+@Usuario+' agrego al cliente '+@Nombre
	,@IDUsuario);
SELECT @IDUsuario;
GO

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
GO

