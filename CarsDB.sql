USE [master]
GO
/****** Object:  Database [Cars]    Script Date: 18/09/2020 11:06:18 am ******/
CREATE DATABASE [Cars]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Cars', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Cars.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Cars_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Cars_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Cars] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Cars].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Cars] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Cars] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Cars] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Cars] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Cars] SET ARITHABORT OFF 
GO
ALTER DATABASE [Cars] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Cars] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Cars] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Cars] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Cars] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Cars] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Cars] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Cars] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Cars] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Cars] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Cars] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Cars] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Cars] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Cars] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Cars] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Cars] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Cars] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Cars] SET RECOVERY FULL 
GO
ALTER DATABASE [Cars] SET  MULTI_USER 
GO
ALTER DATABASE [Cars] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Cars] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Cars] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Cars] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Cars] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Cars', N'ON'
GO
ALTER DATABASE [Cars] SET QUERY_STORE = OFF
GO
USE [Cars]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 18/09/2020 11:06:21 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Car]    Script Date: 18/09/2020 11:06:22 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Car](
	[CarId] [int] IDENTITY(1,1) NOT NULL,
	[TagNumber] [nvarchar](max) NULL,
	[Make] [nvarchar](max) NULL,
	[Model] [nvarchar](max) NULL,
	[CarYear] [datetime2](7) NOT NULL,
	[IsAvailable] [bit] NOT NULL,
	[AirConditioned] [bit] NOT NULL,
	[DVDPlayer] [bit] NOT NULL,
	[AirBags] [bit] NOT NULL,
 CONSTRAINT [PK_Car] PRIMARY KEY CLUSTERED 
(
	[CarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 18/09/2020 11:06:22 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Customerid] [int] IDENTITY(1,1) NOT NULL,
	[DrvLicNumber] [int] NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Customerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentalOrder]    Script Date: 18/09/2020 11:06:22 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentalOrder](
	[RentalOrderId] [int] IDENTITY(1,1) NOT NULL,
	[DateProcessed] [datetime2](7) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[CarId] [int] NOT NULL,
	[TankLevel] [nvarchar](max) NULL,
	[MilageStart] [int] NOT NULL,
	[MilageEnd] [int] NOT NULL,
	[Days] [int] NOT NULL,
	[RentStartDate] [datetime2](7) NOT NULL,
	[RentEndDate] [datetime2](7) NOT NULL,
	[RateApplied] [float] NOT NULL,
	[OrderTotal] [float] NOT NULL,
	[OrderStatus] [nvarchar](max) NULL,
 CONSTRAINT [PK_RentalOrder] PRIMARY KEY CLUSTERED 
(
	[RentalOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RentalRate]    Script Date: 18/09/2020 11:06:22 am ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentalRate](
	[RentalRateId] [int] IDENTITY(1,1) NOT NULL,
	[DailyRate] [float] NOT NULL,
	[WeeklyRate] [float] NOT NULL,
	[MonthlyRate] [float] NOT NULL,
 CONSTRAINT [PK_RentalRate] PRIMARY KEY CLUSTERED 
(
	[RentalRateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200903073900_Start', N'3.1.7')
GO
SET IDENTITY_INSERT [dbo].[Car] ON 

INSERT [dbo].[Car] ([CarId], [TagNumber], [Make], [Model], [CarYear], [IsAvailable], [AirConditioned], [DVDPlayer], [AirBags]) VALUES (1, N'U THINK', N'Ford', N'Mustang', CAST(N'2019-05-07T00:00:00.0000000' AS DateTime2), 1, 1, 1, 1)
INSERT [dbo].[Car] ([CarId], [TagNumber], [Make], [Model], [CarYear], [IsAvailable], [AirConditioned], [DVDPlayer], [AirBags]) VALUES (2, N'KNM909', N'Toyota', N'MarkX', CAST(N'2018-08-10T00:00:00.0000000' AS DateTime2), 1, 1, 1, 1)
INSERT [dbo].[Car] ([CarId], [TagNumber], [Make], [Model], [CarYear], [IsAvailable], [AirConditioned], [DVDPlayer], [AirBags]) VALUES (3, N'HAR199', N'BMW', N'BMW', CAST(N'2016-04-07T00:00:00.0000000' AS DateTime2), 0, 1, 0, 1)
INSERT [dbo].[Car] ([CarId], [TagNumber], [Make], [Model], [CarYear], [IsAvailable], [AirConditioned], [DVDPlayer], [AirBags]) VALUES (4, N'GILL099', N'Nissan', N'Skyline', CAST(N'2020-01-06T00:00:00.0000000' AS DateTime2), 1, 1, 0, 1)
INSERT [dbo].[Car] ([CarId], [TagNumber], [Make], [Model], [CarYear], [IsAvailable], [AirConditioned], [DVDPlayer], [AirBags]) VALUES (5, N'FE3SHE', N'Audi', N'Audi', CAST(N'2017-02-28T00:00:00.0000000' AS DateTime2), 1, 0, 1, 1)
INSERT [dbo].[Car] ([CarId], [TagNumber], [Make], [Model], [CarYear], [IsAvailable], [AirConditioned], [DVDPlayer], [AirBags]) VALUES (6, N'SIDHU1', N'Hyundai', N'Veloster', CAST(N'2012-11-30T00:00:00.0000000' AS DateTime2), 1, 1, 0, 1)
SET IDENTITY_INSERT [dbo].[Car] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Customerid], [DrvLicNumber], [FullName], [Address]) VALUES (1, 1, N'Sumanpreet kaur', N'7/146 river road,hamilton east')
INSERT [dbo].[Customer] ([Customerid], [DrvLicNumber], [FullName], [Address]) VALUES (2, 2, N'Gurlike singh', N'15 ruby court,chartwell')
INSERT [dbo].[Customer] ([Customerid], [DrvLicNumber], [FullName], [Address]) VALUES (3, 3, N'Harpreet kaur', N'61 boundry road,hamilton')
INSERT [dbo].[Customer] ([Customerid], [DrvLicNumber], [FullName], [Address]) VALUES (4, 4, N'Navpreet kaur', N'61 boundry road,hamilton')
INSERT [dbo].[Customer] ([Customerid], [DrvLicNumber], [FullName], [Address]) VALUES (5, 5, N'Khushdeep singh', N'Hamilton,new zealand')
INSERT [dbo].[Customer] ([Customerid], [DrvLicNumber], [FullName], [Address]) VALUES (6, 6, N'Robindeep singh', N'Hamilton,new zealand')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[RentalOrder] ON 

INSERT [dbo].[RentalOrder] ([RentalOrderId], [DateProcessed], [CustomerId], [CarId], [TankLevel], [MilageStart], [MilageEnd], [Days], [RentStartDate], [RentEndDate], [RateApplied], [OrderTotal], [OrderStatus]) VALUES (1, CAST(N'2017-06-07T00:00:00.0000000' AS DateTime2), 1, 1, N'25', 1000, 2000, 60, CAST(N'2020-09-30T00:00:00.0000000' AS DateTime2), CAST(N'2020-12-31T00:00:00.0000000' AS DateTime2), 2500, 3000, N'Booked')
INSERT [dbo].[RentalOrder] ([RentalOrderId], [DateProcessed], [CustomerId], [CarId], [TankLevel], [MilageStart], [MilageEnd], [Days], [RentStartDate], [RentEndDate], [RateApplied], [OrderTotal], [OrderStatus]) VALUES (2, CAST(N'2020-11-04T00:00:00.0000000' AS DateTime2), 2, 2, N'30', 500, 1000, 30, CAST(N'2020-11-05T00:00:00.0000000' AS DateTime2), CAST(N'2021-01-02T00:00:00.0000000' AS DateTime2), 1700, 2000, N'Not booked')
INSERT [dbo].[RentalOrder] ([RentalOrderId], [DateProcessed], [CustomerId], [CarId], [TankLevel], [MilageStart], [MilageEnd], [Days], [RentStartDate], [RentEndDate], [RateApplied], [OrderTotal], [OrderStatus]) VALUES (3, CAST(N'2020-09-03T00:00:00.0000000' AS DateTime2), 3, 3, N'25', 1200, 1700, 40, CAST(N'2020-11-10T00:00:00.0000000' AS DateTime2), CAST(N'2020-12-20T00:00:00.0000000' AS DateTime2), 3000, 3200, N'Booked')
INSERT [dbo].[RentalOrder] ([RentalOrderId], [DateProcessed], [CustomerId], [CarId], [TankLevel], [MilageStart], [MilageEnd], [Days], [RentStartDate], [RentEndDate], [RateApplied], [OrderTotal], [OrderStatus]) VALUES (4, CAST(N'2020-09-15T00:00:00.0000000' AS DateTime2), 4, 4, N'30', 1000, 2000, 30, CAST(N'2020-11-30T00:00:00.0000000' AS DateTime2), CAST(N'2020-12-31T00:00:00.0000000' AS DateTime2), 2500, 3200, N'3500')
INSERT [dbo].[RentalOrder] ([RentalOrderId], [DateProcessed], [CustomerId], [CarId], [TankLevel], [MilageStart], [MilageEnd], [Days], [RentStartDate], [RentEndDate], [RateApplied], [OrderTotal], [OrderStatus]) VALUES (5, CAST(N'2020-09-17T00:00:00.0000000' AS DateTime2), 5, 5, N'35', 1500, 2500, 35, CAST(N'2020-11-11T00:00:00.0000000' AS DateTime2), CAST(N'2020-12-24T00:00:00.0000000' AS DateTime2), 2500, 3200, N'Not booked')
INSERT [dbo].[RentalOrder] ([RentalOrderId], [DateProcessed], [CustomerId], [CarId], [TankLevel], [MilageStart], [MilageEnd], [Days], [RentStartDate], [RentEndDate], [RateApplied], [OrderTotal], [OrderStatus]) VALUES (6, CAST(N'2020-09-25T00:00:00.0000000' AS DateTime2), 6, 6, N'30', 3000, 5000, 60, CAST(N'2020-10-01T00:00:00.0000000' AS DateTime2), CAST(N'2020-12-01T00:00:00.0000000' AS DateTime2), 3500, 4000, N'Not booked')
SET IDENTITY_INSERT [dbo].[RentalOrder] OFF
GO
SET IDENTITY_INSERT [dbo].[RentalRate] ON 

INSERT [dbo].[RentalRate] ([RentalRateId], [DailyRate], [WeeklyRate], [MonthlyRate]) VALUES (1, 300, 900, 3600)
INSERT [dbo].[RentalRate] ([RentalRateId], [DailyRate], [WeeklyRate], [MonthlyRate]) VALUES (2, 200, 550, 2000)
INSERT [dbo].[RentalRate] ([RentalRateId], [DailyRate], [WeeklyRate], [MonthlyRate]) VALUES (3, 200, 580, 2100)
INSERT [dbo].[RentalRate] ([RentalRateId], [DailyRate], [WeeklyRate], [MonthlyRate]) VALUES (4, 100, 400, 1600)
INSERT [dbo].[RentalRate] ([RentalRateId], [DailyRate], [WeeklyRate], [MonthlyRate]) VALUES (5, 220, 440, 3200)
INSERT [dbo].[RentalRate] ([RentalRateId], [DailyRate], [WeeklyRate], [MonthlyRate]) VALUES (6, 150, 350, 3000)
SET IDENTITY_INSERT [dbo].[RentalRate] OFF
GO
/****** Object:  Index [IX_RentalOrder_CarId]    Script Date: 18/09/2020 11:06:22 am ******/
CREATE NONCLUSTERED INDEX [IX_RentalOrder_CarId] ON [dbo].[RentalOrder]
(
	[CarId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RentalOrder_CustomerId]    Script Date: 18/09/2020 11:06:22 am ******/
CREATE NONCLUSTERED INDEX [IX_RentalOrder_CustomerId] ON [dbo].[RentalOrder]
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RentalOrder]  WITH CHECK ADD  CONSTRAINT [FK_RentalOrder_Car_CarId] FOREIGN KEY([CarId])
REFERENCES [dbo].[Car] ([CarId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RentalOrder] CHECK CONSTRAINT [FK_RentalOrder_Car_CarId]
GO
ALTER TABLE [dbo].[RentalOrder]  WITH CHECK ADD  CONSTRAINT [FK_RentalOrder_Customer_CustomerId] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Customerid])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RentalOrder] CHECK CONSTRAINT [FK_RentalOrder_Customer_CustomerId]
GO
USE [master]
GO
ALTER DATABASE [Cars] SET  READ_WRITE 
GO
