USE [master]
GO
/****** Object:  Database [PC_SB_MODUL2]    Script Date: 21/10/2020 12:55:32 ******/
CREATE DATABASE [PC_SB_MODUL2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PC_SB_MODUL2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PC_SB_MODUL2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PC_SB_MODUL2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\PC_SB_MODUL2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [PC_SB_MODUL2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PC_SB_MODUL2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PC_SB_MODUL2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PC_SB_MODUL2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PC_SB_MODUL2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PC_SB_MODUL2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PC_SB_MODUL2] SET ARITHABORT OFF 
GO
ALTER DATABASE [PC_SB_MODUL2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PC_SB_MODUL2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PC_SB_MODUL2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PC_SB_MODUL2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PC_SB_MODUL2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PC_SB_MODUL2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PC_SB_MODUL2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PC_SB_MODUL2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PC_SB_MODUL2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PC_SB_MODUL2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PC_SB_MODUL2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PC_SB_MODUL2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PC_SB_MODUL2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PC_SB_MODUL2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PC_SB_MODUL2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PC_SB_MODUL2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PC_SB_MODUL2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PC_SB_MODUL2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PC_SB_MODUL2] SET  MULTI_USER 
GO
ALTER DATABASE [PC_SB_MODUL2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PC_SB_MODUL2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PC_SB_MODUL2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PC_SB_MODUL2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PC_SB_MODUL2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PC_SB_MODUL2] SET QUERY_STORE = OFF
GO
USE [PC_SB_MODUL2]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 21/10/2020 12:55:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Email] [varchar](50) NULL,
	[Address] [varchar](200) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[DateofBirth] [date] NOT NULL,
	[IdJob] [int] NOT NULL,
	[Salary] [money] NOT NULL,
 CONSTRAINT [PK_Employee$] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Job]    Script Date: 21/10/2020 12:55:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Job$] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Employee_Job]    Script Date: 21/10/2020 12:55:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Employee_Job]
AS
SELECT        dbo.Employee.*, dbo.Job.Name AS JobTitle
FROM            dbo.Employee INNER JOIN
                         dbo.Job ON dbo.Employee.IdJob = dbo.Job.Id
