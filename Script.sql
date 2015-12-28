CREATE
  TABLE Bitacora
  (
    IDBitacora      INTEGER IDENTITY(1,1) NOT NULL ,
    Fecha           DATETIME NOT NULL ,
    TipoTransaccion VARCHAR (32) NOT NULL ,
    Detalle         VARCHAR (256) NOT NULL ,
    IDUsuario       INTEGER NOT NULL
  )
  ON "default"
GO
ALTER TABLE Bitacora ADD CONSTRAINT Bitacora_PK PRIMARY KEY CLUSTERED (
IDBitacora)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
GO

CREATE
  TABLE Cliente
  (
    IDCliente INTEGER IDENTITY(1,1) NOT NULL ,
    Nombre    VARCHAR (128) NOT NULL ,
    NIT       VARCHAR (16) NOT NULL ,
    Direccion VARCHAR (128) NOT NULL ,
    Telefono  INTEGER NOT NULL
  )
  ON "default"
GO
ALTER TABLE Cliente ADD CONSTRAINT Cliente_PK PRIMARY KEY CLUSTERED (IDCliente)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
GO

CREATE
  TABLE Compra
  (
    IDCompra   INTEGER IDENTITY(1,1) NOT NULL ,
    Fecha      DATETIME NOT NULL ,
    Destino    VARCHAR (128) NOT NULL ,
    Estado     VARCHAR (32) NOT NULL ,
    TipoPago   VARCHAR (16) NOT NULL ,
    Total      DECIMAL (8,2) NOT NULL ,
    IDUsuario  INTEGER NOT NULL ,
    IDFarmacia INTEGER NOT NULL ,
    IDCliente  INTEGER NOT NULL
  )
  ON "default"
GO
ALTER TABLE Compra ADD CONSTRAINT Compra_PK PRIMARY KEY CLUSTERED (IDCompra)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
GO

CREATE
  TABLE DetalleCompra
  (
    IDDetalle     INTEGER IDENTITY(1,1) NOT NULL ,
    Cantidad      INTEGER NOT NULL ,
    IDCompra      INTEGER NOT NULL ,
    IDInventario  INTEGER NOT NULL ,
    IDMEdicamento INTEGER NOT NULL
  )
  ON "default"
GO
ALTER TABLE DetalleCompra ADD CONSTRAINT DetalleCompra_PK PRIMARY KEY CLUSTERED
(IDDetalle)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
GO

CREATE
  TABLE Farmacia
  (
    IDFarmacia INTEGER IDENTITY(1,1) NOT NULL ,
    Nombre     VARCHAR (64) NOT NULL ,
    Direccion  VARCHAR (128) NOT NULL
  )
  ON "default"
GO
ALTER TABLE Farmacia ADD CONSTRAINT Farmacia_PK PRIMARY KEY CLUSTERED (
IDFarmacia)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
GO

CREATE
  TABLE Inventario
  (
    IDInventario  INTEGER IDENTITY(1,1) NOT NULL ,
    Cantidad      INTEGER NOT NULL ,
    IDFarmacia    INTEGER NOT NULL ,
    IDMEdicamento INTEGER NOT NULL
  )
  ON "default"
GO
ALTER TABLE Inventario ADD CONSTRAINT Inventario_PK PRIMARY KEY CLUSTERED (
IDInventario)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
GO

CREATE
  TABLE Medicamento
  (
    IDMEdicamento   INTEGER IDENTITY(1,1) NOT NULL ,
    NombreComercial VARCHAR (128) NOT NULL ,
    NombreGenerico  VARCHAR (128) NOT NULL ,
    Precio          DECIMAL (8,2) NOT NULL
  )
  ON "default"
GO
ALTER TABLE Medicamento ADD CONSTRAINT Medicamento_PK PRIMARY KEY CLUSTERED (
IDMEdicamento)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
GO

CREATE
  TABLE Usuario
  (
    IDUsuario INTEGER IDENTITY(1,1) NOT NULL ,
    Nombre    VARCHAR (128) NOT NULL ,
    Rol       VARCHAR (64) NOT NULL ,
    Password  VARCHAR (16) NOT NULL
  )
  ON "default"
GO
ALTER TABLE Usuario ADD CONSTRAINT Usuario_PK PRIMARY KEY CLUSTERED (IDUsuario)
WITH
  (
    ALLOW_PAGE_LOCKS = ON ,
    ALLOW_ROW_LOCKS  = ON
  )
  ON "default"
GO

ALTER TABLE Bitacora
ADD CONSTRAINT Bitacora_Usuario_FK FOREIGN KEY
(
IDUsuario
)
REFERENCES Usuario
(
IDUsuario
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE Compra
ADD CONSTRAINT Compra_Cliente_FK FOREIGN KEY
(
IDCliente
)
REFERENCES Cliente
(
IDCliente
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE Compra
ADD CONSTRAINT Compra_Farmacia_FK FOREIGN KEY
(
IDFarmacia
)
REFERENCES Farmacia
(
IDFarmacia
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE Compra
ADD CONSTRAINT Compra_Usuario_FK FOREIGN KEY
(
IDUsuario
)
REFERENCES Usuario
(
IDUsuario
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE DetalleCompra
ADD CONSTRAINT DetalleCompra_Compra_FK FOREIGN KEY
(
IDCompra
)
REFERENCES Compra
(
IDCompra
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE DetalleCompra
ADD CONSTRAINT DetalleCompra_Inventario_FK FOREIGN KEY
(
IDInventario
)
REFERENCES Inventario
(
IDInventario
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE DetalleCompra
ADD CONSTRAINT DetalleCompra_Medicamento_FK FOREIGN KEY
(
IDMEdicamento
)
REFERENCES Medicamento
(
IDMEdicamento
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE Inventario
ADD CONSTRAINT Inventario_Farmacia_FK FOREIGN KEY
(
IDFarmacia
)
REFERENCES Farmacia
(
IDFarmacia
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

ALTER TABLE Inventario
ADD CONSTRAINT Inventario_Medicamento_FK FOREIGN KEY
(
IDMEdicamento
)
REFERENCES Medicamento
(
IDMEdicamento
)
ON
DELETE
  NO ACTION ON
UPDATE NO ACTION
GO

INSERT INTO Usuario (Nombre,Rol,Password) Values('Sistema','Administrador','noentrar');
