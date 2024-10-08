USE [master]
GO
/****** Object:  Database [DB_QLBH_Java5]    Script Date: 7/26/2024 1:32:51 PM ******/
CREATE DATABASE [DB_QLBH_Java5]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_QLBH_Java5', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DB_QLBH_Java5.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_QLBH_Java5_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DB_QLBH_Java5_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DB_QLBH_Java5] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_QLBH_Java5].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_QLBH_Java5] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_QLBH_Java5] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_QLBH_Java5] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_QLBH_Java5] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_QLBH_Java5] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_QLBH_Java5] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_QLBH_Java5] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_QLBH_Java5] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_QLBH_Java5] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_QLBH_Java5] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_QLBH_Java5] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_QLBH_Java5] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_QLBH_Java5] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_QLBH_Java5] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_QLBH_Java5] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_QLBH_Java5] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_QLBH_Java5] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_QLBH_Java5] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_QLBH_Java5] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_QLBH_Java5] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_QLBH_Java5] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_QLBH_Java5] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_QLBH_Java5] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_QLBH_Java5] SET  MULTI_USER 
GO
ALTER DATABASE [DB_QLBH_Java5] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_QLBH_Java5] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_QLBH_Java5] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_QLBH_Java5] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_QLBH_Java5] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_QLBH_Java5] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DB_QLBH_Java5] SET QUERY_STORE = OFF
GO
USE [DB_QLBH_Java5]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 7/26/2024 1:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Photo] [nvarchar](50) NOT NULL,
	[Activated] [bit] NOT NULL,
	[Admin] [bit] NOT NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/26/2024 1:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [char](4) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[is_delete] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 7/26/2024 1:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[order_id] [bigint] NULL,
	[product_id] [int] NULL,
	[Price] [float] NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 7/26/2024 1:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[CreateDate] [date] NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Total] [bigint] NULL,
	[Trang_thai] [bit] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 7/26/2024 1:32:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[Price] [bigint] NULL,
	[create_date] [date] NOT NULL,
	[Quantity] [int] NOT NULL,
	[category_id] [char](4) NOT NULL,
	[is_delete] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'NV001', N'123', N'Phạm Thế Tình', N'tinh.phamthe1312@gmail.com
