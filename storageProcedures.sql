--WS03

CREATE PROCEDURE WS03 @NIT nvarchar(30), @IDUsuario integer
AS

INSERT INTO Bitacora (Fecha,TipoTransaccion,Detalle,IDUsuario)
VALUES(SYSDATETIME(),'Busqueda de cliente','Se busco el cliente con NIT '+@NIT,@IDUsuario);

SELECT * 
FROM Cliente
WHERE NIT = @NIT
GO
