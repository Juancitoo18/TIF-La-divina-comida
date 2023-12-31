CREATE DATABASE La_Divina_Comida
GO

USE La_Divina_Comida
GO

CREATE TABLE Usuario(
	CodUsuario_U INT IDENTITY(1,1) NOT NULL,
	NombreUsuario_U VARCHAR(30) NOT NULL,
	NombreCompleto_U VARCHAR(60) NOT NULL,
	Mail_U VARCHAR (30) NOT NULL,
	Contrasenia_U VARCHAR(30) NOT NULL,
	RepetirContrasenia_U VARCHAR(30) NOT NULL,
	Rol_U VARCHAR(3) DEFAULT 'USU',
	Dni_U VARCHAR(8) NULL,
	Edad_U INT NULL,
	Telefono_U INT NULL,
	Direccion_U VARCHAR(40) NULL,
	Img_Perfil_URL_U varchar(100) DEFAULT '~/img/Perfill.jpeg',
	Estado_U BIT DEFAULT 1,
	CONSTRAINT PK_Usuario PRIMARY KEY (CodUsuario_U)
)


CREATE TABLE Categoria(
	CodCategoria_Ct INT IDENTITY(1,1) NOT NULL,
	Nombre_Ct VARCHAR(30) NOT NULL,
	Estado_C BIT DEFAULT 1,
	CONSTRAINT PK_Categoria PRIMARY KEY (CodCategoria_Ct)
)
Go

CREATE TABLE Tipo(
	CodTipo_T INT IDENTITY(1,1) NOT NULL,
	Nombre_T VARCHAR(30) NOT NULL,
	Estado_T BIT DEFAULT 1,
	CONSTRAINT PK_Tipo PRIMARY KEY (CodTipo_T)
)
Go

CREATE TABLE Productos(
	CodProducto_Pr INT IDENTITY(1,1) NOT NULL,
	CodCategoria_Ct_Pr INT NOT NULL,
	CodTipoProducto_T_Pr INT NOT NULL,
	stock_Pr INT NOT NULL,
	NombreProducto_Pr VARCHAR (50) NOT NULL,
	Descripcion_Pr VARCHAR(100) NOT NULL,
	PrecioUnitario_Pr DECIMAL NOT NULL,
	ImagenURL_Pr varchar(100) NOT NULL,
	Estado_Pr BIT DEFAULT 1,
	CONSTRAINT PK_Productos PRIMARY KEY (CodProducto_Pr),
	CONSTRAINT FK_Productos_Categoria FOREIGN KEY (CodCategoria_Ct_Pr) REFERENCES Categoria(CodCategoria_Ct),
	CONSTRAINT FK_Productos_Tipo FOREIGN KEY (CodTipoProducto_T_Pr) REFERENCES Tipo(CodTipo_T)
)
Go

CREATE TABLE Factura(
	NrFactura_F INT IDENTITY(1,1) NOT NULL,
    CodUsuario_U_F INT NOT NULL,
    fecha_F DATE NOT NULL,
    Total_F DECIMAL NOT NULL,
	Estado_F BIT DEFAULT 1,
	CONSTRAINT PK_Factura PRIMARY KEY (NrFactura_F),
	CONSTRAINT FK_Factura_Usuario FOREIGN KEY (CodUsuario_U_F) REFERENCES Usuario(CodUsuario_U)
)
Go

CREATE TABLE Detalle_Venta(
	NrFactura_F_DV INT NOT NULL,
    CodProducto_Pr_DV INT NOT NULL,
    cantidad INT NOT NULL,
    PrecioUnitario DECIMAL NOT NULL,
	CONSTRAINT PK_Detalle_Venta PRIMARY KEY (NrFactura_F_DV,CodProducto_Pr_DV),
	CONSTRAINT FK_Detalle_Venta_Factura FOREIGN KEY (NrFactura_F_DV) REFERENCES Factura(NrFactura_F),
	CONSTRAINT FK_Detalle_Venta_Productos FOREIGN KEY (CodProducto_Pr_DV) REFERENCES Productos(CodProducto_Pr)
)
Go

