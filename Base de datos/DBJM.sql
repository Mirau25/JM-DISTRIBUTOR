CREATE DATABASE DBJM
GO

USE [DBJM]
GO
/** Object:  Table [dbo].[Categoria]    Script Date: 18/03/2024 5:15:11 a. m. **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[idCategoria] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/** Object:  Table [dbo].[Cliente]    Script Date: 18/03/2024 5:15:11 a. m. **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[idCliente] [int] IDENTITY(1,1) NOT NULL,
	[nombreCliente] [varchar](20) NULL,
	[documentoCliente] [varchar](10) NULL,
	[telefono] [varchar](10) NULL,
	[esActivo] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/** Object:  Table [dbo].[Credencial]    Script Date: 18/03/2024 5:15:11 a. m. **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Credencial](
	[recurso] [varchar](50) NULL,
	[propiedad] [varchar](50) NULL,
	[valor] [varchar](60) NULL
) ON [PRIMARY]
GO
/** Object:  Table [dbo].[DetalleVenta]    Script Date: 18/03/2024 5:15:11 a. m. **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[idDetalleVenta] [int] IDENTITY(1,1) NOT NULL,
	[idVenta] [int] NULL,
	[idProducto] [int] NULL,
	[marcaProducto] [varchar](100) NULL,
	[descripcionProducto] [varchar](100) NULL,
	[categoriaProducto] [varchar](100) NULL,
	[cantidad] [int] NULL,
	[precio] [decimal](10, 2) NULL,
	[total] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/** Object:  Table [dbo].[Menu]    Script Date: 18/03/2024 5:15:11 a. m. **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu](
	[idMenu] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NULL,
	[idMenuPadre] [int] NULL,
	[controlador] [varchar](30) NULL,
	[paginaAccion] [varchar](30) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/** Object:  Table [dbo].[Negocio]    Script Date: 18/03/2024 5:15:11 a. m. **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Negocio](
	[idNegocio] [int] NOT NULL,
	[urlLogo] [varchar](500) NULL,
	[nombreLogo] [varchar](100) NULL,
	[numeroDocumento] [varchar](50) NULL,
	[nombre] [varchar](50) NULL,
	[correo] [varchar](50) NULL,
	[direccion] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[porcentajeImpuesto] [decimal](10, 2) NULL,
	[simboloMoneda] [varchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[idNegocio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/** Object:  Table [dbo].[NumeroVenta]    Script Date: 18/03/2024 5:15:11 a. m. **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NumeroVenta](
	[idNumeroVenta] [int] IDENTITY(1,1) NOT NULL,
	[ultimoNumero] [int] NULL,
	[cantidadDigitos] [int] NULL,
	[gestion] [varchar](100) NULL,
	[fechaActualizacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idNumeroVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/** Object:  Table [dbo].[Producto]    Script Date: 18/03/2024 5:15:11 a. m. **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[idProducto] [int] IDENTITY(1,1) NOT NULL,
	[codigoBarra] [varchar](50) NULL,
	[marca] [varchar](50) NULL,
	[descripcion] [varchar](100) NULL,
	[idCategoria] [int] NULL,
	[stock] [int] NULL,
	[urlImagen] [varchar](500) NULL,
	[nombreImagen] [varchar](100) NULL,
	[precio] [decimal](10, 2) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/** Object:  Table [dbo].[Rol]    Script Date: 18/03/2024 5:15:11 a. m. **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](30) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/** Object:  Table [dbo].[RolMenu]    Script Date: 18/03/2024 5:15:11 a. m. **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolMenu](
	[idRolMenu] [int] IDENTITY(1,1) NOT NULL,
	[idRol] [int] NULL,
	[idMenu] [int] NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idRolMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/** Object:  Table [dbo].[TipoDocumentoVenta]    Script Date: 18/03/2024 5:15:11 a. m. **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoDocumentoVenta](
	[idTipoDocumentoVenta] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idTipoDocumentoVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/** Object:  Table [dbo].[Usuario]    Script Date: 18/03/2024 5:15:11 a. m. **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[correo] [varchar](50) NULL,
	[telefono] [varchar](50) NULL,
	[idRol] [int] NULL,
	[urlFoto] [varchar](500) NULL,
	[nombreFoto] [varchar](100) NULL,
	[clave] [varchar](100) NULL,
	[esActivo] [bit] NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/** Object:  Table [dbo].[Venta]    Script Date: 18/03/2024 5:15:11 a. m. **/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[idVenta] [int] IDENTITY(1,1) NOT NULL,
	[numeroVenta] [varchar](6) NULL,
	[idTipoDocumentoVenta] [int] NULL,
	[idUsuario] [int] NULL,
	[documentoCliente] [varchar](10) NULL,
	[nombreCliente] [varchar](20) NULL,
	[subTotal] [decimal](10, 2) NULL,
	[impuestoTotal] [decimal](10, 2) NULL,
	[Total] [decimal](10, 2) NULL,
	[fechaRegistro] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 