', N'2.jpg', 1, 1)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'nv00110', N'123', N'123', N'tinh.phamthe1312@gmail.com
', N'leftHand.jpg', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'NV002', N'123', N'Phạm Hoàng Long', N'phamthetinhcop1312@gmail.com', N'1.jpg', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'nv0020', N'123', N'Trần Hưng Đạo', N'tinh.phamthe1312@gmail.com
', N'rightHand.jpg', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'NV003', N'123', N'Nguyễn Văn Chinh', N'tinh.phamthe1312@gmail.com
', N'3.jpg', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'nv006', N'123', N'Tôn Ngộ Không', N'tinh.phamthe1312@gmail.com
', N'IMG_4665.jpg', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'nv013', N'123', N'Phạm Hoành Loan', N'tinh.phamthe1312@gmail.com
', N'The Lion - Chelsea FC.png', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'nv020', N'123', N'Phạm Trường Giang', N'tinh.phamthe1312@gmail.com
', N'3.jpg', 1, 0)
INSERT [dbo].[Accounts] ([Username], [Password], [Fullname], [Email], [Photo], [Activated], [Admin]) VALUES (N'nv123', N'123', N'123', N'tinh.phamthe1312@gmail.com
', N'2.jpg', 1, 0)
GO
INSERT [dbo].[Categories] ([Id], [Name], [is_delete]) VALUES (N'ca01', N'Mac', 0)
INSERT [dbo].[Categories] ([Id], [Name], [is_delete]) VALUES (N'ca02', N'iPad', 0)
INSERT [dbo].[Categories] ([Id], [Name], [is_delete]) VALUES (N'ca03', N'iPhone', 0)
INSERT [dbo].[Categories] ([Id], [Name], [is_delete]) VALUES (N'ca04', N'Watch', 0)
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (3, 5, 52, 12000000, 1)
INSERT [dbo].[OrderDetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (4, 5, 31, 13200000, 2)
INSERT [dbo].[OrderDetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (5, 6, 52, 12000000, 4)
INSERT [dbo].[OrderDetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (6, 7, 35, 5890000, 1)
INSERT [dbo].[OrderDetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (7, 7, 52, 12000000, 1)
INSERT [dbo].[OrderDetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (8, 8, 35, 5890000, 1)
INSERT [dbo].[OrderDetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (9, 8, 52, 12000000, 1)
INSERT [dbo].[OrderDetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (10, 8, 25, 14090000, 1)
INSERT [dbo].[OrderDetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (11, 9, 50, 8000000, 2)
INSERT [dbo].[OrderDetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (12, 9, 56, 7290000, 1)
INSERT [dbo].[OrderDetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (13, 10, 19, 27290000, 1)
INSERT [dbo].[OrderDetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (14, 10, 56, 7290000, 5)
INSERT [dbo].[OrderDetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (15, 11, 18, 79890000, 1)
INSERT [dbo].[OrderDetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (16, 11, 35, 5890000, 1)
INSERT [dbo].[OrderDetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (17, 11, 57, 10020000, 2)
INSERT [dbo].[OrderDetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (18, 11, 92, 300000, 1)
INSERT [dbo].[OrderDetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (19, 11, 30, 11000000, 1)
INSERT [dbo].[OrderDetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (20, 12, 35, 5890000, 2)
INSERT [dbo].[OrderDetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (21, 12, 55, 7390000, 2)
INSERT [dbo].[OrderDetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (22, 12, 92, 300000, 3)
INSERT [dbo].[OrderDetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (23, 12, 13, 31990000, 2)
INSERT [dbo].[OrderDetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (24, 13, 50, 8000000, 1)
INSERT [dbo].[OrderDetails] ([Id], [order_id], [product_id], [Price], [Quantity]) VALUES (25, 13, 7, 59990000, 1)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Total], [Trang_thai]) VALUES (5, N'NV001', CAST(N'2024-06-10' AS Date), N'quận 9', 38400000, 1)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Total], [Trang_thai]) VALUES (6, N'nv001', CAST(N'2024-06-10' AS Date), N'Quận 12', 48000000, 0)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Total], [Trang_thai]) VALUES (7, N'nv002', CAST(N'2024-06-10' AS Date), N'quận gò vấp', 17890000, 0)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Total], [Trang_thai]) VALUES (8, N'nv001', CAST(N'2024-06-10' AS Date), N'quận 9', 31980000, 0)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Total], [Trang_thai]) VALUES (9, N'nv013', CAST(N'2024-06-11' AS Date), N'Nghệ An', 23290000, 1)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Total], [Trang_thai]) VALUES (10, N'nv001', CAST(N'2024-06-12' AS Date), N'Quanaj 12', 63740000, 0)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Total], [Trang_thai]) VALUES (11, N'nv001', CAST(N'2024-06-14' AS Date), N'Hà Nội', 117120000, 0)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Total], [Trang_thai]) VALUES (12, N'NV001', CAST(N'2024-06-14' AS Date), N'Tây Ninh', 91440000, 1)
INSERT [dbo].[Orders] ([Id], [Username], [CreateDate], [Address], [Total], [Trang_thai]) VALUES (13, N'NV001', CAST(N'2024-06-14' AS Date), N'36, 120 street, Tan Phu ward, Thu Duc city, Ho Chi Minh city', 67990000, 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (5, N'Macbook Air M3 13 2024 8CPU 8GPU/8GB/256GB', N'mac/2.jpg', 27290000, CAST(N'2023-05-11' AS Date), 100, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (7, N'MacBook Pro 14 2023 M3 Pro 11 CPU/14GPU/36GB/512GB', N'mac/2.jpg', 59990000, CAST(N'2023-05-15' AS Date), 200, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (8, N'MacBook Pro 14 2023 M3 8 CPU/10 GPU/16GB/512GB', N'mac/3.jpg', 44990000, CAST(N'2023-05-16' AS Date), 150, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (10, N'Macbook Air M3 15 2024 8CPU 10GPU/16GB/512GB', N'mac/3.jpg', 42990000, CAST(N'2023-05-15' AS Date), 500, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (11, N'MacBook Pro 14 2023 M3 Pro 12 CPU/18 GPU/18GB/1TB', N'mac/5.jpg', 57990000, CAST(N'2023-05-12' AS Date), 130, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (12, N'MacBook Pro 14 2023 M3 Pro 11 CPU/14 GPU/18GB/512GB', N'mac/6.jpg', 49490000, CAST(N'2023-05-13' AS Date), 120, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (13, N'MacBook Air 15 M2 2023 8CPU 10GPU/8GB/512GB/Sạc 70W', N'mac/7.jpg', 31990000, CAST(N'2023-05-14' AS Date), 190, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (14, N'Macbook Air M3 13 2024 8CPU 10GPU/8GB/512GB', N'mac/8.jpg', 32990000, CAST(N'2024-06-12' AS Date), 120, N'ca01', 1)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (15, N'MacBook Pro 16 2023 M3 Max 16 CPU/40 GPU/48GB/1TB', N'mac/9.jpg', 101000000, CAST(N'2023-05-16' AS Date), 125, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (16, N'MacBook Pro 16 2023 M3 Max 14 CPU/30 GPU/36GB/1TB', N'mac/9.jpg', 89900000, CAST(N'2023-05-16' AS Date), 150, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (17, N'MacBook Pro 16 2023 M3 Pro 12 CPU/18 GPU/36GB/512GB', N'mac/11.jpg', 74900000, CAST(N'2023-05-16' AS Date), 170, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (18, N'MacBook Pro 14 2023 M3 Max 14 CPU/30 GPU/36GB/1TB', N'mac/12.jpg', 79890000, CAST(N'2023-05-16' AS Date), 335, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (19, N'Macbook Air M3 13 2024 8CPU 8GPU/8GB/256GB', N'mac/13.jpg', 27290000, CAST(N'2023-05-17' AS Date), 325, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (20, N'MacBook Air 15 M2 2023 8CPU 10GPU/8GB/512GB/Sạc 70W', N'mac/9.jpg', 32000000, CAST(N'2023-05-17' AS Date), 175, N'ca01', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (21, N'iPad mini 6 2021 8.3 inch WiFi 64GB', N'ipad/1.jpg', 12790000, CAST(N'2024-06-12' AS Date), 110, N'ca02', 1)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (23, N'iPad Pro 12.9 2022 M2 WiFi 1TB', N'ipad/2.jpg', 20000000, CAST(N'2023-05-18' AS Date), 150, N'ca02', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (24, N'iPad Air 5 2022 10.9 inch M1 WiFi 5G 64GB', N'ipad/3.jpg', 17690000, CAST(N'2023-05-18' AS Date), 250, N'ca02', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (25, N'iPad Air 5 2022 10.9 inch M1 WiFi 64GB', N'ipad/4.jpg', 14090000, CAST(N'2023-05-18' AS Date), 350, N'ca02', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (26, N'iPad Pro 11 inch M4 2024 Wifi + Cellular 256GB', N'ipad/5.jpg', 25000000, CAST(N'2023-05-18' AS Date), 99, N'ca02', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (27, N'iPhone 13 Tím', N'iphone/2.png', 15000000, CAST(N'2024-06-12' AS Date), 80, N'ca03', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (28, N'iPhone 13 Xanh', N'iphone/2.png', 15500000, CAST(N'2023-05-18' AS Date), 125, N'ca03', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (29, N'iPhone 14 Pro Max Vàng', N'iphone/3.png', 25400000, CAST(N'2023-05-18' AS Date), 77, N'ca03', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (30, N'iPhone 12 Xanh', N'iphone/4.png', 11000000, CAST(N'2023-05-19' AS Date), 20, N'ca03', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (31, N'iPhone 13 Đỏ', N'iphone/5.png', 13200000, CAST(N'2024-06-12' AS Date), 10, N'ca03', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (32, N'Apple Watch Ultra 2 GPS + Cellular 49mm viền Titanium Dây Alpine Loop cỡ vừa', N'watch/1.jpg', 20000000, CAST(N'2024-06-12' AS Date), 20, N'ca04', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (33, N'Apple Watch Series 9 GPS Viền nhôm Dây cao su', N'watch/2.jpg', 12020000, CAST(N'2023-05-19' AS Date), 100, N'ca04', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (34, N'Apple Watch SE 2 GPS + Cellular Viền nhôm Dây cao su', N'watch/3.jpg', 9490000, CAST(N'2023-05-19' AS Date), 150, N'ca04', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (35, N'Apple Watch SE 2 GPS Viền nhôm Dây vải', N'watch/4.jpg', 5890000, CAST(N'2023-05-19' AS Date), 200, N'ca04', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (36, N'
Apple Watch Ultra GPS + Cellular 49mm Titanium Alpine Loop Medium', N'watch/5.jpg', 17490000, CAST(N'2023-05-19' AS Date), 250, N'ca04', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (49, N'iPhone 14 Pro Max Đen', N'iphone/6.png', 23000000, CAST(N'2024-04-06' AS Date), 100, N'ca03', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (50, N'iPhone 11 Trắng', N'iphone/7.jpg', 8000000, CAST(N'2024-04-06' AS Date), 200, N'ca03', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (51, N'iPad Pro 11 inch M4 2024 Wifi 256GB', N'ipad/6.jpg', 28990000, CAST(N'2024-04-06' AS Date), 100, N'ca02', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (52, N'iPad Air 5 2022 10.9 inch M1 WiFi 64GB', N'ipad/7.jpg', 12000000, CAST(N'2024-04-06' AS Date), 200, N'ca02', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (54, N'Apple Watch SE 2 GPS, viền nhôm dây cao su', N'watch/6.jpg', 5690000, CAST(N'2024-04-06' AS Date), 100, N'ca04', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (55, N'Apple Watch SE 2 GPS + Cellular Viền nhôm Dây vải', N'watch/7.jpg', 7390000, CAST(N'2024-04-06' AS Date), 200, N'ca04', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (56, N'Apple Watch Series 9 GPS + Cellular 45mm Viền nhôm Dây vải', N'watch/8.jpg', 7290000, CAST(N'2024-04-06' AS Date), 120, N'ca04', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (57, N'Apple Watch Series 9 GPS + Cellular Viền thép Dây Milanese thép', N'watch/9.jpg', 10020000, CAST(N'2024-04-06' AS Date), 110, N'ca04', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (58, N'Apple Watch Ultra GPS + Cellular 49mm Titanium Alpine Loop Medium', N'watch/10.jpg', 17490000, CAST(N'2024-04-06' AS Date), 100, N'ca04', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (63, N'iPhone 16', N'iphone/2.png', 25000000, CAST(N'2024-06-12' AS Date), 100, N'ca03', 0)
INSERT [dbo].[Products] ([Id], [Name], [Image], [Price], [create_date], [Quantity], [category_id], [is_delete]) VALUES (92, N'iPhone 4s 8G Thời thượng', N'ipad/ip4.jpg', 300000, CAST(N'2024-06-13' AS Date), 10, N'ca03', 0)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[Orders] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Accounts] FOREIGN KEY([Username])
REFERENCES [dbo].[Accounts] ([Username])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Accounts]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
USE [master]
GO
ALTER DATABASE [DB_QLBH_Java5] SET  READ_WRITE 
GO