/* Dato Administrador */
INSERT INTO Usuario (NombreUsuario_U, NombreCompleto_U, Mail_U, Contrasenia_U, RepetirContrasenia_U,Rol_U)
VALUES
('Juancito','Juan Rios','jrios@administrador.com','juan123','juan123','ADM'),
('juan manuel','juan manuel fernandez','jm.fernandez1328@gmail.com','juan1234','juan1234','ADM'),
('tamara','tamara soledad vera','tamara@gmail.com','tami123','tami123','ADM'),
('elizabet','elizabet florencia soledad correa','eli@gmail.com','eli123','eli123','ADM')
/* Datos Usuario */
INSERT INTO Usuario (NombreUsuario_U, NombreCompleto_U, Mail_U, Contrasenia_U, RepetirContrasenia_U)
VALUES
('Anita','Anita Lopez','alopez@usuario.com','ana456','ana456'),
('shaza','shaza gimena guitierres','sgime@gmail.com','123','123'),
('agustin','agustin matias fierro','agus@gmail.com','agus435','agus435'),
('pereyra','pereyra echeverrya gonzalez','perey615@gmail.com','fiesta037','fiesta037'),
('micaela','micaela gonzales','mic123@gmail.com','salsaroza87','salsaroza87'),
('mariela','mariela varrera pinto','varrepinto@gmail.com','parraAnda26','parraAnda26'),
('matias','matias gonzales kioty','matikioty@gmail.com','fernetCola6978','fernetCola6978')


/*Datos Categoria*/
INSERT INTO Categoria (Nombre_Ct)
VALUES 
('Comida'),
('Bebida'),
('Combo'),
('Postre'),
('Desayuno'),
('Almuerzo'),
('Cena'),
('Bebida Alcohólica');

/*Datos Tipo*/
INSERT INTO Tipo (Nombre_T)
VALUES 
('Sin gluten'),
('Bajo en grasa'),
('Alto en proteínas'),
('Keto'),
('Paleo'),
('Orgánico'),
('Sin lactosa'),
('Sin azúcar'),
('Vegano'),
('Vegetariano');

