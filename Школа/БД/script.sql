USE [master]
GO
/****** Object:  Database [20.102k-14-School]    Script Date: 14.04.2024 15:48:48 ******/
CREATE DATABASE [20.102k-14-School]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'20.102k-14-School', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\20.102k-14-School.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'20.102k-14-School_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\20.102k-14-School_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [20.102k-14-School] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [20.102k-14-School].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [20.102k-14-School] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [20.102k-14-School] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [20.102k-14-School] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [20.102k-14-School] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [20.102k-14-School] SET ARITHABORT OFF 
GO
ALTER DATABASE [20.102k-14-School] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [20.102k-14-School] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [20.102k-14-School] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [20.102k-14-School] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [20.102k-14-School] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [20.102k-14-School] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [20.102k-14-School] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [20.102k-14-School] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [20.102k-14-School] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [20.102k-14-School] SET  DISABLE_BROKER 
GO
ALTER DATABASE [20.102k-14-School] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [20.102k-14-School] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [20.102k-14-School] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [20.102k-14-School] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [20.102k-14-School] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [20.102k-14-School] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [20.102k-14-School] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [20.102k-14-School] SET RECOVERY FULL 
GO
ALTER DATABASE [20.102k-14-School] SET  MULTI_USER 
GO
ALTER DATABASE [20.102k-14-School] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [20.102k-14-School] SET DB_CHAINING OFF 
GO
ALTER DATABASE [20.102k-14-School] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [20.102k-14-School] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [20.102k-14-School] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [20.102k-14-School] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'20.102k-14-School', N'ON'
GO
ALTER DATABASE [20.102k-14-School] SET QUERY_STORE = ON
GO
ALTER DATABASE [20.102k-14-School] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [20.102k-14-School]
GO
/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 14.04.2024 15:48:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedProduct](
	[MainProductID] [int] NOT NULL,
	[AttachedProductID] [int] NOT NULL,
 CONSTRAINT [PK_AttachedProduct] PRIMARY KEY CLUSTERED 
(
	[MainProductID] ASC,
	[AttachedProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 14.04.2024 15:48:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[GenderCode] [nvarchar](50) NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 14.04.2024 15:48:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 14.04.2024 15:48:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentByService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 14.04.2024 15:48:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 14.04.2024 15:48:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 14.04.2024 15:48:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[ManufacturerID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 14.04.2024 15:48:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 14.04.2024 15:48:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 14.04.2024 15:48:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[DurationInSeconds] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Discount] [float] NULL,
	[MainImagePath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 14.04.2024 15:48:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 14.04.2024 15:48:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 14.04.2024 15:48:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[ClientID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (2, N'Алла', N'Ермакова', N'Мироновна', CAST(N'1976-01-22' AS Date), CAST(N'2017-02-09T00:00:00.000' AS DateTime), N'whimsy@aol.com', N'7(06)437-13-73 ', N'ж', N'\Клиенты\48.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (3, N'Глеб', N'Селиверстов', N'Максимович', CAST(N'1999-06-20' AS Date), CAST(N'2016-01-07T00:00:00.000' AS DateTime), N'jigsaw@sbcglobal.net', N'7(20)554-28-68 ', N'м', N'\Клиенты\m37.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (4, N'Юстиниан', N'Агафонов', N'Олегович', CAST(N'1997-02-02' AS Date), CAST(N'2016-06-08T00:00:00.000' AS DateTime), N'staffelb@sbcglobal.net', N'7(303)810-28-78 ', N'м', N'\Клиенты\m1.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (5, N'Злата', N'Колобова', N'Романовна', CAST(N'1994-08-25' AS Date), CAST(N'2016-12-03T00:00:00.000' AS DateTime), N'sinkou@aol.com', N'7(50)884-07-35 ', N'ж', N'\Клиенты\18.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (6, N'Дарина', N'Сысоева', N'Ярославовна', CAST(N'1982-02-03' AS Date), CAST(N'2016-05-13T00:00:00.000' AS DateTime), N'treit@verizon.net', N'7(0698)387-96-04 ', N'ж', N'\Клиенты\32.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (7, N'Варлам', N'Некрасов', N'Михайлович', CAST(N'2000-11-12' AS Date), CAST(N'2017-12-03T00:00:00.000' AS DateTime), N'dogdude@verizon.net', N'7(019)258-06-35 ', N'м', N'\Клиенты\m42.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (8, N'Наум', N'Крюков', N'Ильяович', CAST(N'1993-11-17' AS Date), CAST(N'2017-02-01T00:00:00.000' AS DateTime), N'floxy@hotmail.com', N'7(81)657-88-92 ', N'м', N'\Клиенты\m30.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (9, N'Татьяна', N'Сидорова', N'Михайловна', CAST(N'1974-04-24' AS Date), CAST(N'2018-10-03T00:00:00.000' AS DateTime), N'tbeck@mac.com', N'7(51)732-91-79 ', N'ж', N'\Клиенты\42.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (10, N'Альжбета', N'Трофимова', N'Якововна', CAST(N'1988-10-22' AS Date), CAST(N'2017-09-21T00:00:00.000' AS DateTime), N'gbacon@mac.com', N'7(1084)658-92-95 ', N'ж', N'\Клиенты\25.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (11, N'Адриан', N'Новиков', N'Аркадьевич', CAST(N'1974-01-15' AS Date), CAST(N'2018-11-23T00:00:00.000' AS DateTime), N'multiplx@verizon.net', N'7(70)572-33-62 ', N'м', N'\Клиенты\m40.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (12, N'Иветта', N'Мишина', N'Андреевна', CAST(N'2002-10-05' AS Date), CAST(N'2016-01-24T00:00:00.000' AS DateTime), N'aukjan@yahoo.com', N'7(3926)244-81-96 ', N'ж', N'\Клиенты\30.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (13, N'Геннадий', N'Шестаков', N'Рубенович', CAST(N'2001-07-01' AS Date), CAST(N'2018-12-08T00:00:00.000' AS DateTime), N'tokuhirom@live.com', N'7(2066)037-11-60 ', N'м', N'\Клиенты\m41.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (14, N'Матвей', N'Зуев', N'Иванович', CAST(N'1981-03-28' AS Date), CAST(N'2018-12-18T00:00:00.000' AS DateTime), N'brickbat@verizon.net', N'7(5383)893-04-66 ', N'м', N'\Клиенты\m38.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (15, N'Георгина', N'Турова', N'Семёновна', CAST(N'1974-05-28' AS Date), CAST(N'2018-02-22T00:00:00.000' AS DateTime), N'yruan@optonline.net', N'7(555)321-42-99 ', N'ж', N'\Клиенты\27.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (16, N'Валентин', N'Анисимов', N'Пантелеймонович', CAST(N'2000-12-10' AS Date), CAST(N'2018-01-20T00:00:00.000' AS DateTime), N'aaribaud@hotmail.com', N'7(700)326-70-24 ', N'м', N'\Клиенты\m99.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (17, N'Тамара', N'Анисимова', N'Витальевна', CAST(N'1988-06-16' AS Date), CAST(N'2016-02-25T00:00:00.000' AS DateTime), N'schwaang@mac.com', N'7(66)128-04-10 ', N'ж', N'\Клиенты\2.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (18, N'Орест', N'Колобов', N'Юлианович', CAST(N'2001-07-14' AS Date), CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'parkes@verizon.net', N'7(1680)508-58-26 ', N'м', N'\Клиенты\m27.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (19, N'Аристарх', N'Филатов', N'Дмитриевич', CAST(N'1989-05-29' AS Date), CAST(N'2017-01-11T00:00:00.000' AS DateTime), N'hampton@att.net', N'7(696)235-29-24 ', N'м', N'\Клиенты\m43.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (20, N'Влада', N'Орлова', N'Мартыновна', CAST(N'1990-06-26' AS Date), CAST(N'2016-03-21T00:00:00.000' AS DateTime), N'rnelson@yahoo.ca', N'7(2506)433-38-35 ', N'ж', N'\Клиенты\22.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (21, N'Элина', N'Алексеева', N'Матвеевна', CAST(N'2002-05-07' AS Date), CAST(N'2018-03-28T00:00:00.000' AS DateTime), N'pthomsen@verizon.net', N'7(8086)245-64-81 ', N'ж', N'\Клиенты\1.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (22, N'Агафон', N'Бобров', N'Лаврентьевич', CAST(N'1995-07-29' AS Date), CAST(N'2017-05-09T00:00:00.000' AS DateTime), N'petersen@comcast.net', N'7(2159)507-39-57 ', N'м', N'\Клиенты\m35.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (23, N'Инара', N'Бирюкова', N'Улебовна', CAST(N'1978-07-21' AS Date), CAST(N'2017-10-01T00:00:00.000' AS DateTime), N'smpeters@hotmail.com', N'7(098)346-50-58 ', N'ж', N'\Клиенты\5.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (24, N'Марк', N'Панфилов', N'Рудольфович', CAST(N'1991-04-13' AS Date), CAST(N'2016-02-23T00:00:00.000' AS DateTime), N'cremonini@optonline.net', N'7(764)282-55-22 ', N'м', N'\Клиенты\m45.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (25, N'Алина', N'Колесникова', N'Еремеевна', CAST(N'2001-04-19' AS Date), CAST(N'2017-01-18T00:00:00.000' AS DateTime), N'gfxguy@outlook.com', N'7(74)977-39-71 ', N'ж', N'\Клиенты\40.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (26, N'Наум', N'Морозов', N'Валерьянович', CAST(N'1985-07-04' AS Date), CAST(N'2016-05-02T00:00:00.000' AS DateTime), N'salesgeek@mac.com', N'7(636)050-96-13 ', N'м', N'\Клиенты\m49.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (27, N'Давид', N'Горбачёв', N'Тимурович', CAST(N'1983-05-22' AS Date), CAST(N'2018-12-17T00:00:00.000' AS DateTime), N'hedwig@att.net', N'7(53)602-85-41 ', N'м', N'\Клиенты\m36.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (28, N'Оскар', N'Васильев', N'Богданович', CAST(N'1971-01-30' AS Date), CAST(N'2017-05-28T00:00:00.000' AS DateTime), N'miturria@verizon.net', N'7(585)801-94-29 ', N'м', N'\Клиенты\m15.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (29, N'Номи', N'Ершова', N'Андреевна', CAST(N'2001-09-13' AS Date), CAST(N'2016-06-30T00:00:00.000' AS DateTime), N'miltchev@mac.com', N'7(7757)315-90-99 ', N'ж', N'\Клиенты\14.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (30, N'Святослав', N'Медведев', N'Юлианович', CAST(N'1972-10-04' AS Date), CAST(N'2018-10-13T00:00:00.000' AS DateTime), N'hllam@comcast.net', N'7(3520)435-21-20 ', N'м', N'\Клиенты\m13.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (31, N'Эльмира', N'Баранова', N'Дмитриевна', CAST(N'1977-01-15' AS Date), CAST(N'2016-07-08T00:00:00.000' AS DateTime), N'jgmyers@comcast.net', N'7(9240)643-15-50 ', N'ж', N'\Клиенты\4.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (32, N'Харита', N'Попова', N'Якуновна', CAST(N'1997-12-16' AS Date), CAST(N'2016-07-05T00:00:00.000' AS DateTime), N'firstpr@verizon.net', N'7(335)386-81-06 ', N'ж', N'\Клиенты\36.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (33, N'Аверкий', N'Кудряшов', N'Константинович', CAST(N'1991-07-26' AS Date), CAST(N'2018-03-08T00:00:00.000' AS DateTime), N'nanop@msn.com', N'7(88)732-96-30 ', N'м', N'\Клиенты\m33.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (34, N'Марта', N'Горшкова', N'Иосифовна', CAST(N'2001-02-13' AS Date), CAST(N'2016-08-04T00:00:00.000' AS DateTime), N'gbacon@mac.com', N'7(544)650-59-03', N'ж', N'\Клиенты\9.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (35, N'Богдан', N'Кудрявцев', N'Христофорович', CAST(N'1988-02-27' AS Date), CAST(N'2016-10-07T00:00:00.000' AS DateTime), N'lukka@hotmail.com', N'7(20)131-84-09 ', N'м', N'\Клиенты\m31.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (36, N'Яков', N'Гусев', N'Авксентьевич', CAST(N'1995-12-10' AS Date), CAST(N'2017-11-20T00:00:00.000' AS DateTime), N'jdhedden@icloud.com', N'7(0972)781-11-37 ', N'м', N'\Клиенты\m20.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (37, N'Авигея', N'Крюкова', N'Святославовна', CAST(N'2000-08-10' AS Date), CAST(N'2018-01-03T00:00:00.000' AS DateTime), N'simone@gmail.com', N'7(499)318-88-53 ', N'ж', N'\Клиенты\19.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (38, N'Амелия', N'Степанова', N'Робертовна', CAST(N'1970-06-06' AS Date), CAST(N'2017-09-27T00:00:00.000' AS DateTime), N'rasca@hotmail.com', N'7(1217)441-28-42 ', N'ж', N'\Клиенты\15.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (39, N'Божена', N'Суворова', N'Анатольевна', CAST(N'1981-03-09' AS Date), CAST(N'2016-01-28T00:00:00.000' AS DateTime), N'attwood@aol.com', N'7(347)895-86-57 ', N'ж', N'\Клиенты\34.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (40, N'Аввакум', N'Борисов', N'Артемович', CAST(N'1974-04-25' AS Date), CAST(N'2017-03-11T00:00:00.000' AS DateTime), N'chlim@live.com', N'7(2296)930-08-88 ', N'м', N'\Клиенты\m12.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (41, N'Георгий', N'Бобылёв', N'Витальевич', CAST(N'1983-12-19' AS Date), CAST(N'2018-04-06T00:00:00.000' AS DateTime), N'csilvers@mac.com', N'7(88)685-13-51 ', N'м', N'\Клиенты\m11.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (42, N'Вольдемар', N'Дроздов', N'Артемович', CAST(N'1976-02-07' AS Date), CAST(N'2017-07-18T00:00:00.000' AS DateTime), N'smpeters@me.com', N'7(307)456-99-05 ', N'м', N'\Клиенты\m21.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (43, N'Сабрина', N'Беляева', N'Федосеевна', CAST(N'1972-07-26' AS Date), CAST(N'2017-06-14T00:00:00.000' AS DateTime), N'agapow@gmail.com', N'7(6580)534-32-58 ', N'ж', N'\Клиенты\47.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (44, N'Пантелеймон', N'Блохин', N'Феликсович', CAST(N'1978-03-06' AS Date), CAST(N'2018-02-14T00:00:00.000' AS DateTime), N'balchen@comcast.net', N'7(9524)556-48-98 ', N'м', N'\Клиенты\m8.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (45, N'Гелла', N'Шашкова', N'Эдуардовна', CAST(N'1979-02-24' AS Date), CAST(N'2016-11-16T00:00:00.000' AS DateTime), N'jadavis@mac.com', N'7(57)446-21-04 ', N'ж', N'\Клиенты\43.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (46, N'Артур', N'Калашников', N'Юрьевич', CAST(N'1972-12-13' AS Date), CAST(N'2017-08-20T00:00:00.000' AS DateTime), N'oevans@aol.com', N'7(147)947-47-21 ', N'м', N'\Клиенты\m10.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (47, N'Анэля', N'Корнилова', N'Михайловна', CAST(N'1973-04-02' AS Date), CAST(N'2016-05-22T00:00:00.000' AS DateTime), N'jonathan@aol.com', N'7(20)980-01-60 ', N'ж', N'\Клиенты\26.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (48, N'Янита', N'Гущина', N'Федоровна', CAST(N'1999-03-02' AS Date), CAST(N'2018-02-01T00:00:00.000' AS DateTime), N'lishoy@att.net', N'7(4544)716-68-96 ', N'ж', N'\Клиенты\11.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (49, N'Людвиг', N'Волков', N'Витальевич', CAST(N'1977-12-27' AS Date), CAST(N'2016-04-27T00:00:00.000' AS DateTime), N'jrkorson@msn.com', N'7(8459)592-05-58 ', N'м', N'\Клиенты\m50.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (50, N'Терентий', N'Князев', N'Валерьевич', CAST(N'1991-06-19' AS Date), CAST(N'2018-06-25T00:00:00.000' AS DateTime), N'rjones@aol.com', N'7(98)397-23-23 ', N'м', N'\Клиенты\m26.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (51, N'Гаянэ', N'Силин', N'Анатольевич', CAST(N'1976-05-27' AS Date), CAST(N'2017-05-05T00:00:00.000' AS DateTime), N'multiplx@comcast.net', N'7(4547)615-22-69 ', N'м', N'\Клиенты\m46.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (52, N'Дмитрий', N'Казаков', N'Русланович', CAST(N'1978-12-15' AS Date), CAST(N'2016-05-21T00:00:00.000' AS DateTime), N'ozawa@verizon.net', N'7(51)682-19-40 ', N'м', N'\Клиенты\m44.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (53, N'Роза', N'Гусева', N'Дмитриевна', CAST(N'1999-02-13' AS Date), CAST(N'2017-12-12T00:00:00.000' AS DateTime), N'martyloo@live.com', N'7(23)064-51-84 ', N'ж', N'\Клиенты\10.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (54, N'Марфа', N'Мамонтова', N'Мироновна', CAST(N'1984-10-19' AS Date), CAST(N'2018-02-27T00:00:00.000' AS DateTime), N'rfoley@verizon.net', N'7(38)095-64-18 ', N'ж', N'\Клиенты\29.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (55, N'Эрик', N'Галкин', N'Онисимович', CAST(N'1975-01-18' AS Date), CAST(N'2016-07-19T00:00:00.000' AS DateTime), N'snunez@verizon.net', N'7(759)873-77-39 ', N'м', N'\Клиенты\m16.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (56, N'Прасковья', N'Архипова', N'Валерьевна', CAST(N'1979-01-09' AS Date), CAST(N'2018-07-23T00:00:00.000' AS DateTime), N'cgcra@live.com', N'7(86)540-10-21 ', N'ж', N'\Клиенты\33.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (57, N'Лаура', N'Овчинникова', N'Еремеевна', CAST(N'1992-04-03' AS Date), CAST(N'2018-11-24T00:00:00.000' AS DateTime), N'carcus@yahoo.ca', N'7(85)829-33-79 ', N'ж', N'\Клиенты\35.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (58, N'Патрисия', N'Андреева', N'Валерьевна', CAST(N'1993-11-18' AS Date), CAST(N'2016-07-17T00:00:00.000' AS DateTime), N'jigsaw@aol.com', N'7(9648)953-81-26 ', N'ж', N'\Клиенты\37.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (59, N'Самуил', N'Авдеев', N'Улебович', CAST(N'1996-07-04' AS Date), CAST(N'2016-02-11T00:00:00.000' AS DateTime), N'cliffordj@mac.com', N'7(3168)043-63-31 ', N'м', N'\Клиенты\m96.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (60, N'Светлана', N'Бурова', N'Лукьевна', CAST(N'1979-01-04' AS Date), CAST(N'2016-10-13T00:00:00.000' AS DateTime), N'wsnyder@aol.com', N'7(358)173-82-21 ', N'ж', N'\Клиенты\39.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (61, N'Глеб', N'Ершов', N'Федорович', CAST(N'1970-06-14' AS Date), CAST(N'2016-09-14T00:00:00.000' AS DateTime), N'sjava@aol.com', N'7(2608)298-40-82 ', N'м', N'\Клиенты\m23.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (62, N'Захар', N'Игнатов', N'Павлович', CAST(N'1998-10-07' AS Date), CAST(N'2017-11-10T00:00:00.000' AS DateTime), N'dieman@icloud.com', N'7(578)574-73-36 ', N'м', N'\Клиенты\m98.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (63, N'Амалия', N'Комиссарова', N'Робертовна', CAST(N'1971-08-18' AS Date), CAST(N'2017-08-04T00:00:00.000' AS DateTime), N'jorgb@msn.com', N'7(22)647-46-32 ', N'ж', N'\Клиенты\17.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (64, N'Трофим', N'Быков', N'Константинович', CAST(N'1994-12-20' AS Date), CAST(N'2016-04-17T00:00:00.000' AS DateTime), N'jguyer@aol.com', N'7(3414)460-12-05 ', N'м', N'\Клиенты\m14.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (65, N'Леонтий', N'Кузьмин', N'Валерьянович', CAST(N'2000-05-05' AS Date), CAST(N'2017-10-12T00:00:00.000' AS DateTime), N'msloan@hotmail.com', N'7(1340)148-90-68 ', N'м', N'\Клиенты\m17.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (66, N'Диана', N'Белозёрова', N'Антоновна', CAST(N'1989-02-27' AS Date), CAST(N'2017-01-30T00:00:00.000' AS DateTime), N'dialworld@aol.com', N'7(9900)174-59-87 ', N'ж', N'\Клиенты\7.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (67, N'Евгений', N'Блинов', N'Мэлсович', CAST(N'1994-01-05' AS Date), CAST(N'2017-05-07T00:00:00.000' AS DateTime), N'moxfulder@outlook.com', N'7(0852)321-82-64 ', N'м', N'\Клиенты\m7.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (68, N'Алексей', N'Лазарев', N'Богданович', CAST(N'1977-03-10' AS Date), CAST(N'2017-01-02T00:00:00.000' AS DateTime), N'claesjac@me.com', N'7(0055)737-37-48 ', N'м', N'\Клиенты\m48.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (69, N'Розалия', N'Афанасьева', N'Макаровна', CAST(N'1977-05-01' AS Date), CAST(N'2017-09-06T00:00:00.000' AS DateTime), N'malattia@hotmail.com', N'7(0661)413-23-32 ', N'ж', N'\Клиенты\31.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (70, N'Эдита', N'Дементьева', N'Онисимовна', CAST(N'1975-09-17' AS Date), CAST(N'2018-11-24T00:00:00.000' AS DateTime), N'frosal@hotmail.com', N'7(198)922-28-76 ', N'ж', N'\Клиенты\38.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (71, N'Петр', N'Калинин', N'Иванович', CAST(N'1993-09-08' AS Date), CAST(N'2016-05-26T00:00:00.000' AS DateTime), N'aschmitz@hotmail.com', N'7(90)316-07-17 ', N'м', N'\Клиенты\m47.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (72, N'Станислав', N'Андреев', N'Максович', CAST(N'1975-10-10' AS Date), CAST(N'2017-12-26T00:00:00.000' AS DateTime), N'budinger@mac.com', N'7(02)993-91-28 ', N'м', N'\Клиенты\m3.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (73, N'Устин', N'Киселёв', N'Яковлевич', CAST(N'1985-01-08' AS Date), CAST(N'2018-06-21T00:00:00.000' AS DateTime), N'dalamb@verizon.net', N'7(83)334-52-76 ', N'м', N'\Клиенты\m25.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (74, N'Павел', N'Гордеев', N'Семенович', CAST(N'1984-09-06' AS Date), CAST(N'2016-07-19T00:00:00.000' AS DateTime), N'dawnsong@verizon.net', N'7(5243)599-66-72 ', N'м', N'\Клиенты\m19.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (75, N'Никки', N'Горбачёва', N'Еремеевна', CAST(N'1987-04-21' AS Date), CAST(N'2018-08-16T00:00:00.000' AS DateTime), N'chinthaka@att.net', N'7(94)789-69-20 ', N'ж', N'\Клиенты\8.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (76, N'Касьян', N'Копылов', N'Робертович', CAST(N'1983-08-04' AS Date), CAST(N'2018-03-18T00:00:00.000' AS DateTime), N'crobles@sbcglobal.net', N'7(5774)679-82-06 ', N'м', N'\Клиенты\m29.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (77, N'Витольд', N'Ефремов', N'Авксентьевич', CAST(N'1975-12-02' AS Date), CAST(N'2018-04-09T00:00:00.000' AS DateTime), N'kwilliams@yahoo.ca', N'7(93)922-14-03 ', N'м', N'\Клиенты\m28.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (78, N'Михаил', N'Баранов', N'Романович', CAST(N'1997-07-12' AS Date), CAST(N'2018-10-07T00:00:00.000' AS DateTime), N'bigmauler@outlook.com', N'7(750)985-94-13 ', N'м', N'\Клиенты\m5.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (79, N'Элина', N'Дмитриева', N'Даниловна', CAST(N'1988-12-10' AS Date), CAST(N'2017-02-11T00:00:00.000' AS DateTime), N'vmalik@live.com', N'7(787)140-48-84 ', N'ж', N'\Клиенты\12.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (80, N'Осип', N'Федотов', N'Анатольевич', CAST(N'1971-04-13' AS Date), CAST(N'2018-07-23T00:00:00.000' AS DateTime), N'breegster@hotmail.com', N'7(590)702-33-06 ', N'м', N'\Клиенты\m9.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (81, N'Тала', N'Быкова', N'Георгьевна', CAST(N'2000-02-22' AS Date), CAST(N'2016-08-13T00:00:00.000' AS DateTime), N'ganter@optonline.net', N'7(13)915-53-53 ', N'ж', N'\Клиенты\6.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (82, N'Вадим', N'Дементьев', N'Ростиславович', CAST(N'1993-07-10' AS Date), CAST(N'2018-03-05T00:00:00.000' AS DateTime), N'jacks@aol.com', N'7(79)330-46-15 ', N'м', N'\Клиенты\m39.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (83, N'Макар', N'Евсеев', N'Васильевич', CAST(N'1977-09-13' AS Date), CAST(N'2018-12-05T00:00:00.000' AS DateTime), N'parsimony@sbcglobal.net', N'7(2141)077-85-70 ', N'м', N'\Клиенты\m22.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (84, N'Станислав', N'Абрамов', N'Филатович', CAST(N'1989-05-18' AS Date), CAST(N'2016-12-08T00:00:00.000' AS DateTime), N'solomon@att.net', N'7(6545)478-87-79 ', N'м', N'\Клиенты\m32.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (85, N'Лиза', N'Артемьева', N'Максимовна', CAST(N'1996-05-17' AS Date), CAST(N'2018-10-07T00:00:00.000' AS DateTime), N'snunez@yahoo.ca', N'7(696)972-70-21 ', N'ж', N'\Клиенты\3.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (86, N'Дэнна', N'Кузьмина', N'Витальевна', CAST(N'1993-08-24' AS Date), CAST(N'2016-03-27T00:00:00.000' AS DateTime), N'nichoj@mac.com', N'7(9940)977-45-73 ', N'ж', N'\Клиенты\20.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (87, N'Магда', N'Ефимова', N'Платоновна', CAST(N'1995-08-16' AS Date), CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'rbarreira@me.com', N'7(9261)386-15-92 ', N'ж', N'\Клиенты\16.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (88, N'Альберт', N'Ефимов', N'Проклович', CAST(N'1997-10-29' AS Date), CAST(N'2018-06-21T00:00:00.000' AS DateTime), N'houle@live.com', N'7(416)375-97-19 ', N'м', N'\Клиенты\m6.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (89, N'Эльвина', N'Лазарева', N'Робертовна', CAST(N'1996-02-16' AS Date), CAST(N'2018-04-11T00:00:00.000' AS DateTime), N'ahuillet@comcast.net', N'7(5564)609-81-37 ', N'ж', N'\Клиенты\28.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (90, N'Изабелла', N'Воронова', N'Вячеславовна', CAST(N'1999-09-24' AS Date), CAST(N'2017-12-21T00:00:00.000' AS DateTime), N'kildjean@sbcglobal.net', N'7(17)433-44-98 ', N'ж', N'\Клиенты\21.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (91, N'Эвелина', N'Куликова', N'Вячеславовна', CAST(N'1997-11-14' AS Date), CAST(N'2018-02-01T00:00:00.000' AS DateTime), N'ilikered@hotmail.com', N'7(0236)682-42-78 ', N'ж', N'\Клиенты\23.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (92, N'Амалия', N'Егорова', N'Дамировна', CAST(N'1999-09-28' AS Date), CAST(N'2016-06-30T00:00:00.000' AS DateTime), N'drezet@yahoo.com', N'7(7486)408-12-26 ', N'ж', N'\Клиенты\13.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (93, N'Станислав', N'Александров', N'Эдуардович', CAST(N'1981-07-04' AS Date), CAST(N'2018-11-08T00:00:00.000' AS DateTime), N'bigmauler@aol.com', N'7(18)164-05-12 ', N'м', N'\Клиенты\m2.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (94, N'Демьян', N'Цветков', N'Львович', CAST(N'1996-03-29' AS Date), CAST(N'2016-02-12T00:00:00.000' AS DateTime), N'hauma@icloud.com', N'7(93)546-43-73 ', N'м', N'\Клиенты\m4.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (95, N'Юнона', N'Устинова', N'Валентиновна', CAST(N'1982-08-08' AS Date), CAST(N'2017-05-28T00:00:00.000' AS DateTime), N'kempsonc@live.com', N'7(33)367-13-07', N'ж', N'\Клиенты\44.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (96, N'Любава', N'Костина', N'Авксентьевна', CAST(N'1972-07-13' AS Date), CAST(N'2016-02-26T00:00:00.000' AS DateTime), N'gordonjcp@hotmail.com', N'7(6419)959-21-87 ', N'ж', N'\Клиенты\41.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (97, N'Мартын', N'Смирнов', N'Арсеньевич', CAST(N'1996-06-25' AS Date), CAST(N'2017-02-07T00:00:00.000' AS DateTime), N'haddawy@live.com', N'7(6251)589-02-43 ', N'м', N'\Клиенты\m34.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (98, N'Сандра', N'Федотова', N'Владленовна', CAST(N'1985-03-29' AS Date), CAST(N'2016-11-08T00:00:00.000' AS DateTime), N'penna@verizon.net', N'7(126)195-25-86 ', N'ж', N'\Клиенты\24.jpg')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (100, N'Вадим', N'Большаков', N'Данилович', CAST(N'1970-05-15' AS Date), CAST(N'2018-08-04T00:00:00.000' AS DateTime), N'uncle@gmail.com', N'7(386)641-13-37 ', N'м', N'\Клиенты\m97.jpg')
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientService] ON 

INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (1, 87, 48, CAST(N'2019-12-22T15:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (2, 41, 46, CAST(N'2019-06-07T17:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (3, 14, 42, CAST(N'2019-03-04T17:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (4, 5, 3, CAST(N'2019-12-01T14:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (5, 46, 24, CAST(N'2019-06-26T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (7, 39, 4, CAST(N'2019-11-16T11:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (8, 71, 16, CAST(N'2019-01-01T14:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (9, 46, 25, CAST(N'2019-02-01T18:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (10, 4, 28, CAST(N'2019-06-23T08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (11, 32, 6, CAST(N'2019-08-18T16:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (12, 26, 37, CAST(N'2019-11-27T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (13, 30, 47, CAST(N'2019-09-06T19:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (14, 46, 25, CAST(N'2019-12-31T08:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (15, 27, 35, CAST(N'2019-12-28T16:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (16, 98, 17, CAST(N'2019-01-29T16:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (17, 22, 10, CAST(N'2019-11-12T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (18, 46, 36, CAST(N'2019-01-10T08:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (19, 92, 24, CAST(N'2019-09-29T13:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (20, 93, 46, CAST(N'2019-03-23T19:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (21, 98, 48, CAST(N'2019-04-29T15:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (22, 96, 15, CAST(N'2019-09-04T08:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (23, 52, 44, CAST(N'2019-01-23T18:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (24, 22, 49, CAST(N'2019-01-16T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (25, 83, 45, CAST(N'2019-07-15T14:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (26, 41, 40, CAST(N'2019-04-04T09:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (27, 90, 22, CAST(N'2019-04-30T18:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (28, 7, 15, CAST(N'2019-05-25T17:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (30, 61, 24, CAST(N'2019-01-09T10:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (31, 27, 27, CAST(N'2019-04-09T11:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (32, 38, 22, CAST(N'2019-05-22T16:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (33, 15, 37, CAST(N'2019-09-28T10:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (34, 61, 30, CAST(N'2019-01-05T16:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (35, 77, 7, CAST(N'2019-05-08T14:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (36, 98, 6, CAST(N'2019-11-09T13:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (37, 63, 48, CAST(N'2019-01-16T14:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (38, 5, 26, CAST(N'2019-01-11T18:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (39, 63, 42, CAST(N'2019-08-29T19:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (40, 87, 28, CAST(N'2019-12-31T19:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (41, 90, 24, CAST(N'2019-05-17T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (42, 73, 47, CAST(N'2019-10-02T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (43, 47, 6, CAST(N'2019-11-27T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (44, 47, 45, CAST(N'2019-07-10T15:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (45, 67, 30, CAST(N'2019-04-16T13:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (46, 72, 25, CAST(N'2019-11-19T15:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (47, 84, 34, CAST(N'2019-06-13T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (48, 73, 17, CAST(N'2019-12-31T18:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (49, 22, 25, CAST(N'2019-12-19T19:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (50, 96, 26, CAST(N'2019-03-16T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (51, 26, 17, CAST(N'2019-11-23T18:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (52, 28, 16, CAST(N'2019-12-14T08:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (53, 31, 19, CAST(N'2019-07-04T17:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (54, 91, 30, CAST(N'2019-02-13T18:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (55, 71, 7, CAST(N'2019-08-29T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (56, 100, 45, CAST(N'2019-01-11T12:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (57, 48, 20, CAST(N'2019-03-01T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (58, 91, 33, CAST(N'2019-02-12T19:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (59, 27, 49, CAST(N'2019-12-26T16:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (60, 48, 37, CAST(N'2019-12-22T09:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (61, 83, 15, CAST(N'2019-11-09T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (63, 44, 45, CAST(N'2019-01-22T16:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (64, 86, 4, CAST(N'2019-07-31T18:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (65, 68, 44, CAST(N'2019-08-15T18:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (66, 5, 8, CAST(N'2019-02-11T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (67, 22, 47, CAST(N'2019-01-05T08:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (68, 91, 18, CAST(N'2019-06-06T19:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (69, 79, 47, CAST(N'2019-01-06T15:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (70, 49, 40, CAST(N'2019-03-20T10:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (71, 98, 40, CAST(N'2019-08-06T16:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (72, 68, 3, CAST(N'2019-10-17T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (73, 62, 26, CAST(N'2019-04-07T10:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (74, 14, 11, CAST(N'2019-06-28T14:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (75, 38, 3, CAST(N'2019-01-03T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (76, 87, 32, CAST(N'2019-01-22T10:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (77, 58, 26, CAST(N'2019-01-31T12:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (78, 98, 47, CAST(N'2019-07-17T08:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (79, 47, 4, CAST(N'2019-04-29T12:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (80, 100, 43, CAST(N'2019-02-18T18:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (81, 52, 48, CAST(N'2019-03-15T10:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (82, 3, 27, CAST(N'2019-09-10T18:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (83, 73, 26, CAST(N'2019-08-06T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (84, 32, 30, CAST(N'2019-08-20T19:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (86, 61, 24, CAST(N'2019-03-03T17:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (87, 87, 42, CAST(N'2019-10-21T10:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (88, 4, 6, CAST(N'2019-10-12T08:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (89, 39, 43, CAST(N'2019-11-11T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (90, 20, 47, CAST(N'2019-01-03T14:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (91, 44, 9, CAST(N'2019-07-06T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (92, 15, 23, CAST(N'2019-03-25T18:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (93, 43, 34, CAST(N'2019-10-27T16:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (94, 73, 7, CAST(N'2019-05-15T09:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (95, 72, 45, CAST(N'2019-08-30T11:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (96, 41, 38, CAST(N'2019-02-16T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (97, 90, 41, CAST(N'2019-09-24T13:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (98, 5, 23, CAST(N'2019-06-09T13:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (99, 91, 4, CAST(N'2019-04-13T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (100, 3, 30, CAST(N'2019-04-05T13:20:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ClientService] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (1, N'Коррекция нарощенных ресниц', 1310.0000, 2700, N'', 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (2, N'Подготовка к экзамену ACT', 67.0000, 3000, N'', 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (3, N'Киноклуб итальянского языка для студентов', 1760.0000, 1800, N'', 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (4, N'Урок в группе французского языка для школьников', 1970.0000, 6000, N'', 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (5, N'Ультразвуковой пилинг', 1440.0000, 2700, N'', 20, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (6, N'Киноклуб немецкого языка для детей', 1670.0000, 7200, N'', 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (7, N'Урок в группе испанского языка для взрослых', 1730.0000, 1800, N'', 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (8, N'Интенсивный онлайн-курс португальского языка для компаний по Skype', 1610.0000, 4200, N'', 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (9, N'Киноклуб английского языка для студентов', 980.0000, 4800, N'', 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (10, N'Интенсивный курс с преподавателем-носителем немецкого языка для компаний', 1180.0000, 7200, N'', 0.2, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (11, N'Подготовка к экзамену IELTS Speaking Club', 1430.0000, 5400, N'', 0.2, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (12, N'Ремонт подвески (ходовой)', 680.0000, 10800, N'', 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (13, N'Химический пилинг', 1880.0000, 1500, N'', 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (14, N'Киноклуб немецкого языка для студентов', 1140.0000, 3000, N'', 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (15, N'Интенсивный курс с преподавателем-носителем английского языка для компаний', 1670.0000, 6600, N'', 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (16, N'Киноклуб итальянского языка для детей', 1480.0000, 4200, N'', 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (17, N'Урок в группе японского языка для школьников', 1300.0000, 4800, N'', 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (18, N'Интенсивный курс итальянского языка с русскоязычным преподавателем для компаний', 900.0000, 6600, N'', 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (19, N'Индивидуальный урок французского языка с преподавателем-носителем языка', 1410.0000, 2400, N'', 0.2, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (20, N'Интенсивный курс с преподавателем-носителем португальского языка для компаний', 1580.0000, 1800, N'', 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (21, N'Снятие и установка колес', 3130.0000, 23400, N'', 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (22, N'Урок в группе английского языка для школьников', 900.0000, 6600, N'', 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (23, N'Занятие с русскоязычным репетитором японского языка', 1260.0000, 2400, N'', 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (24, N'Индивидуальный урок немецкого языка с русскоязычным преподавателем', 990.0000, 1800, N'', 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (25, N'Интенсивный онлайн-курс немецкого языка для компаний по Skype', 1840.0000, 4200, N'', 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (26, N'Индивидуальный онлайн-урок немецкого языка по Skype', 970.0000, 5400, N'', 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (27, N'Урок в группе китайского языка для взрослых', 1730.0000, 4200, N'', 0.25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (28, N'Киноклуб французского языка для взрослых', 1770.0000, 5400, N'', 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (29, N'Ремонт автоэлектрики', 4230.0000, 27000, N'', 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (30, N'Урок в группе китайского языка для школьников', 1180.0000, 3000, N'', 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (31, N'Удаление катализатора', 1930.0000, 30600, N'', 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (32, N'Киноклуб китайского языка для студентов', 1990.0000, 6000, N'', 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (33, N'Урок в группе китайского языка для студентов', 2000.0000, 2400, N'', 0.2, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (34, N'Индивидуальный урок итальянского языка с русскоязычным преподавателем', 1330.0000, 1800, N'', 0.2, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (35, N'Киноклуб китайского языка для детей', 1120.0000, 6000, N'', 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (36, N'Подготовка к экзамену TOEFL', 1070.0000, 6000, N'', 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (37, N'Урок в группе итальянского языка для взрослых', 1290.0000, 2400, N'', 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (38, N'Индивидуальный урок английского языка с преподавателем-носителем языка', 1300.0000, 7200, N'', 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (39, N'Миндальный пилинг', 2430.0000, 2700, N'', 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (40, N'Занятие с репетитором-носителем французского языка', 2040.0000, 3000, N'', 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (41, N'Занятие с русскоязычным репетитором английского языка', 1950.0000, 5400, N'', 15000000, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (42, N'Индивидуальный урок испанского языка с преподавателем-носителем языка', 1200.0000, 5400, N'', 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (43, N'Интенсивный онлайн-курс китайского языка для компаний по Skype', 1760.0000, 7200, N'', 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (44, N'Занятие с репетитором-носителем немецкого языка', 1120.0000, 7200, N'', 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (45, N'Киноклуб португальского языка для детей', 1710.0000, 5400, N'', 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (46, N'Киноклуб португальского языка для студентов', 1170.0000, 1800, N'', 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (47, N'Киноклуб немецкого языка для взрослых', 1560.0000, 6000, N'', 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (48, N'Урок в группе немецкого языка для школьников', 1570.0000, 1800, N'', 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (49, N'Урок в группе английского языка для взрослых', 1010.0000, 3000, N'', 0.25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (50, N'Ремонт кронштейна глушителя', 1410.0000, 34200, N'', 0, NULL)
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[Tag] ON 

INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (1, N'Тэг1', N'Black ')
INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (2, N'Тэг2', N'Purple')
INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (3, N'Тэг3', N'Green ')
INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (4, N'Тэг4', N'Orange')
INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (5, N'Тэг5', N'Red   ')
SET IDENTITY_INSERT [dbo].[Tag] OFF
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product] FOREIGN KEY([MainProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product1] FOREIGN KEY([AttachedProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product1]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Client]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Service]
GO
ALTER TABLE [dbo].[DocumentByService]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[DocumentByService] CHECK CONSTRAINT [FK_DocumentByService_ClientService]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_Service]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Client]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
USE [master]
GO
ALTER DATABASE [20.102k-14-School] SET  READ_WRITE 
GO
