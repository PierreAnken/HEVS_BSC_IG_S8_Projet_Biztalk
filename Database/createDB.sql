DECLARE @Table TABLE(
        SPID INT,
        Status VARCHAR(MAX),
        LOGIN VARCHAR(MAX),
        HostName VARCHAR(MAX),
        BlkBy VARCHAR(MAX),
        DBName VARCHAR(MAX),
        Command VARCHAR(MAX),
        CPUTime INT,
        DiskIO INT,
        LastBatch VARCHAR(MAX),
        ProgramName VARCHAR(MAX),
        SPID_1 INT,
        REQUESTID INT
)
INSERT INTO @Table EXEC sp_who2

DECLARE @kid SMALLINT
SET @kid = (SELECT spid FROM @Table WHERE DBName = 'G2FTPUC1')
DECLARE @SQL nvarchar(1000)
SET @SQL = 'KILL ' + CAST(@kid as varchar(4))
EXEC (@SQL)

USE master
IF EXISTS(select * from sys.databases where name='G2FTPUC1')
DROP DATABASE G2FTPUC1
/****** Object:  Database [G2FTPUC1]    Script Date: 19.05.2020 18:12:17 ******/
CREATE DATABASE [G2FTPUC1]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'G2FTPUC1', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\G2FTPUC1.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'G2FTPUC1_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\G2FTPUC1_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [G2FTPUC1] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [G2FTPUC1].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [G2FTPUC1] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [G2FTPUC1] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [G2FTPUC1] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [G2FTPUC1] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [G2FTPUC1] SET ARITHABORT OFF 
GO
ALTER DATABASE [G2FTPUC1] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [G2FTPUC1] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [G2FTPUC1] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [G2FTPUC1] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [G2FTPUC1] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [G2FTPUC1] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [G2FTPUC1] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [G2FTPUC1] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [G2FTPUC1] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [G2FTPUC1] SET  DISABLE_BROKER 
GO
ALTER DATABASE [G2FTPUC1] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [G2FTPUC1] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [G2FTPUC1] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [G2FTPUC1] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [G2FTPUC1] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [G2FTPUC1] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [G2FTPUC1] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [G2FTPUC1] SET RECOVERY FULL 
GO
ALTER DATABASE [G2FTPUC1] SET  MULTI_USER 
GO
ALTER DATABASE [G2FTPUC1] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [G2FTPUC1] SET DB_CHAINING OFF 
GO
ALTER DATABASE [G2FTPUC1] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [G2FTPUC1] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [G2FTPUC1] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'G2FTPUC1', N'ON'
GO
ALTER DATABASE [G2FTPUC1] SET QUERY_STORE = OFF
GO
USE [G2FTPUC1]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [G2FTPUC1]
GO
/****** Object:  Table [dbo].[GC_AccessLog]    Script Date: 19.05.2020 18:12:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GC_AccessLog](
	[CardId] [int] NOT NULL,
	[DoorId] [int] NOT NULL,
	[TimeStamp] [datetime] NOT NULL,
	[AccessResult] [bit] NULL,
	[WorkTimeComputed] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GC_Rights]    Script Date: 19.05.2020 18:12:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GC_Rights](
	[CardId] [int] NOT NULL,
	[AccessRight] [nvarchar](50) NOT NULL,
	[UID] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SAP_HR]    Script Date: 19.05.2020 18:12:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SAP_HR](
	[UID] [nvarchar](50) NOT NULL,
	[CardId] [int] NOT NULL,
	[PIN] [int] NOT NULL
) ON [PRIMARY]
GO
INSERT [dbo].[GC_AccessLog] ([CardId], [DoorId], [TimeStamp], [AccessResult], [WorkTimeComputed]) VALUES (2235026, 1, CAST(N'2020-05-18T13:30:21.977' AS DateTime), 1, NULL)
GO
INSERT [dbo].[GC_AccessLog] ([CardId], [DoorId], [TimeStamp], [AccessResult], [WorkTimeComputed]) VALUES (2906164, 1, CAST(N'2020-05-18T11:30:21.977' AS DateTime), 1, NULL)
GO
INSERT [dbo].[GC_AccessLog] ([CardId], [DoorId], [TimeStamp], [AccessResult], [WorkTimeComputed]) VALUES (8139494, 1, CAST(N'2020-05-18T15:30:21.993' AS DateTime), 1, NULL)
GO
INSERT [dbo].[GC_AccessLog] ([CardId], [DoorId], [TimeStamp], [AccessResult], [WorkTimeComputed]) VALUES (2208972, 1, CAST(N'2020-05-18T06:30:21.993' AS DateTime), 1, NULL)
GO
INSERT [dbo].[GC_AccessLog] ([CardId], [DoorId], [TimeStamp], [AccessResult], [WorkTimeComputed]) VALUES (5192471, 1, CAST(N'2020-05-18T09:30:21.993' AS DateTime), 1, NULL)
GO
INSERT [dbo].[GC_AccessLog] ([CardId], [DoorId], [TimeStamp], [AccessResult], [WorkTimeComputed]) VALUES (9708443, 1, CAST(N'2020-05-18T11:30:21.993' AS DateTime), 1, NULL)
GO
INSERT [dbo].[GC_AccessLog] ([CardId], [DoorId], [TimeStamp], [AccessResult], [WorkTimeComputed]) VALUES (1268207, 1, CAST(N'2020-05-18T13:30:22.007' AS DateTime), 1, NULL)
GO
INSERT [dbo].[GC_AccessLog] ([CardId], [DoorId], [TimeStamp], [AccessResult], [WorkTimeComputed]) VALUES (6749277, 1, CAST(N'2020-05-18T10:30:22.007' AS DateTime), 1, NULL)
GO
INSERT [dbo].[GC_AccessLog] ([CardId], [DoorId], [TimeStamp], [AccessResult], [WorkTimeComputed]) VALUES (3590351, 1, CAST(N'2020-05-18T09:30:22.007' AS DateTime), 1, NULL)
GO
INSERT [dbo].[GC_AccessLog] ([CardId], [DoorId], [TimeStamp], [AccessResult], [WorkTimeComputed]) VALUES (7330038, 1, CAST(N'2020-05-18T09:30:22.007' AS DateTime), 1, NULL)
GO
INSERT [dbo].[GC_AccessLog] ([CardId], [DoorId], [TimeStamp], [AccessResult], [WorkTimeComputed]) VALUES (6191128, 1, CAST(N'2020-05-18T08:30:22.007' AS DateTime), 1, NULL)
GO
INSERT [dbo].[GC_Rights] ([CardId], [AccessRight], [UID]) VALUES (2235026, N'default', N'ASX12354')
GO
INSERT [dbo].[GC_Rights] ([CardId], [AccessRight], [UID]) VALUES (2906164, N'default', N'DSE53421')
GO
INSERT [dbo].[GC_Rights] ([CardId], [AccessRight], [UID]) VALUES (8139494, N'default', N'GRJ43212')
GO
INSERT [dbo].[GC_Rights] ([CardId], [AccessRight], [UID]) VALUES (2208972, N'default', N'FJE12342')
GO
INSERT [dbo].[GC_Rights] ([CardId], [AccessRight], [UID]) VALUES (5192471, N'default', N'TJK23543')
GO
INSERT [dbo].[GC_Rights] ([CardId], [AccessRight], [UID]) VALUES (9708443, N'default', N'FJE13555')
GO
INSERT [dbo].[GC_Rights] ([CardId], [AccessRight], [UID]) VALUES (1268207, N'default', N'RJK42528')
GO
INSERT [dbo].[GC_Rights] ([CardId], [AccessRight], [UID]) VALUES (6749277, N'default', N'TOI12312')
GO
INSERT [dbo].[GC_Rights] ([CardId], [AccessRight], [UID]) VALUES (3590351, N'default', N'TRJ13452')
GO
INSERT [dbo].[GC_Rights] ([CardId], [AccessRight], [UID]) VALUES (7330038, N'default', N'PTP52344')
GO
INSERT [dbo].[GC_Rights] ([CardId], [AccessRight], [UID]) VALUES (6191128, N'default', N'JKF34254')
GO
INSERT [dbo].[SAP_HR] ([UID], [CardId], [PIN]) VALUES (N'ASX12354', 2235026, 8742)
GO
INSERT [dbo].[SAP_HR] ([UID], [CardId], [PIN]) VALUES (N'DSE53421', 2906164, 4542)
GO
INSERT [dbo].[SAP_HR] ([UID], [CardId], [PIN]) VALUES (N'GRJ43212', 8139494, 4324)
GO
INSERT [dbo].[SAP_HR] ([UID], [CardId], [PIN]) VALUES (N'FJE12342', 2208972, 6532)
GO
INSERT [dbo].[SAP_HR] ([UID], [CardId], [PIN]) VALUES (N'TJK23543', 5192471, 6839)
GO
INSERT [dbo].[SAP_HR] ([UID], [CardId], [PIN]) VALUES (N'FJE13555', 9708443, 4246)
GO
INSERT [dbo].[SAP_HR] ([UID], [CardId], [PIN]) VALUES (N'RJK42528', 1268207, 7615)
GO
INSERT [dbo].[SAP_HR] ([UID], [CardId], [PIN]) VALUES (N'TOI12312', 6749277, 3585)
GO
INSERT [dbo].[SAP_HR] ([UID], [CardId], [PIN]) VALUES (N'TRJ13452', 3590351, 1811)
GO
INSERT [dbo].[SAP_HR] ([UID], [CardId], [PIN]) VALUES (N'PTP52344', 7330038, 4838)
GO
INSERT [dbo].[SAP_HR] ([UID], [CardId], [PIN]) VALUES (N'JKF34254', 6191128, 6686)
GO
USE [master]
GO
ALTER DATABASE [G2FTPUC1] SET  READ_WRITE 
GO