USE [master]
GO
/****** Object:  Database [Arquitectura4Capas]    Script Date: 21/6/2020 17:56:33 ******/
CREATE DATABASE [Arquitectura4Capas]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Arquitectura4Capas', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Arquitectura4Capas.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Arquitectura4Capas_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Arquitectura4Capas_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Arquitectura4Capas] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Arquitectura4Capas].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Arquitectura4Capas] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Arquitectura4Capas] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Arquitectura4Capas] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Arquitectura4Capas] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Arquitectura4Capas] SET ARITHABORT OFF 
GO
ALTER DATABASE [Arquitectura4Capas] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Arquitectura4Capas] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Arquitectura4Capas] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Arquitectura4Capas] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Arquitectura4Capas] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Arquitectura4Capas] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Arquitectura4Capas] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Arquitectura4Capas] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Arquitectura4Capas] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Arquitectura4Capas] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Arquitectura4Capas] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Arquitectura4Capas] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Arquitectura4Capas] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Arquitectura4Capas] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Arquitectura4Capas] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Arquitectura4Capas] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Arquitectura4Capas] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Arquitectura4Capas] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Arquitectura4Capas] SET  MULTI_USER 
GO
ALTER DATABASE [Arquitectura4Capas] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Arquitectura4Capas] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Arquitectura4Capas] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Arquitectura4Capas] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Arquitectura4Capas] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Arquitectura4Capas] SET QUERY_STORE = OFF
GO
USE [Arquitectura4Capas]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 21/6/2020 17:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[Id] [int] NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Apellido] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[BorrarPersona]    Script Date: 21/6/2020 17:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[BorrarPersona] 
@id int
AS
BEGIN
DELETE FROM Persona WHERE Id=@id
END
GO
/****** Object:  StoredProcedure [dbo].[InsertarPersona]    Script Date: 21/6/2020 17:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertarPersona] 
@nombre varchar(100),
@apellido varchar(100)
AS
BEGIN
DECLARE @id INT
SET @id = ISNULL( (SELECT MAX(Id) FROM Persona),0)+1
INSERT INTO Persona (Id, Nombre, Apellido) VALUES (@id, @nombre, @apellido)
END
GO
/****** Object:  StoredProcedure [dbo].[ListarID]    Script Date: 21/6/2020 17:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ListarID]
@id INT
AS
BEGIN
SELECT * FROM Persona WHERE Id=@Id
END
GO
/****** Object:  StoredProcedure [dbo].[ListarPersona]    Script Date: 21/6/2020 17:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ListarPersona]
AS
BEGIN
SELECT * FROM Persona
END
GO
/****** Object:  StoredProcedure [dbo].[ModificarPersona]    Script Date: 21/6/2020 17:56:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ModificarPersona] 
@id int,
@nombre varchar(100),
@apellido varchar(100)
AS
BEGIN
UPDATE Persona SET Nombre=@nombre, Apellido=@apellido WHERE Id=@id
END
GO
USE [master]
GO
ALTER DATABASE [Arquitectura4Capas] SET  READ_WRITE 
GO