GO
INSERT [dbo].[Categoria] ([idCategoria], [descripcion], [esActivo], [fechaRegistro]) VALUES (1, N'Cerveza', 1, CAST(N'2024-03-10T19:42:28.387' AS DateTime))
GO
INSERT [dbo].[Categoria] ([idCategoria], [descripcion], [esActivo], [fechaRegistro]) VALUES (2, N'Licor', 1, CAST(N'2024-03-10T19:42:33.893' AS DateTime))
GO
INSERT [dbo].[Categoria] ([idCategoria], [descripcion], [esActivo], [fechaRegistro]) VALUES (3, N'Cigarrería', 1, CAST(N'2024-03-10T19:42:39.923' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Categoria] OFF
GO
SET IDENTITY_INSERT [dbo].[Cliente] ON 
GO
INSERT [dbo].[Cliente] ([idCliente], [nombreCliente], [documentoCliente], [telefono], [esActivo]) VALUES (1, N'Juan Pérez', N'1234567890', N'555-1234', 1)
GO
INSERT [dbo].[Cliente] ([idCliente], [nombreCliente], [documentoCliente], [telefono], [esActivo]) VALUES (2, N'María García', N'9876543210', N'555-5678', 1)
GO
INSERT [dbo].[Cliente] ([idCliente], [nombreCliente], [documentoCliente], [telefono], [esActivo]) VALUES (3, N'Carlos López', N'4567890123', N'555-9012', 0)
GO
SET IDENTITY_INSERT [dbo].[Cliente] OFF
GO
INSERT [dbo].[Credencial] ([recurso], [propiedad], [valor]) VALUES (N'FireBase_Storage', N'email', N'distribuidorajm@gmail.com')
GO
INSERT [dbo].[Credencial] ([recurso], [propiedad], [valor]) VALUES (N'FireBase_Storage', N'clave', N'123456')
GO
INSERT [dbo].[Credencial] ([recurso], [propiedad], [valor]) VALUES (N'FireBase_Storage', N'ruta', N'distribuidorajm-cb828.appspot.com')
GO
INSERT [dbo].[Credencial] ([recurso], [propiedad], [valor]) VALUES (N'FireBase_Storage', N'api_key', N'AIzaSyDPT1juAOv1SrHNN7k8wfitotn_I9lYmPs')
GO
INSERT [dbo].[Credencial] ([recurso], [propiedad], [valor]) VALUES (N'FireBase_Storage', N'carpeta_usuario', N'IMAGENES_USUARIO')
GO
INSERT [dbo].[Credencial] ([recurso], [propiedad], [valor]) VALUES (N'FireBase_Storage', N'carpeta_producto', N'IMAGENES_PRODUCTO')
GO
INSERT [dbo].[Credencial] ([recurso], [propiedad], [valor]) VALUES (N'FireBase_Storage', N'carpeta_logo', N'IMAGENES_LOGO')
GO
INSERT [dbo].[Credencial] ([recurso], [propiedad], [valor]) VALUES (N'Servicio_Correo', N'correo', N'miramartinez2501@gmail.com')
GO
INSERT [dbo].[Credencial] ([recurso], [propiedad], [valor]) VALUES (N'Servicio_Correo', N'clave', N'ptdlmxsqoajzzzzo')
GO
INSERT [dbo].[Credencial] ([recurso], [propiedad], [valor]) VALUES (N'Servicio_Correo', N'alias', N'DistribuidoraJm.com')
GO
INSERT [dbo].[Credencial] ([recurso], [propiedad], [valor]) VALUES (N'Servicio_Correo', N'host', N'smtp.gmail.com')
GO
INSERT [dbo].[Credencial] ([recurso], [propiedad], [valor]) VALUES (N'Servicio_Correo', N'puerto', N'587')
GO
SET IDENTITY_INSERT [dbo].[DetalleVenta] ON 
GO
INSERT [dbo].[DetalleVenta] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (1, 2, 3, N'Pilsen Litro', N'Pilsen RN -1000cc x13', N'Cerveza', 1, CAST(65.00 AS Decimal(10, 2)), CAST(65.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (2, 5, 3, N'Pilsen Litro', N'Pilsen RN -1000cc x13', N'Cerveza', 12, CAST(65.00 AS Decimal(10, 2)), CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (3, 7, 5, N'Águila  Light Litro', N'Águila Light RN -1000cc x13', N'Cerveza', 8, CAST(65.00 AS Decimal(10, 2)), CAST(520.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (4, 8, 3, N'Pilsen Litro', N'Pilsen RN -1000cc x13', N'Cerveza', 8, CAST(65.00 AS Decimal(10, 2)), CAST(520.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (5, 11, 1, N'Águila Litro', N'Águila NR -1000cc x13', N'Cerveza', 10, CAST(65.00 AS Decimal(10, 2)), CAST(650.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (6, 12, 3, N'Pilsen Litro', N'Pilsen RN -1000cc x13', N'Cerveza', 8, CAST(65.00 AS Decimal(10, 2)), CAST(520.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (7, 13, 2, N'Águila x30', N'Águila Original RN -330cc x 30', N'Cerveza', 1, CAST(65.00 AS Decimal(10, 2)), CAST(65.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (8, 14, 4, N'Pilsen x30', N'Pilsen  R -330cc x 30', N'Cerveza', 1, CAST(67.00 AS Decimal(10, 2)), CAST(67.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (9, 15, 4, N'Pilsen x30', N'Pilsen  R -330cc x 30', N'Cerveza', 12, CAST(67.00 AS Decimal(10, 2)), CAST(804.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (10, 16, 1, N'Águila Litro', N'Águila NR -1000cc x13', N'Cerveza', 3, CAST(65.00 AS Decimal(10, 2)), CAST(195.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (11, 17, 4, N'Pilsen x30', N'Pilsen  R -330cc x 30', N'Cerveza', 12, CAST(67.00 AS Decimal(10, 2)), CAST(804.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (12, 18, 2, N'Águila x30', N'Águila Original RN -330cc x 30', N'Cerveza', 8, CAST(65.00 AS Decimal(10, 2)), CAST(520.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (13, 19, 2, N'Águila x30', N'Águila Original RN -330cc x 30', N'Cerveza', 12, CAST(65.00 AS Decimal(10, 2)), CAST(780.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (14, 20, 5, N'Águila  Light Litro', N'Águila Light RN -1000cc x13', N'Cerveza', 8, CAST(65.00 AS Decimal(10, 2)), CAST(520.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (15, 21, 5, N'Águila  Light Litro', N'Águila Light RN -1000cc x13', N'Cerveza', 9, CAST(65.00 AS Decimal(10, 2)), CAST(585.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (16, 22, 1, N'Águila Litro', N'Águila NR -1000cc x13', N'Cerveza', 4, CAST(65.00 AS Decimal(10, 2)), CAST(260.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (17, 23, 1, N'Águila Litro', N'Águila NR -1000cc x13', N'Cerveza', 3, CAST(65.00 AS Decimal(10, 2)), CAST(195.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (18, 24, 1, N'Águila Litro', N'Águila NR -1000cc x13', N'Cerveza', 2, CAST(65.00 AS Decimal(10, 2)), CAST(130.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (19, 24, 6, N'Águila  Light x30', N'Águila  Light RN -330cc x 30', N'Cerveza', 2, CAST(63.00 AS Decimal(10, 2)), CAST(126.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[DetalleVenta] ([idDetalleVenta], [idVenta], [idProducto], [marcaProducto], [descripcionProducto], [categoriaProducto], [cantidad], [precio], [total]) VALUES (20, 24, 2, N'Águila x30', N'Águila Original RN -330cc x 30', N'Cerveza', 4, CAST(65.00 AS Decimal(10, 2)), CAST(260.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[DetalleVenta] OFF
GO
SET IDENTITY_INSERT [dbo].[Menu] ON 
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (1, N'DashBoard', 1, N'DashBoard', N'Index', 1, CAST(N'2024-03-10T19:23:30.170' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (2, N'Administración', 2, NULL, NULL, 1, CAST(N'2024-03-10T19:23:30.170' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (3, N'Inventario', 3, NULL, NULL, 1, CAST(N'2024-03-10T19:23:30.170' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (4, N'Cotización', 4, NULL, NULL, 1, CAST(N'2024-03-10T19:23:30.170' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (5, N'Reporte Cotización', 5, NULL, NULL, 1, CAST(N'2024-03-10T19:23:30.170' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (6, N'Usuarios', 2, N'Usuario', N'Index', 1, CAST(N'2024-03-10T19:23:30.170' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (7, N'Negocio', 2, N'Negocio', N'Index', 1, CAST(N'2024-03-10T19:23:30.170' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (8, N'Categorias', 3, N'Categoria', N'Index', 1, CAST(N'2024-03-10T19:23:30.173' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (9, N'Productos', 3, N'Producto', N'Index', 1, CAST(N'2024-03-10T19:23:30.173' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (10, N'Nueva Cotización', 4, N'Venta', N'NuevaVenta', 1, CAST(N'2024-03-10T19:23:30.173' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (11, N'Historial Cotización', 4, N'Venta', N'HistorialVenta', 1, CAST(N'2024-03-10T19:23:30.173' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (12, N'Reporte de Cotizaciones', 5, N'Reporte', N'Index', 1, CAST(N'2024-03-10T19:23:30.177' AS DateTime))
GO
INSERT [dbo].[Menu] ([idMenu], [descripcion], [idMenuPadre], [controlador], [paginaAccion], [esActivo], [fechaRegistro]) VALUES (13, N'Cliente', 2, N'Cliente', N'Index', 1, CAST(N'2024-03-13T15:32:55.880' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Menu] OFF
GO
INSERT [dbo].[Negocio] ([idNegocio], [urlLogo], [nombreLogo], [numeroDocumento], [nombre], [correo], [direccion], [telefono], [porcentajeImpuesto], [simboloMoneda]) VALUES (1, N'https://firebasestorage.googleapis.com/v0/b/distribuidorajm-cb828.appspot.com/o/IMAGENES_LOGO%2Fb1e7b462572248968b10b12e5fde82e6.jpg?alt=media&token=2240a8ad-8639-4fe1-b01e-94c193b2cf71', N'b1e7b462572248968b10b12e5fde82e6.jpg', N'2871472', N'JM Distributor ', N'jmosquera@gmail.com', N'Calle 58 Nro 102 - 225 int 101', N'3226652383', CAST(10.00 AS Decimal(10, 2)), N'$')
GO
SET IDENTITY_INSERT [dbo].[NumeroVenta] ON 
GO
INSERT [dbo].[NumeroVenta] ([idNumeroVenta], [ultimoNumero], [cantidadDigitos], [gestion], [fechaActualizacion]) VALUES (1, 13, 6, N'venta', CAST(N'2024-03-18T03:37:06.047' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[NumeroVenta] OFF
GO
SET IDENTITY_INSERT [dbo].[Producto] ON 
GO
INSERT [dbo].[Producto] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (19, N'781273', N'Águila', N'Águila NR -1000cc x13', 1, 100, N'https://firebasestorage.googleapis.com/v0/b/distribuidorajm-cb828.appspot.com/o/IMAGENES_PRODUCTO%2F51597beabe3242358d441727099196b0?alt=media&token=8b860e1c-8437-44f5-b9f8-c0273d4f94a8', N'51597beabe3242358d441727099196b0', CAST(65.00 AS Decimal(10, 2)), 1, CAST(N'2024-03-18T03:29:01.913' AS DateTime))
GO
INSERT [dbo].[Producto] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (20, N'7312987', N'Águila', N'Águila Original RN -330cc x 30', 1, 100, N'https://firebasestorage.googleapis.com/v0/b/distribuidorajm-cb828.appspot.com/o/IMAGENES_PRODUCTO%2F9ba4b0133cd24f8781dff860ddda66f2?alt=media&token=2d9eb5db-d00d-4a85-ab9f-5ea847d4d5af', N'9ba4b0133cd24f8781dff860ddda66f2', CAST(65.00 AS Decimal(10, 2)), 1, CAST(N'2024-03-18T03:29:48.053' AS DateTime))
GO
INSERT [dbo].[Producto] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (21, N'8723872', N'Pilsen', N'Pilsen R-330cc x 30', 1, 100, N'https://firebasestorage.googleapis.com/v0/b/distribuidorajm-cb828.appspot.com/o/IMAGENES_PRODUCTO%2Fded0415d32a14efea1858cf1d1da998c.jpg?alt=media&token=45798ec5-246d-4e92-8145-7028a19d1e22', N'ded0415d32a14efea1858cf1d1da998c.jpg', CAST(67.00 AS Decimal(10, 2)), 1, CAST(N'2024-03-18T03:30:38.390' AS DateTime))
GO
INSERT [dbo].[Producto] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (22, N'892398', N'Pilsen', N'Pilsen RN -1000cc x13', 1, 100, N'https://firebasestorage.googleapis.com/v0/b/distribuidorajm-cb828.appspot.com/o/IMAGENES_PRODUCTO%2Fb15eec1facbe4c35b797d0903a44b3a0.jpg?alt=media&token=fbb17a6a-1ac1-4606-94cb-be339bc82eee', N'b15eec1facbe4c35b797d0903a44b3a0.jpg', CAST(68.00 AS Decimal(10, 2)), 1, CAST(N'2024-03-18T03:31:38.733' AS DateTime))
GO
INSERT [dbo].[Producto] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (24, N'8738923', N'Águila Light ', N'Águila Light RN -330cc x 30', 1, 1000, N'https://firebasestorage.googleapis.com/v0/b/distribuidorajm-cb828.appspot.com/o/IMAGENES_PRODUCTO%2F1c4957c570284b6fab251f9bdcac368d.jpg?alt=media&token=ce81467a-d791-41e3-8dee-0afd24b067db', N'1c4957c570284b6fab251f9bdcac368d.jpg', CAST(63.00 AS Decimal(10, 2)), 1, CAST(N'2024-03-18T03:33:15.760' AS DateTime))
GO
INSERT [dbo].[Producto] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (25, N'789324', N'Águila Light ', N'Águila Light RN -1000cc x13', 1, 100, N'https://firebasestorage.googleapis.com/v0/b/distribuidorajm-cb828.appspot.com/o/IMAGENES_PRODUCTO%2F38c45e38e2954fcdb40bd97944972a6f.jpg?alt=media&token=89188a54-ba4e-4138-923e-fd773f8925ad', N'38c45e38e2954fcdb40bd97944972a6f.jpg', CAST(65.00 AS Decimal(10, 2)), 1, CAST(N'2024-03-18T03:33:48.973' AS DateTime))
GO
INSERT [dbo].[Producto] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (26, N'7872389', N'Malboro', N'Cigarrillo Malboro ', 3, 50, N'https://firebasestorage.googleapis.com/v0/b/distribuidorajm-cb828.appspot.com/o/IMAGENES_PRODUCTO%2F325d5885b0844b0080aab3eea87e301e.jpg?alt=media&token=31d32a83-1264-4dd1-8005-ff4797c65155', N'325d5885b0844b0080aab3eea87e301e.jpg', CAST(5.00 AS Decimal(10, 2)), 1, CAST(N'2024-03-18T03:34:36.380' AS DateTime))
GO
INSERT [dbo].[Producto] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (27, N'892349', N'Ron Caldas', N'Botella Ron Caldas Esencial', 2, 80, N'https://firebasestorage.googleapis.com/v0/b/distribuidorajm-cb828.appspot.com/o/IMAGENES_PRODUCTO%2F2544dbe8efae4b399ecd85250f48b7d5.jpg?alt=media&token=99476f52-bacb-4b0e-828a-5dec9c8cb4c8', N'2544dbe8efae4b399ecd85250f48b7d5.jpg', CAST(40.00 AS Decimal(10, 2)), 1, CAST(N'2024-03-18T03:35:59.710' AS DateTime))
GO
INSERT [dbo].[Producto] ([idProducto], [codigoBarra], [marca], [descripcion], [idCategoria], [stock], [urlImagen], [nombreImagen], [precio], [esActivo], [fechaRegistro]) VALUES (28, N'787343', N'prueba', N'prueba', 1, 7, N'', N'', CAST(50.00 AS Decimal(10, 2)), 1, CAST(N'2024-03-18T03:36:39.480' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Producto] OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 
GO
INSERT [dbo].[Rol] ([idRol], [descripcion], [esActivo], [fechaRegistro]) VALUES (1, N'Administrador', 1, CAST(N'2024-03-10T19:15:23.587' AS DateTime))
GO
INSERT [dbo].[Rol] ([idRol], [descripcion], [esActivo], [fechaRegistro]) VALUES (2, N'Empleado', 1, CAST(N'2024-03-10T19:15:23.587' AS DateTime))
GO
INSERT [dbo].[Rol] ([idRol], [descripcion], [esActivo], [fechaRegistro]) VALUES (3, N'Supervisor', 1, CAST(N'2024-03-10T19:15:23.587' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Rol] OFF
GO
SET IDENTITY_INSERT [dbo].[RolMenu] ON 
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (1, 1, 1, 1, CAST(N'2024-03-10T19:25:44.910' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (2, 1, 6, 1, CAST(N'2024-03-10T19:25:44.910' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (3, 1, 7, 1, CAST(N'2024-03-10T19:25:44.910' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (4, 1, 8, 1, CAST(N'2024-03-10T19:25:44.910' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (5, 1, 9, 1, CAST(N'2024-03-10T19:25:44.910' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (6, 1, 10, 1, CAST(N'2024-03-10T19:25:44.910' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (7, 1, 11, 1, CAST(N'2024-03-10T19:25:44.910' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (8, 1, 12, 1, CAST(N'2024-03-10T19:25:44.910' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (9, 2, 1, 1, CAST(N'2024-03-10T19:25:44.913' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (10, 2, 10, 1, CAST(N'2024-03-10T19:25:44.913' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (11, 2, 11, 1, CAST(N'2024-03-10T19:25:44.913' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (12, 3, 1, 1, CAST(N'2024-03-10T19:25:44.913' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (13, 3, 8, 1, CAST(N'2024-03-10T19:25:44.913' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (14, 3, 9, 1, CAST(N'2024-03-10T19:25:44.913' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (15, 3, 10, 1, CAST(N'2024-03-10T19:25:44.913' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (16, 3, 11, 1, CAST(N'2024-03-10T19:25:44.913' AS DateTime))
GO
INSERT [dbo].[RolMenu] ([idRolMenu], [idRol], [idMenu], [esActivo], [fechaRegistro]) VALUES (17, 1, 13, 1, CAST(N'2024-03-13T15:33:09.263' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[RolMenu] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoDocumentoVenta] ON 
GO
INSERT [dbo].[TipoDocumentoVenta] ([idTipoDocumentoVenta], [descripcion], [esActivo], [fechaRegistro]) VALUES (1, N'Cotización', 1, CAST(N'2024-03-10T19:19:22.583' AS DateTime))
GO
INSERT [dbo].[TipoDocumentoVenta] ([idTipoDocumentoVenta], [descripcion], [esActivo], [fechaRegistro]) VALUES (2, N'Resivo de pago', 1, CAST(N'2024-03-10T19:19:22.583' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[TipoDocumentoVenta] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [correo], [telefono], [idRol], [urlFoto], [nombreFoto], [clave], [esActivo], [fechaRegistro]) VALUES (1, N'Juan Mosquera Mosquera', N'jmosquera@gmail.com', N'90909050', 1, N'https://firebasestorage.googleapis.com/v0/b/distribuidorajm-cb828.appspot.com/o/IMAGENES_USUARIO%2Fa3a97958b6e247abad79da2ea0647a83.jpg?alt=media&token=d5622975-f6dc-4396-90bc-bdee23944437', N'a3a97958b6e247abad79da2ea0647a83.jpg', N'03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', 1, CAST(N'2024-03-10T19:17:34.173' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [correo], [telefono], [idRol], [urlFoto], [nombreFoto], [clave], [esActivo], [fechaRegistro]) VALUES (2, N'Juanita Mosquera ', N'juanita16del2005@gmail.com', N'3226652383', 3, N'https://firebasestorage.googleapis.com/v0/b/distribuidorajm-cb828.appspot.com/o/IMAGENES_USUARIO%2Fcf4ef8bf96eb45209a2bf7f2de7899b3.png?alt=media&token=1a0b0261-0462-4a92-a0f6-0c442614e7a3', N'cf4ef8bf96eb45209a2bf7f2de7899b3.png', N'bc190f64196fefddeab730a0c18df88d772ef4ca61830488c740e62341c51952', 1, CAST(N'2024-03-10T21:05:05.320' AS DateTime))
GO
INSERT [dbo].[Usuario] ([idUsuario], [nombre], [correo], [telefono], [idRol], [urlFoto], [nombreFoto], [clave], [esActivo], [fechaRegistro]) VALUES (3, N'Luciana Romaña', N'juanitamosquera779@gmail.com', N'3226652383', 2, N'https://firebasestorage.googleapis.com/v0/b/distribuidorajm-cb828.appspot.com/o/IMAGENES_USUARIO%2Fb315bf828d934c89800254db916860e1.png?alt=media&token=811b144c-cc75-4987-80b9-eb0081efcf1d', N'b315bf828d934c89800254db916860e1.png', N'181bb995376bdf9a02831ac61f400b3f0bbacf009921bdf3669d67bb4bfd1edc', 0, CAST(N'2024-03-10T21:07:40.597' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[Venta] ON 
GO
INSERT [dbo].[Venta] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (2, N'000001', 1, 1, N'1025761959', N'juanita', CAST(6500.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(6500.00 AS Decimal(10, 2)), CAST(N'2024-03-10T23:11:15.877' AS DateTime))
GO
INSERT [dbo].[Venta] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (5, N'000002', 1, 1, N'1025761959', N'juanita', CAST(78000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(78000.00 AS Decimal(10, 2)), CAST(N'2024-03-10T23:15:57.343' AS DateTime))
GO
INSERT [dbo].[Venta] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (7, N'000003', 2, 1, N'676789', N'Sara', CAST(52000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(52000.00 AS Decimal(10, 2)), CAST(N'2024-03-10T23:17:43.220' AS DateTime))
GO
INSERT [dbo].[Venta] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (8, N'000004', 1, 1, N'16615512', N'Manuel', CAST(52000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(52000.00 AS Decimal(10, 2)), CAST(N'2024-03-10T23:18:06.437' AS DateTime))
GO
INSERT [dbo].[Venta] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (11, N'000005', 2, 1, N'102576', N'juanita', CAST(65000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(65000.00 AS Decimal(10, 2)), CAST(N'2024-03-09T23:42:24.270' AS DateTime))
GO
INSERT [dbo].[Venta] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (12, N'000006', 1, 1, N'102', N'Juan', CAST(52000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(52000.00 AS Decimal(10, 2)), CAST(N'2024-03-09T23:45:51.543' AS DateTime))
GO
INSERT [dbo].[Venta] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (13, N'000001', 1, 1, N'16615512', N'Carlos', CAST(6500.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(6500.00 AS Decimal(10, 2)), CAST(N'2024-03-13T02:27:18.790' AS DateTime))
GO
INSERT [dbo].[Venta] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (14, N'000002', 2, 1, N'67349', N'Rosa', CAST(6700.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(6700.00 AS Decimal(10, 2)), CAST(N'2024-03-12T02:28:02.620' AS DateTime))
GO
INSERT [dbo].[Venta] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (15, N'000003', 1, 1, N'2892349', N'Marta', CAST(80400.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(80400.00 AS Decimal(10, 2)), CAST(N'2024-03-12T02:28:54.443' AS DateTime))
GO
INSERT [dbo].[Venta] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (16, N'000004', 1, 1, N'8728932', N'Majo', CAST(19500.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(19500.00 AS Decimal(10, 2)), CAST(N'2024-03-12T02:29:16.073' AS DateTime))
GO
INSERT [dbo].[Venta] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (17, N'000005', 1, 1, N'7637932', N'Mario', CAST(80400.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(80400.00 AS Decimal(10, 2)), CAST(N'2024-03-14T02:30:19.173' AS DateTime))
GO
INSERT [dbo].[Venta] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (18, N'000006', 2, 1, N'893290', N'Robert', CAST(52000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(52000.00 AS Decimal(10, 2)), CAST(N'2024-03-14T02:30:43.423' AS DateTime))
GO
INSERT [dbo].[Venta] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (19, N'000007', 2, 1, N'8934729', N'Lucho', CAST(78000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(78000.00 AS Decimal(10, 2)), CAST(N'2024-03-14T02:31:30.413' AS DateTime))
GO
INSERT [dbo].[Venta] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (20, N'000008', 2, 1, N'8739147', N'Lulu', CAST(52000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(52000.00 AS Decimal(10, 2)), CAST(N'2024-03-15T02:33:12.463' AS DateTime))
GO
INSERT [dbo].[Venta] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (21, N'000009', 2, 1, N'2112314', N'Sofi', CAST(58500.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(58500.00 AS Decimal(10, 2)), CAST(N'2024-03-15T02:33:51.410' AS DateTime))
GO
INSERT [dbo].[Venta] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (22, N'000010', 2, 1, N'23684', N'Sara', CAST(26000.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(26000.00 AS Decimal(10, 2)), CAST(N'2024-03-16T02:34:56.990' AS DateTime))
GO
INSERT [dbo].[Venta] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (23, N'000011', 1, 1, N'1025761959', N'Juanita Mosquera', CAST(19500.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(19500.00 AS Decimal(10, 2)), CAST(N'2024-03-11T16:42:39.057' AS DateTime))
GO
INSERT [dbo].[Venta] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (24, N'000012', 1, 1, N'', N'', CAST(51600.00 AS Decimal(10, 2)), CAST(0.00 AS Decimal(10, 2)), CAST(51600.00 AS Decimal(10, 2)), CAST(N'2024-03-11T16:49:39.517' AS DateTime))
GO
INSERT [dbo].[Venta] ([idVenta], [numeroVenta], [idTipoDocumentoVenta], [idUsuario], [documentoCliente], [nombreCliente], [subTotal], [impuestoTotal], [Total], [fechaRegistro]) VALUES (25, N'000013', 1, 1, N'1234567890', N'Juan Pérez', CAST(13636.00 AS Decimal(10, 2)), CAST(1364.00 AS Decimal(10, 2)), CAST(15000.00 AS Decimal(10, 2)), CAST(N'2024-03-18T03:37:06.310' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Venta] OFF
GO
ALTER TABLE [dbo].[Categoria] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Menu] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Producto] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Rol] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[RolMenu] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[TipoDocumentoVenta] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[Venta] ADD  DEFAULT (getdate()) FOR [fechaRegistro]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD FOREIGN KEY([idVenta])
REFERENCES [dbo].[Venta] ([idVenta])
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD FOREIGN KEY([idMenuPadre])
REFERENCES [dbo].[Menu] ([idMenu])
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categoria] ([idCategoria])
GO
ALTER TABLE [dbo].[RolMenu]  WITH CHECK ADD FOREIGN KEY([idMenu])
REFERENCES [dbo].[Menu] ([idMenu])
GO
ALTER TABLE [dbo].[RolMenu]  WITH CHECK ADD FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([idRol])
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([idRol])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([idTipoDocumentoVenta])
REFERENCES [dbo].[TipoDocumentoVenta] ([idTipoDocumentoVenta])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO