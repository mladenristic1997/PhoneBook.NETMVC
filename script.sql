USE [master]
GO
/****** Object:  Database [GrototApp]    Script Date: 14.11.2018. 01:12:24 ******/
CREATE DATABASE [GrototApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GrototApp', FILENAME = N'F:\Program Files\Microsoft SQL Server\MSSQL14.GROGOT\MSSQL\DATA\GrototApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GrototApp_log', FILENAME = N'F:\Program Files\Microsoft SQL Server\MSSQL14.GROGOT\MSSQL\DATA\GrototApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GrototApp] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GrototApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GrototApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GrototApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GrototApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GrototApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GrototApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [GrototApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GrototApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GrototApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GrototApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GrototApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GrototApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GrototApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GrototApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GrototApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GrototApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GrototApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GrototApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GrototApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GrototApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GrototApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GrototApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GrototApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GrototApp] SET RECOVERY FULL 
GO
ALTER DATABASE [GrototApp] SET  MULTI_USER 
GO
ALTER DATABASE [GrototApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GrototApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GrototApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GrototApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GrototApp] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'GrototApp', N'ON'
GO
ALTER DATABASE [GrototApp] SET QUERY_STORE = OFF
GO
USE [GrototApp]
GO
/****** Object:  Table [dbo].[City]    Script Date: 14.11.2018. 01:12:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CountryId] [int] NOT NULL,
	[CityName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 14.11.2018. 01:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 14.11.2018. 01:12:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[PersonId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](50) NULL,
	[Sex] [bit] NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[CountryId] [int] NOT NULL,
	[CityId] [int] NOT NULL,
	[DOB] [date] NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[City] ON 

INSERT [dbo].[City] ([CityId], [CountryId], [CityName]) VALUES (1, 1, N'New York City')
INSERT [dbo].[City] ([CityId], [CountryId], [CityName]) VALUES (2, 1, N'Los Angeles')
INSERT [dbo].[City] ([CityId], [CountryId], [CityName]) VALUES (3, 1, N'San Francisco')
INSERT [dbo].[City] ([CityId], [CountryId], [CityName]) VALUES (4, 2, N'Moscow')
INSERT [dbo].[City] ([CityId], [CountryId], [CityName]) VALUES (5, 2, N'St. Petersburg')
INSERT [dbo].[City] ([CityId], [CountryId], [CityName]) VALUES (6, 2, N'Kazan')
INSERT [dbo].[City] ([CityId], [CountryId], [CityName]) VALUES (7, 3, N'Berlin')
INSERT [dbo].[City] ([CityId], [CountryId], [CityName]) VALUES (8, 3, N'Munich')
INSERT [dbo].[City] ([CityId], [CountryId], [CityName]) VALUES (9, 3, N'Dresden')
SET IDENTITY_INSERT [dbo].[City] OFF
SET IDENTITY_INSERT [dbo].[Country] ON 

INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (1, N'USA')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (2, N'Russia')
INSERT [dbo].[Country] ([CountryId], [CountryName]) VALUES (3, N'Germany')
SET IDENTITY_INSERT [dbo].[Country] OFF
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [PhoneNumber], [Sex], [Email], [CountryId], [CityId], [DOB]) VALUES (7, N'Mladen', N'Ristic', N'333/333-212', 1, N'asda@asd.com', 3, 8, CAST(N'1923-11-30' AS Date))
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [PhoneNumber], [Sex], [Email], [CountryId], [CityId], [DOB]) VALUES (8, N'a', N'a', N'111/111-111', 1, N'asd@a.com', 2, 5, CAST(N'1980-11-11' AS Date))
INSERT [dbo].[Person] ([PersonId], [FirstName], [LastName], [PhoneNumber], [Sex], [Email], [CountryId], [CityId], [DOB]) VALUES (9, N'as', N'asd', N'111/111-111', 0, N'sdadas@sdc.com', 1, 2, CAST(N'1111-11-11' AS Date))
SET IDENTITY_INSERT [dbo].[Person] OFF
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Country]
GO
ALTER TABLE [dbo].[Country]  WITH NOCHECK ADD  CONSTRAINT [FK_Country_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([CountryId])
GO
ALTER TABLE [dbo].[Country] NOCHECK CONSTRAINT [FK_Country_Country]
GO
USE [master]
GO
ALTER DATABASE [GrototApp] SET  READ_WRITE 
GO
