USE [master]

DROP DATABASE  IF EXISTS  Escuela
GO
CREATE DATABASE Escuela
GO
USE Escuela
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clase](
	[ClaseID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[FechaApertura] [date] NULL,
	[Precio] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inscripcion]    Script Date: 6/1/2020 8:23:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inscripcion](
	[InscripcionID] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NULL,
	[ClaseID] [int] NULL,
	[AlumnoID] [int] NULL,
	[MaestroID] [int] NULL,
	[Hora] [varchar](20) NULL,
 CONSTRAINT [PK_Inscripcion] PRIMARY KEY CLUSTERED 
(
	[InscripcionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 6/1/2020 8:23:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumno](
	[AlumnoID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](max) NOT NULL,
	[Apellido] [varchar](20) NOT NULL,
	[Correo] [varchar](500) NULL,
	[Edad] [int] NOT NULL,
	[Sexo] [varchar](20) NULL,
	[Direccion] [varchar](500) NULL,
	[Telefono] [varchar](100) NULL,
 CONSTRAINT [PK__Alumno__90A6AA330C050246] PRIMARY KEY CLUSTERED 
(
	[AlumnoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vAlumnosMatriculados]    Script Date: 6/1/2020 8:23:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vAlumnosMatriculados]

AS


SELECT AlumnoID, Nombre, Apellido, Edad, Sexo, Direccion ,
(select COUNT(*) from inscripcion I WHERE I.AlumnoID  = A.AlumnoID) TotalClases,

( 
	select ISNULL(SUM(Precio), 0 ) from inscripcion I INNER JOIN Clase C On I.ClaseID = C.ClaseID
	WHERE I.AlumnoID = A.AlumnoID

) SumaTotal,

(
	SELECT ISNULL( AVG(Precio),0) from Inscripcion I inner join Clase C on I.ClaseID = C.ClaseID
WHERE I.ALumnoID = A.AlumnoID
) PromedioPorClase

FROM Alumno A

GO
/****** Object:  Table [dbo].[Maestro]    Script Date: 6/1/2020 8:23:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maestro](
	[MaestroID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Apellido] [varchar](100) NULL,
	[Correo] [varchar](500) NULL,
	[Direccion] [varchar](500) NULL,
	[Edad] [int] NULL,
	[Sueldo] [money] NULL,
	[FechaDeIngreso] [date] NULL,
	[Telefono] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaestroID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MarcaMaestros]    Script Date: 6/1/2020 8:23:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarcaMaestros](
	[MarcaID] [int] IDENTITY(1,1) NOT NULL,
	[FechaEntrada] [datetime] NULL,
	[FechaSalida] [datetime] NULL,
	[MaestroID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MarcaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Alumno] ON 

INSERT [dbo].[Alumno] ([AlumnoID], [Nombre], [Apellido], [Correo], [Edad], [Sexo], [Direccion], [Telefono]) VALUES (1, N'Rojer', N'Rojas', NULL, 42, N'Masculino', N'Tegucigalpa, Honduras', N'2446-6557')
INSERT [dbo].[Alumno] ([AlumnoID], [Nombre], [Apellido], [Correo], [Edad], [Sexo], [Direccion], [Telefono]) VALUES (2, N'Tomas', N'Garay', NULL, 22, N'Masculino', N'San Pedro Sula, Honduras', N'2566-6595')
INSERT [dbo].[Alumno] ([AlumnoID], [Nombre], [Apellido], [Correo], [Edad], [Sexo], [Direccion], [Telefono]) VALUES (3, N'Ana', N'Gutierrez', NULL, 21, N'Femenino', N'San Pedro Sula Honduras', N'2866-0005')
INSERT [dbo].[Alumno] ([AlumnoID], [Nombre], [Apellido], [Correo], [Edad], [Sexo], [Direccion], [Telefono]) VALUES (4, N'Johana', N'Pineda', NULL, 34, N'Femenino', N'Barrio x', N'1525-5665')
INSERT [dbo].[Alumno] ([AlumnoID], [Nombre], [Apellido], [Correo], [Edad], [Sexo], [Direccion], [Telefono]) VALUES (5, N'Johana', N'Pineda', NULL, 34, N'Femenino', N'Barrio x', N'1525-5665')
INSERT [dbo].[Alumno] ([AlumnoID], [Nombre], [Apellido], [Correo], [Edad], [Sexo], [Direccion], [Telefono]) VALUES (6, N'Johana', N'Pineda', NULL, 34, N'Femenino', N'Barrio x', N'1525-5665')
INSERT [dbo].[Alumno] ([AlumnoID], [Nombre], [Apellido], [Correo], [Edad], [Sexo], [Direccion], [Telefono]) VALUES (7, N'Carmen', N'Pineda', NULL, 22, N'Femenino', N'Barrio el Guanacaste', N'1515-5595')
INSERT [dbo].[Alumno] ([AlumnoID], [Nombre], [Apellido], [Correo], [Edad], [Sexo], [Direccion], [Telefono]) VALUES (8, N'Carlos', N'Agurcia', NULL, 22, N'Masculino', N'Barrio el benque SPS', N'2541-59595')
INSERT [dbo].[Alumno] ([AlumnoID], [Nombre], [Apellido], [Correo], [Edad], [Sexo], [Direccion], [Telefono]) VALUES (9, N'CarmenR', N'Pineda', NULL, 22, N'Femenino', N'Barrio el Guanacaste', N'1515-5595')
SET IDENTITY_INSERT [dbo].[Alumno] OFF
GO
SET IDENTITY_INSERT [dbo].[Clase] ON 

INSERT [dbo].[Clase] ([ClaseID], [Nombre], [FechaApertura], [Precio]) VALUES (1, N'Español', CAST(N'2020-03-18' AS Date), 200.0000)
INSERT [dbo].[Clase] ([ClaseID], [Nombre], [FechaApertura], [Precio]) VALUES (2, N'Matematicas', CAST(N'2020-03-18' AS Date), 300.0000)
INSERT [dbo].[Clase] ([ClaseID], [Nombre], [FechaApertura], [Precio]) VALUES (3, N'Ingles', CAST(N'2020-03-18' AS Date), 220.0000)
INSERT [dbo].[Clase] ([ClaseID], [Nombre], [FechaApertura], [Precio]) VALUES (4, N'Español', CAST(N'2020-03-18' AS Date), 200.0000)
INSERT [dbo].[Clase] ([ClaseID], [Nombre], [FechaApertura], [Precio]) VALUES (5, N'Matematicas', CAST(N'2020-03-18' AS Date), 220.0000)
INSERT [dbo].[Clase] ([ClaseID], [Nombre], [FechaApertura], [Precio]) VALUES (6, N'Ingles', CAST(N'2020-03-18' AS Date), 380.0000)
INSERT [dbo].[Clase] ([ClaseID], [Nombre], [FechaApertura], [Precio]) VALUES (7, N'Computación', CAST(N'2020-03-24' AS Date), 250.0000)
SET IDENTITY_INSERT [dbo].[Clase] OFF
GO
SET IDENTITY_INSERT [dbo].[Inscripcion] ON 

INSERT [dbo].[Inscripcion] ([InscripcionID], [Fecha], [ClaseID], [AlumnoID], [MaestroID], [Hora]) VALUES (1, CAST(N'2020-03-26T20:07:21.847' AS DateTime), 1, 1, 1, N'2000')
INSERT [dbo].[Inscripcion] ([InscripcionID], [Fecha], [ClaseID], [AlumnoID], [MaestroID], [Hora]) VALUES (2, CAST(N'2020-03-26T20:45:26.387' AS DateTime), 4, 1, 1, N'2100')
INSERT [dbo].[Inscripcion] ([InscripcionID], [Fecha], [ClaseID], [AlumnoID], [MaestroID], [Hora]) VALUES (3, CAST(N'2020-04-10T22:05:05.547' AS DateTime), 7, 3, 3, N'1400')
SET IDENTITY_INSERT [dbo].[Inscripcion] OFF
GO
SET IDENTITY_INSERT [dbo].[Maestro] ON 

INSERT [dbo].[Maestro] ([MaestroID], [Nombre], [Apellido], [Correo], [Direccion], [Edad], [Sueldo], [FechaDeIngreso], [Telefono]) VALUES (1, N'Estefania', N'Bonilla', N'estefani@gmail.com', N'San Pedro Sula Honduras', 20, 2500.0000, CAST(N'2019-12-25' AS Date), N'2545-8569')
INSERT [dbo].[Maestro] ([MaestroID], [Nombre], [Apellido], [Correo], [Direccion], [Edad], [Sueldo], [FechaDeIngreso], [Telefono]) VALUES (2, N'Carmen', N'Najera', N'carmen@gmail.com', N'Tegucigalpa Honduras', 22, 2400.0000, CAST(N'2019-01-25' AS Date), N'2545-8582')
INSERT [dbo].[Maestro] ([MaestroID], [Nombre], [Apellido], [Correo], [Direccion], [Edad], [Sueldo], [FechaDeIngreso], [Telefono]) VALUES (3, N'Mirna', N'Reyes', N'mirna@gmail.com', N'Cortes Honduras', 26, 2200.0000, CAST(N'2019-06-12' AS Date), N'2545-1469')
INSERT [dbo].[Maestro] ([MaestroID], [Nombre], [Apellido], [Correo], [Direccion], [Edad], [Sueldo], [FechaDeIngreso], [Telefono]) VALUES (4, N'Elmer', N'Pineda', N'elmer@gmail.com', N'San Pedro Sula Honduras', 18, 2100.0000, CAST(N'2019-11-20' AS Date), N'2545-8545')
SET IDENTITY_INSERT [dbo].[Maestro] OFF
GO
SET IDENTITY_INSERT [dbo].[MarcaMaestros] ON 

INSERT [dbo].[MarcaMaestros] ([MarcaID], [FechaEntrada], [FechaSalida], [MaestroID]) VALUES (1, CAST(N'2020-03-24T08:10:15.000' AS DateTime), CAST(N'2020-03-24T16:01:12.000' AS DateTime), NULL)
INSERT [dbo].[MarcaMaestros] ([MarcaID], [FechaEntrada], [FechaSalida], [MaestroID]) VALUES (2, CAST(N'2020-03-24T07:58:20.000' AS DateTime), CAST(N'2020-03-24T15:57:10.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[MarcaMaestros] OFF
GO
/****** Object:  StoredProcedure [dbo].[spInsertarAlumno]    Script Date: 6/1/2020 8:23:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--spInsertarAlumno 'Carmen', 'Pineda', 14, 'Femenino', 'Barrio el centro', '1515-5595'

CREATE Procedure [dbo].[spInsertarAlumno] 
	@Nombre VARCHAR(100),
	@Apellido VARCHAR(100),
	@Edad int,
	@Sexo VARCHAR(20),
	@Direccion VARCHAR(200),
	@Telefono VARCHAR(20)
AS
BEGIN

	DECLARE @Existe BIT = (SELECT COUNT(*) FROM Alumno WHERE Nombre =@Nombre AND Apellido =  @Apellido)
	IF(@Existe =1)
	BEGIN
		DECLARE @AlumnoID INT = (Select TOP 1 AlumnoID from Alumno Where Nombre =@Nombre AND Apellido =  @Apellido)
		UPDATE Alumno Set Edad = @Edad, Sexo = @Sexo, Direccion = @Direccion, Telefono = @Telefono Where
				AlumnoID = @AlumnoID
	END
	ELSE
	BEGIN
		INSERT INTO Alumno (Nombre, Apellido, Edad, Sexo, Direccion, Telefono)
		VALUES (@Nombre,@Apellido,@Edad,@Sexo,@Direccion,@Telefono)
	END
END
GO
USE [master]
GO
ALTER DATABASE [Escuela] SET  READ_WRITE 
GO
