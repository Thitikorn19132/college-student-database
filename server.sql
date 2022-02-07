USE [master]
GO
/****** Object:  Database [college_student_database]    Script Date: 2/7/2022 9:41:07 AM ******/
CREATE DATABASE [college_student_database]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'college_student_database', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\college_student_database.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'college_student_database_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\college_student_database_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [college_student_database] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [college_student_database].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [college_student_database] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [college_student_database] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [college_student_database] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [college_student_database] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [college_student_database] SET ARITHABORT OFF 
GO
ALTER DATABASE [college_student_database] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [college_student_database] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [college_student_database] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [college_student_database] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [college_student_database] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [college_student_database] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [college_student_database] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [college_student_database] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [college_student_database] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [college_student_database] SET  DISABLE_BROKER 
GO
ALTER DATABASE [college_student_database] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [college_student_database] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [college_student_database] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [college_student_database] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [college_student_database] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [college_student_database] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [college_student_database] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [college_student_database] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [college_student_database] SET  MULTI_USER 
GO
ALTER DATABASE [college_student_database] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [college_student_database] SET DB_CHAINING OFF 
GO
ALTER DATABASE [college_student_database] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [college_student_database] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [college_student_database] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [college_student_database] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [college_student_database] SET QUERY_STORE = OFF
GO
USE [college_student_database]
GO
/****** Object:  Table [dbo].[Finance]    Script Date: 2/7/2022 9:41:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Finance](
	[Fin_id] [int] IDENTITY(1,1) NOT NULL,
	[Stu_id] [int] NULL,
	[Par_id] [int] NULL,
	[Fin_Payment] [money] NULL,
	[Fin_Date] [datetime2](7) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parent]    Script Date: 2/7/2022 9:41:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parent](
	[Par_id] [int] IDENTITY(1,1) NOT NULL,
	[Par_PrefixName] [nvarchar](255) NULL,
	[Par_FristName] [nvarchar](255) NULL,
	[Par_LastName] [nvarchar](255) NULL,
	[Par_Address] [ntext] NULL,
	[Par_Tel] [nvarchar](255) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 2/7/2022 9:41:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[Stu_id] [int] IDENTITY(1,1) NOT NULL,
	[Stu_PrefixName] [nvarchar](255) NULL,
	[Stu_FristName] [nvarchar](255) NULL,
	[Stu_LastName] [nvarchar](255) NULL,
	[Stu_Branch] [nvarchar](255) NULL,
	[Stu_Class] [nvarchar](255) NULL,
	[Stu_Tel] [nvarchar](255) NULL,
	[Stu_Email] [nvarchar](255) NULL,
	[Par_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Study]    Script Date: 2/7/2022 9:41:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Study](
	[Std_id] [int] IDENTITY(1,1) NOT NULL,
	[Std_Grade] [int] NULL,
	[Stu_id] [int] NULL,
	[Sub_id] [int] NULL,
	[Tch_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 2/7/2022 9:41:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[Sub_id] [int] IDENTITY(1,1) NOT NULL,
	[Sub_Name] [nvarchar](255) NULL,
	[Sub_Code] [nvarchar](255) NULL,
	[Sub_Credit] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 2/7/2022 9:41:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[Tch_id] [int] IDENTITY(1,1) NOT NULL,
	[Tch_PrefixName] [nvarchar](255) NULL,
	[Tch_FristName] [nvarchar](255) NULL,
	[Tch_LastName] [nvarchar](255) NULL,
	[Tch_Branch] [nvarchar](255) NULL,
	[Tch_Salary] [money] NULL,
	[Tch_Address] [ntext] NULL,
	[Tch_Tel] [nvarchar](255) NULL,
	[Tch_Email] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [college_student_database] SET  READ_WRITE 
GO