/* Datos Productos */
INSERT INTO Productos (CodCategoria_Ct_Pr, CodTipoProducto_T_Pr, stock_Pr, NombreProducto_Pr, Descripcion_Pr, PrecioUnitario_Pr,ImagenURL_Pr)
VALUES 
(1, 1, 100, 'Hamburguesa Vegana', 'Deliciosa hamburguesa vegana con remolacha, salsa de aguacate y lechuga', 800.00, 'img/Productos/Hamburguesa_Vegana.jpg'),
(1, 9, 80, 'Ensalada de Espinacas', 'Ensalada fresca con espinacas, nueces y queso', 600.00, 'img/Productos/Ensalada_Espinaca.jpg'),
(2, 1, 120, 'Agua Mineral con Gas', 'Botella de agua mineral con gas Bonaqua 500ml', 350.50, 'img/Productos/Agua_Mineral_Con_Gas.jpg'),
(2, 2, 100, 'Zumo de Naranja Natural','Zumo recién exprimido de naranja', 350.50, 'img/Productos/Zumo_Naranja.jpg'),
(3, 3, 50, 'Combo de Hamburguesa', 'Hamburguesa, patatas y refresco grande', 1500.00,'img/Productos/Combo_Hamburguesa.jpg'),
(4, 5, 70, 'Leche de Almendra', 'Leche vegetal de almendra sin lactosa', 550.50, 'img/Productos/Leche_Almendras.jpg'),
(5, 5, 60, 'Desayuno Continental', 'Croissant, café, jugo de naranja y frutas frescas', 600.50, 'img/Productos/Desayuno_Continental.jpg'),
(6, 6, 90, 'Menú Ejecutivo', 'Plato del día con guarnición y bebida', 1100.00, 'img/Productos/Menu_Ejecutivo.jpg'),
(7, 7, 80, 'Pasta a la Boloñesa', 'Plato de pasta con salsa de carne', 2100.50, 'img/Productos/Pasta_Bolognesa.jpg'),
(8, 8, 110, 'Cóctel Margarita', 'Bebida alcohólica con tequila, triple sec y limón', 500.00, 'img/Productos/Coctel_Margarita.jpg'),
(1, 1, 100, 'Pizza Margarita', 'Deliciosa pizza de tomate y queso', 3000, 'img/Productos/Pizza_Margarita.jpg'),
(4, 4, 1500, 'Helado bombon', 'Palito helado de crema americana con cobertura de chocolate',500,'/img/Productos/Helado_Bombon.jpg'),
(6, 10, 500,'Tacos', 'Tacos de frijoles y aguacate',700,'/img/Productos/Tacos.jpg'),
(7,8,200,'Arroz con pollo al curry','Trozos de pollo cocinados en una mezcla de especias al curry con arroz.',2100,'/img/Productos/Arroz_con_Pollo.jpg'),
(6,10,300,'Ensala de quinoa mediterranea','Esta ensalada es una opción nutritiva y deliciosa.',1000,'/img/Productos/Ensalada_Mediterranea.jpg'),
(7,2,100,'Sopa de verduras','Opción excelente para aquellos que buscan una comida reconfortante y baja en grasa.',1200,'/img/Productos/Sopa_Verduras.jpg'),
(1,4,500,'Pollo con ensalada','Carne de pollo a la parrilla y huevos cocidos y ensalada de pepino.',2200,'/img/Productos/Pollo_con_Ensalada.jpg'),
(2, 9, 75, 'Agua con Sabor a Frutas Tropicales', 'agua con sabor a frutas tropicales', 450.00, 'img/Productos/Agua_Frutas_Tropicales.jpg'),
(1, 7, 40, 'Wrap Vegano', 'Wrap vegano con relleno de verduras frescas y hummus', 850.00, 'img/Productos/Wrap_Vegano.jpg'),
(3, 8, 60, 'Combo Familiar', 'Combo con hamburguesas, papas fritas y bebidas', 2500.00, 'img/Productos/Combo_Familiar.jpg'),
(4, 5, 30, 'Leche de Avena', 'Leche vegetal de avena sin lactosa', 600.00, 'img/Productos/Leche_Avena.jpg');

/* Datos Factura */
INSERT INTO Factura (CodUsuario_U_F, fecha_F, Total_F)
VALUES 
(5, '2022-01-15', 1400.00),
(6, '2022-02-23', 7001.00),
(7, '2022-03-10', 2501.00),
(8, '2022-04-17', 1700.50),
(9, '2022-05-05', 2600.50),
(10, '2022-06-12', 1300.00),
(11, '2022-07-22', 2500.00),
(5, '2022-08-05', 1700.00);

/* Datos Detalle_Venta */
INSERT INTO Detalle_Venta (NrFactura_F_DV, CodProducto_Pr_DV, cantidad, PrecioUnitario)
VALUES 
(1, 1, 2, 800.00),
(1, 2, 1, 600.00),
(2, 3, 3, 350.50),
(2, 4, 2, 350.50),
(3, 5, 1, 1500.00),
(3, 6, 2, 550.50),
(4, 7, 1, 600.50),
(4, 8, 1, 1100.00),
(5, 9, 2, 2100.50),
(5, 10, 1, 500.00),
(6, 11, 3, 450.00),
(6, 12, 2, 850.00),
(7, 13, 1, 2500.00),
(8, 14, 5, 600.00),
(8, 15, 2, 1100.00);
