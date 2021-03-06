USE [master]
GO
/****** Object:  Database [BeSpokedBikesDB]    Script Date: 1/23/2022 8:45:08 PM ******/
CREATE DATABASE [BeSpokedBikesDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BeSpokedBikesDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BeSpokedBikesDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BeSpokedBikesDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BeSpokedBikesDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BeSpokedBikesDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BeSpokedBikesDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BeSpokedBikesDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BeSpokedBikesDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BeSpokedBikesDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BeSpokedBikesDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BeSpokedBikesDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [BeSpokedBikesDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BeSpokedBikesDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BeSpokedBikesDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BeSpokedBikesDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BeSpokedBikesDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BeSpokedBikesDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BeSpokedBikesDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BeSpokedBikesDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BeSpokedBikesDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BeSpokedBikesDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BeSpokedBikesDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BeSpokedBikesDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BeSpokedBikesDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BeSpokedBikesDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BeSpokedBikesDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BeSpokedBikesDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BeSpokedBikesDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BeSpokedBikesDB] SET RECOVERY FULL 
GO
ALTER DATABASE [BeSpokedBikesDB] SET  MULTI_USER 
GO
ALTER DATABASE [BeSpokedBikesDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BeSpokedBikesDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BeSpokedBikesDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BeSpokedBikesDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BeSpokedBikesDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BeSpokedBikesDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BeSpokedBikesDB', N'ON'
GO
ALTER DATABASE [BeSpokedBikesDB] SET QUERY_STORE = OFF
GO
USE [BeSpokedBikesDB]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 1/23/2022 8:45:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](1000) NULL,
	[PhoneNumber] [nvarchar](15) NULL,
	[StartDate] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastUpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Discount]    Script Date: 1/23/2022 8:45:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[DiscountId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NULL,
	[BeginDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[DiscountPercentage] [float] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastUpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[DiscountId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/23/2022 8:45:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](200) NOT NULL,
	[Manufacturer] [nvarchar](200) NOT NULL,
	[Style] [nvarchar](200) NULL,
	[PurchasePrice] [float] NULL,
	[SalePrice] [float] NULL,
	[QtyOnHand] [int] NULL,
	[CommissionPercentage] [float] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastUpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 1/23/2022 8:45:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale](
	[SaleId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[SalespersonId] [int] NOT NULL,
	[CustomerId] [int] NULL,
	[SalesDate] [datetime] NOT NULL,
	[Price] [float] NOT NULL,
	[SalesCommission] [float] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastUpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SaleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesPerson]    Script Date: 1/23/2022 8:45:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesPerson](
	[SalesPersonId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [nvarchar](15) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[TerminationDate] [datetime] NULL,
	[ManagerName] [nvarchar](1000) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[LastUpdatedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SalesPersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [Address], [PhoneNumber], [StartDate], [CreatedDate], [LastUpdatedDate]) VALUES (1, N'John', N'Miller', N'123, River St, Austin, TX-12345', N'123-456-7890', CAST(N'2022-01-10T00:00:00.000' AS DateTime), CAST(N'2022-01-10T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [Address], [PhoneNumber], [StartDate], [CreatedDate], [LastUpdatedDate]) VALUES (2, N'Dhoni', N'Singh', N'456, River St, Atlanta, GA-12345', N'123-456-7890', CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-01-10T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [Address], [PhoneNumber], [StartDate], [CreatedDate], [LastUpdatedDate]) VALUES (3, N'Rahman', N'AR', N'123, River St, Houston, TX-12345', N'123-456-7890', CAST(N'2019-01-06T00:00:00.000' AS DateTime), CAST(N'2019-01-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [Address], [PhoneNumber], [StartDate], [CreatedDate], [LastUpdatedDate]) VALUES (4, N'Jack', N'Miller', N'789, River St, Alpharetta, GA-12345', N'123-456-7890', CAST(N'2020-02-10T00:00:00.000' AS DateTime), CAST(N'2020-02-10T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [Address], [PhoneNumber], [StartDate], [CreatedDate], [LastUpdatedDate]) VALUES (5, N'Sachin', N'Tendulkar', N'123, River St, NewJersey, NJ-12345', N'123-456-7890', CAST(N'2021-03-15T00:00:00.000' AS DateTime), CAST(N'2021-03-15T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [Address], [PhoneNumber], [StartDate], [CreatedDate], [LastUpdatedDate]) VALUES (6, N'Elango', N'Mani', N'123, River St, Atlanta, GA-12345', N'123-456-7890', CAST(N'2019-04-10T00:00:00.000' AS DateTime), CAST(N'2019-04-10T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [Address], [PhoneNumber], [StartDate], [CreatedDate], [LastUpdatedDate]) VALUES (7, N'Kannan', N'M', N'789, River St, Houston, TX-12345', N'123-456-7890', CAST(N'2021-02-21T00:00:00.000' AS DateTime), CAST(N'2021-02-21T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [Address], [PhoneNumber], [StartDate], [CreatedDate], [LastUpdatedDate]) VALUES (8, N'John', N'Sam', N'123, River St, Houston, TX-12345', N'123-456-7890', CAST(N'2021-02-15T00:00:00.000' AS DateTime), CAST(N'2021-02-15T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [LastName], [Address], [PhoneNumber], [StartDate], [CreatedDate], [LastUpdatedDate]) VALUES (9, N'Krish', N'Raj', N'789, River St, Houston, TX-12345', N'123-456-7890', CAST(N'2019-01-10T00:00:00.000' AS DateTime), CAST(N'2019-01-10T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Discount] ON 

INSERT [dbo].[Discount] ([DiscountId], [ProductId], [BeginDate], [EndDate], [DiscountPercentage], [CreatedDate], [LastUpdatedDate]) VALUES (1, 1, CAST(N'2020-01-30T00:00:00.000' AS DateTime), CAST(N'2020-03-31T00:00:00.000' AS DateTime), 10, CAST(N'2020-01-30T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Discount] ([DiscountId], [ProductId], [BeginDate], [EndDate], [DiscountPercentage], [CreatedDate], [LastUpdatedDate]) VALUES (2, 1, CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2022-03-01T00:00:00.000' AS DateTime), 5, CAST(N'2022-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Discount] ([DiscountId], [ProductId], [BeginDate], [EndDate], [DiscountPercentage], [CreatedDate], [LastUpdatedDate]) VALUES (3, 2, CAST(N'2020-06-30T00:00:00.000' AS DateTime), CAST(N'2020-07-31T00:00:00.000' AS DateTime), 10, CAST(N'2020-01-30T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Discount] ([DiscountId], [ProductId], [BeginDate], [EndDate], [DiscountPercentage], [CreatedDate], [LastUpdatedDate]) VALUES (4, 2, CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2022-03-01T00:00:00.000' AS DateTime), 12, CAST(N'2022-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Discount] ([DiscountId], [ProductId], [BeginDate], [EndDate], [DiscountPercentage], [CreatedDate], [LastUpdatedDate]) VALUES (5, 3, CAST(N'2020-01-30T00:00:00.000' AS DateTime), CAST(N'2020-03-31T00:00:00.000' AS DateTime), 10, CAST(N'2020-01-30T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Discount] ([DiscountId], [ProductId], [BeginDate], [EndDate], [DiscountPercentage], [CreatedDate], [LastUpdatedDate]) VALUES (6, 3, CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2022-03-01T00:00:00.000' AS DateTime), 15, CAST(N'2022-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Discount] ([DiscountId], [ProductId], [BeginDate], [EndDate], [DiscountPercentage], [CreatedDate], [LastUpdatedDate]) VALUES (7, 4, CAST(N'2020-01-30T00:00:00.000' AS DateTime), CAST(N'2020-03-31T00:00:00.000' AS DateTime), 10, CAST(N'2020-01-30T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Discount] ([DiscountId], [ProductId], [BeginDate], [EndDate], [DiscountPercentage], [CreatedDate], [LastUpdatedDate]) VALUES (8, 4, CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2022-03-01T00:00:00.000' AS DateTime), 12, CAST(N'2022-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Discount] ([DiscountId], [ProductId], [BeginDate], [EndDate], [DiscountPercentage], [CreatedDate], [LastUpdatedDate]) VALUES (9, 5, CAST(N'2020-01-30T00:00:00.000' AS DateTime), CAST(N'2020-03-31T00:00:00.000' AS DateTime), 10, CAST(N'2020-01-30T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Discount] ([DiscountId], [ProductId], [BeginDate], [EndDate], [DiscountPercentage], [CreatedDate], [LastUpdatedDate]) VALUES (10, 5, CAST(N'2022-01-01T00:00:00.000' AS DateTime), CAST(N'2022-03-01T00:00:00.000' AS DateTime), 12, CAST(N'2022-01-01T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Discount] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [ProductName], [Manufacturer], [Style], [PurchasePrice], [SalePrice], [QtyOnHand], [CommissionPercentage], [CreatedDate], [LastUpdatedDate]) VALUES (1, N'Zeus', N'American Eagle ', N'Standard', 1200, 2200, 10, 8, CAST(N'2020-01-30T00:00:00.000' AS DateTime), CAST(N'2022-01-23T19:11:50.157' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Manufacturer], [Style], [PurchasePrice], [SalePrice], [QtyOnHand], [CommissionPercentage], [CreatedDate], [LastUpdatedDate]) VALUES (2, N'Raven', N'American Star Bicycle', N'Sport', 1000, 1800, 18, 5, CAST(N'2022-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Manufacturer], [Style], [PurchasePrice], [SalePrice], [QtyOnHand], [CommissionPercentage], [CreatedDate], [LastUpdatedDate]) VALUES (3, N'Pegasus', N'ALAN ', N'Cruiser', 800, 1600, 47, 6, CAST(N'2020-01-30T00:00:00.000' AS DateTime), CAST(N'2022-01-23T19:12:01.693' AS DateTime))
INSERT [dbo].[Product] ([ProductId], [ProductName], [Manufacturer], [Style], [PurchasePrice], [SalePrice], [QtyOnHand], [CommissionPercentage], [CreatedDate], [LastUpdatedDate]) VALUES (4, N'Bumblebee', N'Avanti ', N'Standard', 1200, 1900, 19, 5.5, CAST(N'2022-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Manufacturer], [Style], [PurchasePrice], [SalePrice], [QtyOnHand], [CommissionPercentage], [CreatedDate], [LastUpdatedDate]) VALUES (5, N'Bonnie', N'American Eagle ', N'Sport', 1000, 2400, 30, 3, CAST(N'2020-01-30T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Manufacturer], [Style], [PurchasePrice], [SalePrice], [QtyOnHand], [CommissionPercentage], [CreatedDate], [LastUpdatedDate]) VALUES (6, N'Ebony', N'Avanti ', N'Cruiser', 1100, 2500, 50, 4, CAST(N'2022-01-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Manufacturer], [Style], [PurchasePrice], [SalePrice], [QtyOnHand], [CommissionPercentage], [CreatedDate], [LastUpdatedDate]) VALUES (7, N'Stiletto', N'American Eagle ', N'Standard', 1100, 2000, 30, 4, CAST(N'2020-04-30T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Manufacturer], [Style], [PurchasePrice], [SalePrice], [QtyOnHand], [CommissionPercentage], [CreatedDate], [LastUpdatedDate]) VALUES (8, N'Bumblebee', N'American Eagle ', N'Sport', 1200, 2200, 25, 5, CAST(N'2022-03-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Product] ([ProductId], [ProductName], [Manufacturer], [Style], [PurchasePrice], [SalePrice], [QtyOnHand], [CommissionPercentage], [CreatedDate], [LastUpdatedDate]) VALUES (9, N'SilverBullet', N'ALAN ', N'Cruiser', 1700, 3200, 35, 10, CAST(N'2020-01-30T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Sale] ON 

INSERT [dbo].[Sale] ([SaleId], [ProductId], [SalespersonId], [CustomerId], [SalesDate], [Price], [SalesCommission], [CreatedDate], [LastUpdatedDate]) VALUES (1, 4, 2, 1, CAST(N'2022-02-01T00:00:00.000' AS DateTime), 1900, 5.5, CAST(N'2022-01-23T17:58:19.260' AS DateTime), NULL)
INSERT [dbo].[Sale] ([SaleId], [ProductId], [SalespersonId], [CustomerId], [SalesDate], [Price], [SalesCommission], [CreatedDate], [LastUpdatedDate]) VALUES (2, 3, 5, 3, CAST(N'2022-01-26T00:00:00.000' AS DateTime), 1600, 6, CAST(N'2022-01-23T18:33:24.657' AS DateTime), NULL)
INSERT [dbo].[Sale] ([SaleId], [ProductId], [SalespersonId], [CustomerId], [SalesDate], [Price], [SalesCommission], [CreatedDate], [LastUpdatedDate]) VALUES (3, 3, 4, 7, CAST(N'2022-01-27T00:00:00.000' AS DateTime), 1600, 6, CAST(N'2022-01-23T18:41:33.070' AS DateTime), NULL)
INSERT [dbo].[Sale] ([SaleId], [ProductId], [SalespersonId], [CustomerId], [SalesDate], [Price], [SalesCommission], [CreatedDate], [LastUpdatedDate]) VALUES (4, 2, 4, 7, CAST(N'2022-02-02T00:00:00.000' AS DateTime), 1800, 5, CAST(N'2022-01-23T18:45:17.450' AS DateTime), NULL)
INSERT [dbo].[Sale] ([SaleId], [ProductId], [SalespersonId], [CustomerId], [SalesDate], [Price], [SalesCommission], [CreatedDate], [LastUpdatedDate]) VALUES (5, 2, 4, 7, CAST(N'2022-02-04T00:00:00.000' AS DateTime), 1800, 5, CAST(N'2022-01-23T19:31:11.333' AS DateTime), NULL)
INSERT [dbo].[Sale] ([SaleId], [ProductId], [SalespersonId], [CustomerId], [SalesDate], [Price], [SalesCommission], [CreatedDate], [LastUpdatedDate]) VALUES (6, 3, 5, 8, CAST(N'2022-02-02T00:00:00.000' AS DateTime), 1600, 6, CAST(N'2022-01-23T20:01:29.310' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Sale] OFF
GO
SET IDENTITY_INSERT [dbo].[SalesPerson] ON 

INSERT [dbo].[SalesPerson] ([SalesPersonId], [FirstName], [LastName], [Address], [Phone], [StartDate], [TerminationDate], [ManagerName], [CreatedDate], [LastUpdatedDate]) VALUES (2, N'Yaazhini', N'Elango', N'123, River St, Austin, TX-12345', N'770-298-5798', CAST(N'2021-01-10T00:00:00.000' AS DateTime), CAST(N'2022-01-01T00:00:00.000' AS DateTime), N'Ram', CAST(N'2022-01-10T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[SalesPerson] ([SalesPersonId], [FirstName], [LastName], [Address], [Phone], [StartDate], [TerminationDate], [ManagerName], [CreatedDate], [LastUpdatedDate]) VALUES (3, N'Kannanm', N'Mani', N'456, River St, Atlanta, GA-12345', N'123-456-7890', CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2020-02-10T00:00:00.000' AS DateTime), N'Paul', CAST(N'2020-01-10T00:00:00.000' AS DateTime), CAST(N'2022-01-23T19:00:03.577' AS DateTime))
INSERT [dbo].[SalesPerson] ([SalesPersonId], [FirstName], [LastName], [Address], [Phone], [StartDate], [TerminationDate], [ManagerName], [CreatedDate], [LastUpdatedDate]) VALUES (4, N'Thanmaya', N'Kannan', N'123, River St, Houston, TX-12345', N'123-456-7890', CAST(N'2019-01-06T00:00:00.000' AS DateTime), NULL, N'Paul', CAST(N'2019-01-06T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[SalesPerson] ([SalesPersonId], [FirstName], [LastName], [Address], [Phone], [StartDate], [TerminationDate], [ManagerName], [CreatedDate], [LastUpdatedDate]) VALUES (5, N'Rajeswari', N'Elango', N'789, River St, Alpharetta, GA-12345', N'123-456-7890', CAST(N'2020-02-10T00:00:00.000' AS DateTime), NULL, N'John', CAST(N'2020-02-10T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[SalesPerson] ([SalesPersonId], [FirstName], [LastName], [Address], [Phone], [StartDate], [TerminationDate], [ManagerName], [CreatedDate], [LastUpdatedDate]) VALUES (6, N'Subramanya', N'Siva', N'123, River St, NewJersey, NJ-12345', N'123-456-7890', CAST(N'2021-03-15T00:00:00.000' AS DateTime), NULL, N'Paul', CAST(N'2021-03-15T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[SalesPerson] ([SalesPersonId], [FirstName], [LastName], [Address], [Phone], [StartDate], [TerminationDate], [ManagerName], [CreatedDate], [LastUpdatedDate]) VALUES (7, N'Lisbon', N'Teresa', N'123, River St, Atlanta, GA-12345', N'123-456-7890', CAST(N'2019-04-10T00:00:00.000' AS DateTime), CAST(N'2020-02-10T00:00:00.000' AS DateTime), N'David', CAST(N'2019-04-10T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[SalesPerson] ([SalesPersonId], [FirstName], [LastName], [Address], [Phone], [StartDate], [TerminationDate], [ManagerName], [CreatedDate], [LastUpdatedDate]) VALUES (8, N'John', N'Red', N'789, River St, Houston, TX-12345', N'123-456-7890', CAST(N'2021-02-21T00:00:00.000' AS DateTime), CAST(N'2022-01-10T00:00:00.000' AS DateTime), N'David', CAST(N'2021-02-21T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[SalesPerson] ([SalesPersonId], [FirstName], [LastName], [Address], [Phone], [StartDate], [TerminationDate], [ManagerName], [CreatedDate], [LastUpdatedDate]) VALUES (9, N'Rigsby', N'Wayne', N'123, River St, Houston, TX-12345', N'123-456-7890', CAST(N'2021-02-15T00:00:00.000' AS DateTime), NULL, N'David', CAST(N'2021-02-15T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[SalesPerson] ([SalesPersonId], [FirstName], [LastName], [Address], [Phone], [StartDate], [TerminationDate], [ManagerName], [CreatedDate], [LastUpdatedDate]) VALUES (10, N'Grace', N'Vanpelt', N'789, River St, Houston, TX-12345', N'123-456-7890', CAST(N'2019-01-10T00:00:00.000' AS DateTime), NULL, N'John', CAST(N'2019-01-10T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[SalesPerson] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Customer]    Script Date: 1/23/2022 8:45:08 PM ******/
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [UC_Customer] UNIQUE NONCLUSTERED 
(
	[FirstName] ASC,
	[LastName] ASC,
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UC_Discount]    Script Date: 1/23/2022 8:45:08 PM ******/
ALTER TABLE [dbo].[Discount] ADD  CONSTRAINT [UC_Discount] UNIQUE NONCLUSTERED 
(
	[ProductId] ASC,
	[BeginDate] ASC,
	[EndDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Product]    Script Date: 1/23/2022 8:45:08 PM ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [UC_Product] UNIQUE NONCLUSTERED 
(
	[ProductName] ASC,
	[Manufacturer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_SalesPerson]    Script Date: 1/23/2022 8:45:08 PM ******/
ALTER TABLE [dbo].[SalesPerson] ADD  CONSTRAINT [UC_SalesPerson] UNIQUE NONCLUSTERED 
(
	[FirstName] ASC,
	[LastName] ASC,
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Customer] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Discount] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Sale] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SalesPerson] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Discount]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD FOREIGN KEY([SalespersonId])
REFERENCES [dbo].[SalesPerson] ([SalesPersonId])
GO
/****** Object:  StoredProcedure [dbo].[AddSale]    Script Date: 1/23/2022 8:45:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AddSale]
(
	@ProductId AS int,
	@CustomerId AS int,
	@SalesPersonId AS int,
	@Price AS float,
	@SalesCommission AS float,
	@SaleDate AS Datetime
)
AS
BEGIN
begin transaction
	INSERT INTO [dbo].[Sale] (ProductId, SalesPersonId, CustomerId, Price,SalesCommission,SalesDate,CreatedDate)
	VALUES(@ProductId,@SalesPersonId,@CustomerId,@Price,@SalesCommission,@SaleDate,GETDATE())

	Update product set QtyOnHand = QtyOnHand-1 where productid =@ProductId
commit transaction
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllCustomers]    Script Date: 1/23/2022 8:45:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
This procedure is to return all customers from customer table
*/
CREATE PROCEDURE [dbo].[GetAllCustomers]
AS
BEGIN
	SELECT [CustomerId]
		  ,[FirstName]
		  ,[LastName]
		  ,[Address]
		  ,[PhoneNumber]
		  ,[StartDate]
		  
	  FROM [dbo].[Customer]
 END
GO
/****** Object:  StoredProcedure [dbo].[GetAllProducts]    Script Date: 1/23/2022 8:45:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
This procedure is to return all products from product table
*/
CREATE PROCEDURE [dbo].[GetAllProducts]
AS
BEGIN
SELECT A.[ProductId]
      ,[ProductName]
      ,[Manufacturer]
      ,[Style]
      ,[PurchasePrice]
      ,[SalePrice]
      ,[QtyOnHand]
      ,[CommissionPercentage]
	  ,ProductDiscount  = COALESCE(B.DiscountPercentage,0) 
  FROM [dbo].[Product] A
  LEFT JOIN dbo.Discount B ON A.ProductId = B.ProductId AND getdate() between B.BeginDate and B.Enddate

END
GO
/****** Object:  StoredProcedure [dbo].[GetAllSales]    Script Date: 1/23/2022 8:45:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[GetAllSales]
(
	@StartDate datetime = NULL,
	@EndDate datetime = NULL
)
AS
BEGIN

CREATE TABLE #Sale 
(
[SaleId] int
		  ,[ProductId] int
		  ,[SalespersonId] int
		  ,[CustomerId] int
		  ,[SalesDate] datetime
		  ,Price float
		  ,Commission float  
)

IF(@StartDate IS NOT NULL AND @EndDate IS NOT NULL )
BEGIN
INSERT INTO #Sale ([SaleId]
		  ,[ProductId]
		  ,[SalespersonId]
		  ,[CustomerId]
		  ,[SalesDate]
		  ,Price
		  ,Commission)
	SELECT [SaleId]
		  ,[ProductId]
		  ,[SalespersonId]
		  ,[CustomerId]
		  ,[SalesDate]
		  ,Price
		  ,SalesCommission
	 FROM [dbo].[Sale] WHERE [SalesDate] BETWEEN @StartDate AND @EndDate
  END

ELSE IF(@StartDate IS NOT NULL AND @EndDate IS NULL )
	BEGIN
	INSERT INTO #Sale ([SaleId]
		  ,[ProductId]
		  ,[SalespersonId]
		  ,[CustomerId]
		  ,[SalesDate]
		  ,Price
		  ,Commission)
		SELECT [SaleId]
			  ,[ProductId]
			  ,[SalespersonId]
			  ,[CustomerId]
			  ,[SalesDate]
			  ,Price
			  ,SalesCommission
		  FROM [dbo].[Sale] WHERE [SalesDate] >= @StartDate
	END
ELSE IF(@StartDate IS NULL AND @EndDate IS NOT NULL )
	BEGIN
	INSERT INTO #Sale ([SaleId]
		  ,[ProductId]
		  ,[SalespersonId]
		  ,[CustomerId]
		  ,[SalesDate]
		  ,Price
		  ,Commission)
		SELECT [SaleId]
			  ,[ProductId]
			  ,[SalespersonId]
			  ,[CustomerId]
			  ,[SalesDate]
			  ,Price
			  ,SalesCommission
		  FROM [dbo].[Sale] WHERE [SalesDate] <= @EndDate
	END
ELSE
	BEGIN
	INSERT INTO #Sale ([SaleId]
		  ,[ProductId]
		  ,[SalespersonId]
		  ,[CustomerId]
		  ,[SalesDate]
		  ,Price
		  ,Commission)
		  SELECT [SaleId]
				  ,[ProductId]
				  ,[SalespersonId]
				  ,[CustomerId]
				  ,[SalesDate]
				  ,Price
				  ,SalesCommission
			 FROM [dbo].[Sale]
	END

--return sale data
SELECT * FROM #Sale
--return products related to above sale
SELECT A.ProductId,
		A.ProductName,
		A.Manufacturer,
		A.Style,
		A.PurchasePrice,
		A.SalePrice,
		A.QtyOnHand,
		A.CommissionPercentage 
FROM dbo.Product A
INNER JOIN #Sale B ON A.ProductId = B.ProductId;

--return salesperson related to above sale
SELECT A.SalesPersonId,
A.FirstName,
A.LastName,
A.Address,
A.Phone,
A.StartDate,
A.TerminationDate,
A.ManagerName FROM dbo.SalesPerson A
INNER JOIN #Sale B ON A.[SalespersonId] = B.[SalespersonId]
--return customer related to above sale
SELECT A.CustomerId,
A.FirstName,
A.LastName,
A.Address,
A.PhoneNumber,
A.StartDate FROM dbo.Customer A
INNER JOIN #Sale B ON A.[CustomerId] = B.[CustomerId]


END
GO
/****** Object:  StoredProcedure [dbo].[GetAllSalesPerson]    Script Date: 1/23/2022 8:45:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
This procedure is to return all sales from sale table
*/
CREATE PROCEDURE [dbo].[GetAllSalesPerson]
AS
BEGIN
	SELECT [SalesPersonId]
      ,[FirstName]
      ,[LastName]
      ,[Address]
      ,[Phone]
      ,[StartDate]
      ,[TerminationDate]
      ,[ManagerName]
  FROM [dbo].[SalesPerson]
END



DROP PROCEDURE IF EXISTS UpdateSalesPerson
GO
/****** Object:  StoredProcedure [dbo].[GetProductByNameAndManufacturer]    Script Date: 1/23/2022 8:45:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductByNameAndManufacturer]
(
	@ProductName AS NVARCHAR(200),
	@Manufacturer AS NVARCHAR(200)
)
AS
BEGIN
SELECT [ProductId]
      ,[ProductName]
      ,[Manufacturer]
      ,[Style]
      ,[PurchasePrice]
      ,[SalePrice]
      ,[QtyOnHand]
      ,[CommissionPercentage]
  FROM [dbo].[Product] WHERE [ProductName] = @ProductName AND [Manufacturer]=@Manufacturer
END
GO
/****** Object:  StoredProcedure [dbo].[GetProductDiscount]    Script Date: 1/23/2022 8:45:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetProductDiscount]
(
	@ProductId AS int,
	@SaleDate AS Datetime
)
AS
BEGIN
	select productid,discountpercentage from discount where productid=@ProductId and @SaleDate between begindate and enddate
END
GO
/****** Object:  StoredProcedure [dbo].[GetSalesPersonCommissionByQuarter]    Script Date: 1/23/2022 8:45:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
This procedure is to get sales person commision report
Using built in 
*/
CREATE PROCEDURE [dbo].[GetSalesPersonCommissionByQuarter]
(
	@SalesPersonId int,
	@Year int ,
	@quarter int
)
AS
BEGIN
	SELECT SP.[SalesPersonId]
      ,[FirstName]
      ,[LastName]
	 ,SalesDate
	 ,SalesCommission
  FROM [dbo].[SalesPerson] SP
  INNER JOIN  dbo.Sale S ON SP.[SalesPersonId] = S.[SalesPersonId]
	WHERE SP.[SalesPersonId] = @SalesPersonId 
		AND Year(SalesDate) = @Year
		AND datepart(QQ,SalesDate) = @quarter
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateProductByProductId]    Script Date: 1/23/2022 8:45:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[UpdateProductByProductId]
(
	@ProductId AS int,
	@ProductName AS NVARCHAR(200),
	@Manufacturer AS NVARCHAR(200),
	@Style AS NVARCHAR(200),
	@PurchasePrice AS Float,
	@SalePrice AS Float,
	@QtyOnHand AS int,
	@CommissionPercentage AS Float
)
AS
BEGIN
UPDATE dbo.Product
	SET ProductName = @ProductName
      ,Manufacturer = @Manufacturer
      ,Style = @Style
      ,PurchasePrice = @PurchasePrice
      ,SalePrice = @SalePrice
      ,QtyOnHand = @QtyOnHand
      ,CommissionPercentage = @CommissionPercentage
	  ,LastUpdatedDate = getdate()
   WHERE ProductId = @ProductId 
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateSalesPersonById]    Script Date: 1/23/2022 8:45:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateSalesPersonById]
(
@SalesPersonId int,
@FirstName NVARCHAR(100),
@LastName NVARCHAR(100),
@Address NVARCHAR(200),
@Phone NVARCHAR(15),
@StartDate datetime,
@TerminationDate datetime,
@ManagerName NVARCHAR(100)
)
AS
BEGIN
	UPDATE [dbo].[SalesPerson]
	SET [FirstName] = @FirstName
      ,[LastName] =  @LastName
      ,[Address] = @Address
      ,[Phone] = @Phone 
      ,[StartDate] = @StartDate
      ,[TerminationDate] = @TerminationDate
      ,[ManagerName] = @ManagerName
	  ,LastUpdatedDate = getdate()
  WHERE SalesPersonId = @SalesPersonId
END
GO
USE [master]
GO
ALTER DATABASE [BeSpokedBikesDB] SET  READ_WRITE 
GO