GO
/****** Object:  Table [dbo].[Package]    Script Date: 21/10/2020 12:55:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Package](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdService] [int] NOT NULL,
	[TotalUnit] [int] NOT NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_Package$] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 21/10/2020 12:55:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[IdCategory] [int] NOT NULL,
	[IdUnit] [int] NOT NULL,
	[PriceUnit] [int] NOT NULL,
	[EstimationDuration] [int] NOT NULL,
 CONSTRAINT [PK_Service$] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_Pacakge_Service]    Script Date: 21/10/2020 12:55:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Pacakge_Service]
AS
SELECT        dbo.Package.Id, dbo.Package.TotalUnit, dbo.Package.Price, dbo.Service.Name
FROM            dbo.Package INNER JOIN
                         dbo.Service ON dbo.Package.IdService = dbo.Service.Id
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 21/10/2020 12:55:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[Address] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Customer$] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrepaidPackage]    Script Date: 21/10/2020 12:55:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrepaidPackage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCustomer] [int] NOT NULL,
	[IdPackage] [int] NOT NULL,
	[Price] [int] NOT NULL,
	[StartDatetime] [datetime] NOT NULL,
	[CompletedDatetime] [datetime] NULL,
 CONSTRAINT [PK_PrepaidPackage$] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_PrepaidPackage]    Script Date: 21/10/2020 12:55:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_PrepaidPackage]
AS
SELECT        dbo.PrepaidPackage.Id AS [Prepaid Package Id], dbo.Customer.Name AS CustomerName, dbo.Service.Name AS PackageName, dbo.PrepaidPackage.Price
FROM            dbo.Customer INNER JOIN
                         dbo.Package ON dbo.Customer.Id = dbo.Package.Id INNER JOIN
                         dbo.PrepaidPackage ON dbo.Customer.Id = dbo.PrepaidPackage.IdCustomer AND dbo.Package.Id = dbo.PrepaidPackage.IdPackage INNER JOIN
                         dbo.Service ON dbo.Package.IdService = dbo.Service.Id
GO
/****** Object:  Table [dbo].[Category]    Script Date: 21/10/2020 12:55:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Category$] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetailDeposit]    Script Date: 21/10/2020 12:55:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetailDeposit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdDeposit] [int] NOT NULL,
	[IdService] [int] NOT NULL,
	[IdPrepaidPackage] [int] NULL,
	[PriceUnit] [int] NOT NULL,
	[TotalUnit] [float] NOT NULL,
	[CompletedDatetime] [datetime] NULL,
 CONSTRAINT [PK_DetailDeposit$] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HeaderDeposit]    Script Date: 21/10/2020 12:55:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HeaderDeposit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCustomer] [int] NOT NULL,
	[IdEmployee] [int] NOT NULL,
	[TransactionDatetime] [datetime] NOT NULL,
	[CompleteEstimationDatetime] [datetime] NULL,
 CONSTRAINT [PK_HeaderDeposit$] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 21/10/2020 12:55:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DetailDeposit]  WITH CHECK ADD  CONSTRAINT [FK_DetailDeposit_PrepaidPackage] FOREIGN KEY([IdPrepaidPackage])
REFERENCES [dbo].[PrepaidPackage] ([Id])
GO
ALTER TABLE [dbo].[DetailDeposit] CHECK CONSTRAINT [FK_DetailDeposit_PrepaidPackage]
GO
ALTER TABLE [dbo].[DetailDeposit]  WITH CHECK ADD  CONSTRAINT [FK_DetailDeposit_Service] FOREIGN KEY([IdService])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [dbo].[DetailDeposit] CHECK CONSTRAINT [FK_DetailDeposit_Service]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Job] FOREIGN KEY([IdJob])
REFERENCES [dbo].[Job] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Job]
GO
ALTER TABLE [dbo].[HeaderDeposit]  WITH CHECK ADD  CONSTRAINT [FK_HeaderDeposit_Customer] FOREIGN KEY([IdCustomer])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[HeaderDeposit] CHECK CONSTRAINT [FK_HeaderDeposit_Customer]
GO
ALTER TABLE [dbo].[HeaderDeposit]  WITH CHECK ADD  CONSTRAINT [FK_HeaderDeposit_Employee] FOREIGN KEY([IdEmployee])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[HeaderDeposit] CHECK CONSTRAINT [FK_HeaderDeposit_Employee]
GO
ALTER TABLE [dbo].[Package]  WITH CHECK ADD  CONSTRAINT [FK_Package_Service] FOREIGN KEY([IdService])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [dbo].[Package] CHECK CONSTRAINT [FK_Package_Service]
GO
ALTER TABLE [dbo].[PrepaidPackage]  WITH CHECK ADD  CONSTRAINT [FK_PrepaidPackage_Customer] FOREIGN KEY([IdCustomer])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[PrepaidPackage] CHECK CONSTRAINT [FK_PrepaidPackage_Customer]
GO
ALTER TABLE [dbo].[PrepaidPackage]  WITH CHECK ADD  CONSTRAINT [FK_PrepaidPackage_Package] FOREIGN KEY([IdPackage])
REFERENCES [dbo].[Package] ([Id])
GO
ALTER TABLE [dbo].[PrepaidPackage] CHECK CONSTRAINT [FK_PrepaidPackage_Package]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Category] FOREIGN KEY([IdCategory])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Category]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Employee"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Job"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 102
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Employee_Job'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Employee_Job'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Package"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Service"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 437
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Pacakge_Service'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Pacakge_Service'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Customer"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Package"
            Begin Extent = 
               Top = 159
               Left = 259
               Bottom = 289
               Right = 429
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PrepaidPackage"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 650
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Service"
            Begin Extent = 
               Top = 6
               Left = 688
               Bottom = 136
               Right = 879
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_PrepaidPackage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_PrepaidPackage'
GO
USE [master]
GO
ALTER DATABASE [PC_SB_MODUL2] SET  READ_WRITE 
GO
