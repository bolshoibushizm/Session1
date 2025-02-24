USE [master]
GO
/****** Object:  Database [Trade]    Script Date: 19.01.2025 16:44:11 ******/
CREATE DATABASE [Trade]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Trade', FILENAME = N'D:\15\MSSQL15.MSSQLSERVER\MSSQL\DATA\Trade.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Trade_log', FILENAME = N'D:\15\MSSQL15.MSSQLSERVER\MSSQL\DATA\Trade_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Trade] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trade] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trade] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Trade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trade] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trade] SET RECOVERY FULL 
GO
ALTER DATABASE [Trade] SET  MULTI_USER 
GO
ALTER DATABASE [Trade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trade] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Trade] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Trade', N'ON'
GO
ALTER DATABASE [Trade] SET QUERY_STORE = OFF
GO
USE [Trade]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 19.01.2025 16:44:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NULL,
	[OrderStatus] [nvarchar](max) NULL,
	[OrderDeliveryDate] [datetime] NULL,
	[OrderPickupPoint] [int] NULL,
	[UserID] [int] NULL,
	[ReceiveCode] [float] NULL,
 CONSTRAINT [PK__Order__C3905BAFFD73652D] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderPickUpPoint]    Script Date: 19.01.2025 16:44:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderPickUpPoint](
	[idPickUpPoint] [int] IDENTITY(1,1) NOT NULL,
	[index] [varchar](20) NULL,
	[Adress] [text] NULL,
 CONSTRAINT [PK__OrderPic__B8043BC8D1AA648A] PRIMARY KEY CLUSTERED 
(
	[idPickUpPoint] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 19.01.2025 16:44:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK__OrderPro__817A266215C46A46] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 19.01.2025 16:44:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[UnitofMetrick] [nchar](10) NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[MaxDiscount] [int] NULL,
	[ProductManufacturer] [nvarchar](max) NOT NULL,
	[Provider] [varchar](50) NULL,
	[ProductCategory] [int] NOT NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductPhoto] [text] NULL,
 CONSTRAINT [PK__Product__2EA7DCD55B501D2E] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 19.01.2025 16:44:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeProduct]    Script Date: 19.01.2025 16:44:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeProduct](
	[ProductCategory] [int] NOT NULL,
	[NameCategory] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 19.01.2025 16:44:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRole] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [UserID], [ReceiveCode]) VALUES (21, CAST(N'2022-05-16T00:00:00.000' AS DateTime), N'Завершен
', CAST(N'2022-05-22T00:00:00.000' AS DateTime), 1, 10, 801)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [UserID], [ReceiveCode]) VALUES (23, CAST(N'2022-05-16T00:00:00.000' AS DateTime), N'Новый 
', CAST(N'2022-05-22T00:00:00.000' AS DateTime), 14, NULL, 802)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [UserID], [ReceiveCode]) VALUES (24, CAST(N'2022-05-17T00:00:00.000' AS DateTime), N'Новый', CAST(N'2022-05-23T00:00:00.000' AS DateTime), 2, 7, 803)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [UserID], [ReceiveCode]) VALUES (25, CAST(N'2022-05-17T00:00:00.000' AS DateTime), N'Новый', CAST(N'2022-05-23T00:00:00.000' AS DateTime), 22, NULL, 804)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [UserID], [ReceiveCode]) VALUES (26, CAST(N'2022-05-19T00:00:00.000' AS DateTime), N'Новый', CAST(N'2022-05-25T00:00:00.000' AS DateTime), 2, 9, 805)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [UserID], [ReceiveCode]) VALUES (27, CAST(N'2022-05-20T00:00:00.000' AS DateTime), N'Новый', CAST(N'2022-05-26T00:00:00.000' AS DateTime), 28, NULL, 806)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [UserID], [ReceiveCode]) VALUES (28, CAST(N'2022-05-22T00:00:00.000' AS DateTime), N'Новый', CAST(N'2022-05-28T00:00:00.000' AS DateTime), 3, NULL, 807)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [UserID], [ReceiveCode]) VALUES (29, CAST(N'2022-05-22T00:00:00.000' AS DateTime), N'Новый', CAST(N'2022-05-28T00:00:00.000' AS DateTime), 32, NULL, 808)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [UserID], [ReceiveCode]) VALUES (30, CAST(N'2022-05-24T00:00:00.000' AS DateTime), N'Новый', CAST(N'2022-05-30T00:00:00.000' AS DateTime), 5, NULL, 809)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderStatus], [OrderDeliveryDate], [OrderPickupPoint], [UserID], [ReceiveCode]) VALUES (31, CAST(N'2022-05-24T00:00:00.000' AS DateTime), N'Новый', CAST(N'2022-05-30T00:00:00.000' AS DateTime), 36, 8, 810)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderPickUpPoint] ON 

INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (1, N'344288', N'г. Талнах, ул. Чехова, 1')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (2, N'344288', N'г. Талнах, ул. Чехова, 2')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (3, N'344288', N'г. Талнах, ул. Чехова, 3')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (4, N'344288', N'г. Талнах, ул. Чехова, 4')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (5, N'344288', N'г. Талнах, ул. Чехова, 5')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (6, N'344288', N'г.Талнах, ул. Чехова, 6')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (7, N'344288', N'г.Талнах, ул. Чехова, 7')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (8, N'344288', N'г.Талнах, ул. Чехова, 8')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (9, N'344288', N'г.Талнах, ул. Чехова, 9')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (10, N'344288', N'г.Талнах, ул. Чехова, 10')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (11, N'344288', N'г.Талнах, ул. Чехова, 11')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (12, N'344288', N'г.Талнах, ул. Чехова, 12')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (13, N'344288', N'г.Талнах, ул. Чехова, 13')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (14, N'344288', N'г.Талнах, ул. Чехова, 14')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (15, N'344288', N'г.Талнах, ул. Чехова, 15')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (16, N'344288', N'г.Талнах, ул. Чехова, 16')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (17, N'344288', N'г.Талнах, ул. Чехова, 17')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (18, N'344288', N'г.Талнах, ул. Чехова, 18')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (19, N'344288', N'г.Талнах, ул. Чехова, 19')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (20, N'344288', N'г.Талнах, ул. Чехова, 20')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (21, N'344288', N'г.Талнах, ул. Чехова, 21')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (22, N'344288', N'г.Талнах, ул. Чехова, 22')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (23, N'344288', N'г.Талнах, ул. Чехова, 23')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (24, N'344288', N'г.Талнах, ул. Чехова, 24')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (25, N'344288', N'г.Талнах, ул. Чехова, 25')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (26, N'344288', N'г.Талнах, ул. Чехова, 26')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (27, N'344288', N'г.Талнах, ул. Чехова, 27')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (28, N'344288', N'г.Талнах, ул. Чехова, 28')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (29, N'344288', N'г.Талнах, ул. Чехова, 29')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (30, N'344288', N'г.Талнах, ул. Чехова, 30')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (31, N'344288', N'г.Талнах, ул. Чехова, 31')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (32, N'344288', N'г.Талнах, ул. Чехова, 32')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (33, N'344288', N'г.Талнах, ул. Чехова, 33')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (34, N'344288', N'г.Талнах, ул. Чехова, 34')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (35, N'344288', N'г.Талнах, ул. Чехова, 35')
INSERT [dbo].[OrderPickUpPoint] ([idPickUpPoint], [index], [Adress]) VALUES (36, N'344288', N'г.Талнах, ул. Чехова, 36')
SET IDENTITY_INSERT [dbo].[OrderPickUpPoint] OFF
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (21, 29, 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (23, 14, 16)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (24, 7, 20)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (25, 15, 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (26, 8, 4)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (27, 12, 4)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (28, 2, 10)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (29, 25, 5)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (30, 24, 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (31, 3, 2)
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [UnitofMetrick], [ProductCost], [MaxDiscount], [ProductManufacturer], [Provider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (1, N'B963H5', N'Ложка', N'шт.       ', CAST(800.0000 AS Decimal(19, 4)), 5, N'Smart Home', N'LeroiMerlin', 2, 3, 0, N'Ложка 21 мм металлическая (медная) (Упаковка 10 шт)', N'C:\Users\User\Desktop\300x200-300dpi.jpg')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [UnitofMetrick], [ProductCost], [MaxDiscount], [ProductManufacturer], [Provider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (2, N'C430T4', N'Набор на одну персону', N'шт.       ', CAST(1600.0000 AS Decimal(19, 4)), 30, N'Attribute', N'LeroiMerlin', 4, 3, 0, N'Набор на одну персону (4 предмета) серия "Bistro", нерж. сталь, Was, Германия.', N'')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [UnitofMetrick], [ProductCost], [MaxDiscount], [ProductManufacturer], [Provider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (3, N'C635Y6', N'Детский столовый набор', N'шт.       ', CAST(1000.0000 AS Decimal(19, 4)), 15, N'Apollo', N'Максидом', 4, 4, 25, N'Детский столовый набор Fissman «Зебра» ', N'')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [UnitofMetrick], [ProductCost], [MaxDiscount], [ProductManufacturer], [Provider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (4, N'C730R7', N'Ложка детская', N'шт.       ', CAST(300.0000 AS Decimal(19, 4)), 5, N'Smart Home', N'LeroiMerlin', 2, 3, 17, N'Ложка детская столовая', N'')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [UnitofMetrick], [ProductCost], [MaxDiscount], [ProductManufacturer], [Provider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (5, N'C943G5', N'Набор чайных ложек', N'шт.       ', CAST(200.0000 AS Decimal(19, 4)), 5, N'Attribute', N'Максидом', 4, 4, 12, N'Attribute Набор чайных ложек Baguette 3 предмета серебристый', N'')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [UnitofMetrick], [ProductCost], [MaxDiscount], [ProductManufacturer], [Provider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (6, N'C946Y6', N'Вилка столовая', N'шт.       ', CAST(300.0000 AS Decimal(19, 4)), 15, N'Apollo', N'LeroiMerlin', 1, 2, 16, N'Вилка детская столовая', N'')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [UnitofMetrick], [ProductCost], [MaxDiscount], [ProductManufacturer], [Provider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (7, N'D735T5', N'Ложка чайная', N'шт.       ', CAST(220.0000 AS Decimal(19, 4)), 5, N'Alaska', N'LeroiMerlin', 2, 2, 13, N'Ложка чайная ALASKA Eternum', N'\image\D735T5.jpg')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [UnitofMetrick], [ProductCost], [MaxDiscount], [ProductManufacturer], [Provider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (8, N'E732R7', N'Набор столовых приборов', N'шт.       ', CAST(990.0000 AS Decimal(19, 4)), 15, N'Smart Home', N'Максидом', 4, 5, 6, N'Набор столовых приборов Smart Home20 Black в подарочной коробке, 4 шт', N'\image\E732R7.jpg')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [UnitofMetrick], [ProductCost], [MaxDiscount], [ProductManufacturer], [Provider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (9, N'F392G6', N'Набор столовых приборов', N'шт.       ', CAST(490.0000 AS Decimal(19, 4)), 10, N'Apollo', N'LeroiMerlin', 4, 4, 9, N'Apollo Набор столовых приборов Chicago 4 предмета серебристый', N'')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [UnitofMetrick], [ProductCost], [MaxDiscount], [ProductManufacturer], [Provider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (10, N'F573T5', N'Вилки столовые', N'шт.       ', CAST(650.0000 AS Decimal(19, 4)), 15, N'Davinci', N'Максидом', 1, 3, 4, N'Вилки столовые на блистере / 6 шт.', N'\image\F573T5.jpg')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [UnitofMetrick], [ProductCost], [MaxDiscount], [ProductManufacturer], [Provider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (11, N'F745K4', N'Столовые приборы для салата', N'шт.       ', CAST(2000.0000 AS Decimal(19, 4)), 10, N'Mayer & Boch', N'LeroiMerlin', 4, 3, 2, N'Столовые приборы для салата Orskov Lava, 2шт', N'')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [UnitofMetrick], [ProductCost], [MaxDiscount], [ProductManufacturer], [Provider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (12, N'F839R6', N'Ложка чайная', N'шт.       ', CAST(400.0000 AS Decimal(19, 4)), 15, N'Doria', N'Максидом', 2, 2, 6, N'Ложка чайная DORIA Eternum', N'')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [UnitofMetrick], [ProductCost], [MaxDiscount], [ProductManufacturer], [Provider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (13, N'G304H6', N'Набор ложек', N'шт.       ', CAST(500.0000 AS Decimal(19, 4)), 5, N'Apollo', N'Максидом', 2, 4, 12, N'Набор ложек столовых APOLLO "Bohemica" 3 пр.', N'')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [UnitofMetrick], [ProductCost], [MaxDiscount], [ProductManufacturer], [Provider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (14, N'G387Y6', N'Ложка столовая', N'шт.       ', CAST(441.0000 AS Decimal(19, 4)), 5, N'Doria', N'Максидом', 2, 4, 23, N'Ложка столовая DORIA L=195/60 мм Eternum', N'\image\G387Y6.jpg')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [UnitofMetrick], [ProductCost], [MaxDiscount], [ProductManufacturer], [Provider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (15, N'H384H3', N'Набор столовых приборов', N'шт.       ', CAST(600.0000 AS Decimal(19, 4)), 15, N'Apollo', N'Максидом', 4, 2, 9, N'Набор столовых приборов для торта Palette 7 предметов серебристый', N'\image\H384H3.jpg')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [UnitofMetrick], [ProductCost], [MaxDiscount], [ProductManufacturer], [Provider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (16, N'H495H6', N'Набор стейковых ножей', N'шт.       ', CAST(7000.0000 AS Decimal(19, 4)), 15, N'Mayer & Boch', N'LeroiMerlin', 3, 2, 15, N'Набор стейковых ножей 4 пр. в деревянной коробке', N'')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [UnitofMetrick], [ProductCost], [MaxDiscount], [ProductManufacturer], [Provider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (17, N'K437E6', N'Набор вилок', N'шт.       ', CAST(530.0000 AS Decimal(19, 4)), 5, N'Apollo', N'Максидом', 4, 3, 16, N'Набор вилок столовых APOLLO "Aurora" 3шт.', N'\image\K437E6.jpg')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [UnitofMetrick], [ProductCost], [MaxDiscount], [ProductManufacturer], [Provider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (18, N'L593H5', N'набор ножей', N'шт.       ', CAST(1300.0000 AS Decimal(19, 4)), 25, N'Mayer & Boch', N'Максидом', 4, 5, 14, N'Набор ножей Mayer & Boch, 4 шт', N'')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [UnitofMetrick], [ProductCost], [MaxDiscount], [ProductManufacturer], [Provider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (19, N'N493G6', N'Набор для серверовки', N'шт.       ', CAST(2550.0000 AS Decimal(19, 4)), 15, N'Smart Home', N'LeroiMerlin', 4, 4, 6, N'Набор для сервировки сыра Select', N'')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [UnitofMetrick], [ProductCost], [MaxDiscount], [ProductManufacturer], [Provider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (20, N'R836H6', N'Набор  столовых ножей', N'шт.       ', CAST(250.0000 AS Decimal(19, 4)), 5, N'Attribute', N'LeroiMerlin', 3, 3, 16, N'Attribute Набор столовых ножей Baguette 2 предмета серебристый', N'\image\R836H6.jpg')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [UnitofMetrick], [ProductCost], [MaxDiscount], [ProductManufacturer], [Provider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (21, N'S394J5', N'Набор чайных ложек', N'шт.       ', CAST(170.0000 AS Decimal(19, 4)), 5, N'Attribute', N'LeroiMerlin', 4, 3, 4, N'Attribute Набор чайных ложек Chaplet 3 предмета серебристый', N'')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [UnitofMetrick], [ProductCost], [MaxDiscount], [ProductManufacturer], [Provider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (22, N'S395B5', N'Нож для стейка', N'шт.       ', CAST(600.0000 AS Decimal(19, 4)), 10, N'Apollo', N'LeroiMerlin', 3, 4, 15, N'Нож для стейка 11,5 см серебристый/черный', N'')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [UnitofMetrick], [ProductCost], [MaxDiscount], [ProductManufacturer], [Provider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (23, N'T793T4', N'Набор ложек', N'шт.       ', CAST(250.0000 AS Decimal(19, 4)), 10, N'Attribute', N'LeroiMerlin', 2, 3, 16, N'Набор столовых ложек Baguette 3 предмета серебристый', N'\image\T793T4.jpg')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [UnitofMetrick], [ProductCost], [MaxDiscount], [ProductManufacturer], [Provider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (24, N'V026J4', N'набор ножей', N'шт.       ', CAST(700.0000 AS Decimal(19, 4)), 15, N'Apollo', N'Максидом', 4, 3, 9, N'абор ножей для стейка и пиццы Swiss classic 2 шт. желтый', N'')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [UnitofMetrick], [ProductCost], [MaxDiscount], [ProductManufacturer], [Provider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (25, N'V403G6', N'Ложка чайная', N'шт.       ', CAST(600.0000 AS Decimal(19, 4)), 15, N'Doria', N'Максидом', 2, 5, 24, N'Ложка чайная DORIA Eternum', N'')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [UnitofMetrick], [ProductCost], [MaxDiscount], [ProductManufacturer], [Provider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (26, N'V727Y6', N'Набор десертных ложек', N'шт.       ', CAST(3000.0000 AS Decimal(19, 4)), 10, N'Mayer & Boch', N'LeroiMerlin', 2, 4, 8, N'Набор десертных ложек на подставке Размер: 7*7*15 см', N'')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [UnitofMetrick], [ProductCost], [MaxDiscount], [ProductManufacturer], [Provider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (27, N'W295Y5', N'Сервировочный набор для торта', N'шт.       ', CAST(1100.0000 AS Decimal(19, 4)), 15, N'Attribute', N'Максидом', 4, 2, 16, N'Набор сервировочный для торта "Розанна"', N'')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [UnitofMetrick], [ProductCost], [MaxDiscount], [ProductManufacturer], [Provider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (28, N'W405G6', N'Набор столовых приборов', N'шт.       ', CAST(1300.0000 AS Decimal(19, 4)), 25, N'Attribute', N'LeroiMerlin', 4, 3, 4, N'Набор сервировочных столовых вилок Цветы', N'')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [UnitofMetrick], [ProductCost], [MaxDiscount], [ProductManufacturer], [Provider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (29, N'А112Т4', N'Набор вилок', N'шт.       ', CAST(1600.0000 AS Decimal(19, 4)), 30, N'Davinci', N'Максидом', 1, 2, 6, N'Набор столовых вилок Davinci, 20 см 6 шт.', N'\image\А112Т4.jpg')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [UnitofMetrick], [ProductCost], [MaxDiscount], [ProductManufacturer], [Provider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (31, N'12', N'1', N'123       ', CAST(123.0000 AS Decimal(19, 4)), NULL, N'213', N'123', 1, NULL, 123, N'123', N'C:\Users\User\Desktop\rpm\session1\session1\bin\Debug\image\300x200-300dpi.jpg')
INSERT [dbo].[Product] ([Id], [ProductArticleNumber], [ProductName], [UnitofMetrick], [ProductCost], [MaxDiscount], [ProductManufacturer], [Provider], [ProductCategory], [ProductDiscountAmount], [ProductQuantityInStock], [ProductDescription], [ProductPhoto]) VALUES (32, N'sdf', N'sdf', N'sdf       ', CAST(13.0000 AS Decimal(19, 4)), NULL, N'sdf', N'sdf', 1, NULL, 13, N'sdf', N'C:\Users\User\Desktop\300x200-300dpi.jpg')
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
INSERT [dbo].[TypeProduct] ([ProductCategory], [NameCategory]) VALUES (1, N'Вилки')
INSERT [dbo].[TypeProduct] ([ProductCategory], [NameCategory]) VALUES (2, N'Ложки')
INSERT [dbo].[TypeProduct] ([ProductCategory], [NameCategory]) VALUES (3, N'Ножи')
INSERT [dbo].[TypeProduct] ([ProductCategory], [NameCategory]) VALUES (4, N'Наборы')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (1, N'Савицкая', N'Арина', N'Саввична', N'1y3lj8w0viop@outlook.com', N'2L6KZG', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (2, N'Мартынов', N'Максим', N'Михайлович', N'3o698uk5c0rw@tutanota.com', N'uzWC67', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (3, N'Зубов', N'Александр', N'Дамирович', N'lx24fvrt1aip@yahoo.com', N'8ntwUp', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (4, N'Попов', N'Даниил', N'Олегович', N's8z076vku95j@gmail.com', N'YOyhfR', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (5, N'Семенов', N'Михаил', N'Никитич', N'n3bxm7f2q5i4@outlook.com', N'RSbvHv', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (6, N'Дмитриева', N'Надежда', N'Вячеславовна', N'r7dztn8a5ihq@mail.com', N'rwVDh9', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (7, N'Воронцова', N'Виктория', N'Саввична', N'vofgck2m39hq@gmail.com', N'LdNyos', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (8, N'Софронов', N'Ярослав', N'Игоревич', N's6q9tevybado@yahoo.com', N'gynQMT', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (9, N'Егоров', N'Артём', N'Евгеньевич', N'p7wuls3dtq9v@yahoo.com', N'AtnDjr', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRole]) VALUES (10, N'Ситникова', N'Эмилия', N'Степановна', N'rdn04s1u2ckb@mail.com', N'JlFRCZ', 3)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_OrderPickUpPoint] FOREIGN KEY([OrderPickupPoint])
REFERENCES [dbo].[OrderPickUpPoint] ([idPickUpPoint])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_OrderPickUpPoint]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Order]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Product] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_TypeProduct] FOREIGN KEY([ProductCategory])
REFERENCES [dbo].[TypeProduct] ([ProductCategory])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_TypeProduct]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
GO
USE [master]
GO
ALTER DATABASE [Trade] SET  READ_WRITE 
GO
