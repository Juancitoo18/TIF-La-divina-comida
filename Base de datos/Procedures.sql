USE La_Divina_Comida
GO
/*AGREGAR PRODUCTO*/
CREATE PROCEDURE spAgregarProducto (
@CodCategoria_Ct_Pr INT,
@CodTipoProducto_T_Pr INT,
@stock_Pr INT,
@NombreProducto_Pr VARCHAR(30),
@Descripcion_Pr VARCHAR(100),
@PrecioUnitario_Pr DECIMAL,
@ImagenURL_Pr VARCHAR(100)
)
AS
INSERT INTO Productos(CodCategoria_Ct_Pr,CodTipoProducto_T_Pr,stock_Pr,NombreProducto_Pr,Descripcion_Pr,PrecioUnitario_Pr,ImagenURL_Pr)
VALUES(@CodCategoria_Ct_Pr,@CodTipoProducto_T_Pr,@stock_Pr,@NombreProducto_Pr,@Descripcion_Pr,@PrecioUnitario_Pr,@ImagenURL_Pr)
RETURN
GO

/*EDITAR PRODUCTO*/
CREATE PROCEDURE spEditarProducto
(
@CodProducto_Pr INT,
@CodCategoria_Ct_Pr INT,
@CodTipoProducto_T_Pr INT,
@stock_Pr Int,
@NombreProducto_Pr VARCHAR(30),
@Descripcion_Pr VARCHAR (100),
@PrecioUnitario_Pr DECIMAL,
@ImagenURL_Pr VARCHAR(100),
@Estado_Pr BIT
)
AS
UPDATE Productos
SET
CodCategoria_Ct_Pr = @CodCategoria_Ct_Pr,
CodTipoProducto_T_Pr = @CodTipoProducto_T_Pr,
stock_Pr = @stock_Pr,
NombreProducto_Pr = @NombreProducto_Pr,
Descripcion_Pr = @Descripcion_Pr,
PrecioUnitario_Pr = @PrecioUnitario_Pr,
ImagenURL_Pr = @ImagenURL_Pr,
Estado_Pr = @Estado_Pr
WHERE CodProducto_Pr = @CodProducto_Pr
RETURN
GO

/*ELIMINAR PRODUCTO*/
CREATE PROCEDURE spEliminarProducto
(
@CodProducto_Pr INT
)
AS
UPDATE Productos
SET Estado_Pr = 0
WHERE CodProducto_Pr = @CodProducto_Pr
RETURN
GO

/*AGREGAR USUARIO*/
CREATE PROCEDURE spAgregarUsuario (
@NombreUsuario_U VARCHAR(30),
@NombreCompleto_U VARCHAR(60),
@Mail_U VARCHAR(30),
@Contrasenia_U VARCHAR(30),
@RepetirContrasenia_U VARCHAR(30)
)
AS
INSERT INTO Usuario(NombreUsuario_U,NombreCompleto_U,Mail_U,Contrasenia_U,RepetirContrasenia_U)
VALUES(@NombreUsuario_U,@NombreCompleto_U,@Mail_U,@Contrasenia_U,@RepetirContrasenia_U)
RETURN
GO

--AGREGAR FACTURA
CREATE PROCEDURE spAgregarFactura(
@CodUsuario_U_F INT,
@Total_F decimal(18, 0)
)
AS
INSERT INTO Factura(CodUsuario_U_F,fecha_F,Total_F)
VALUES(@CodUsuario_U_F,(select getdate()),@Total_F)
RETURN
GO

--AGREGAR DETALLE VENTA
CREATE PROCEDURE spAgregarDetalleVentas(
--@NrFactura_F_DV INT,
@CodProducto_Pr_DV INT,
@cantidad INT,
@PrecioUnitario decimal(18, 0)
)
AS
INSERT INTO Detalle_Venta(NrFactura_F_DV,CodProducto_Pr_DV,cantidad,PrecioUnitario)
VALUES((SELECT MAX(NrFactura_F)FROM FACTURA),@CodProducto_Pr_DV,@cantidad,@PrecioUnitario)
RETURN
GO


--ACTUALIZAR STOCK
CREATE TRIGGER tr_actualizarStock
ON Detalle_Venta
AFTER INSERT
AS
BEGIN
SET NOCOUNT ON;
UPDATE Productos set stock_Pr = stock_Pr - (SELECT cantidad FROM
INSERTED)
where CodProducto_Pr = (SELECT CodProducto_Pr_DV FROM INSERTED)
END
GO
