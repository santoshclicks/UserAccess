USE [master]
GO
/****** Object:  Database [UserAcess]    Script Date: 6/8/2018 4:21:30 PM ******/
CREATE DATABASE [UserAcess]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UserAcess', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\UserAcess.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'UserAcess_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\UserAcess_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [UserAcess] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UserAcess].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UserAcess] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UserAcess] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UserAcess] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UserAcess] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UserAcess] SET ARITHABORT OFF 
GO
ALTER DATABASE [UserAcess] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UserAcess] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UserAcess] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UserAcess] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UserAcess] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UserAcess] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UserAcess] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UserAcess] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UserAcess] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UserAcess] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UserAcess] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UserAcess] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UserAcess] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UserAcess] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UserAcess] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UserAcess] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UserAcess] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UserAcess] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UserAcess] SET  MULTI_USER 
GO
ALTER DATABASE [UserAcess] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UserAcess] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UserAcess] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UserAcess] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [UserAcess] SET DELAYED_DURABILITY = DISABLED 
GO
USE [UserAcess]
GO
/****** Object:  Table [dbo].[Group]    Script Date: 6/8/2018 4:21:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Group](
	[GroupId] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Login]    Script Date: 6/8/2018 4:21:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Login](
	[LoginId] [int] IDENTITY(1,1) NOT NULL,
	[LoginName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[UserType] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[LoginId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/8/2018 4:21:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RoleGroupMapping]    Script Date: 6/8/2018 4:21:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleGroupMapping](
	[RoleGroupId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_RoleGroupMapping] PRIMARY KEY CLUSTERED 
(
	[RoleGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 6/8/2018 4:21:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
	[LoginName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[UserType] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

GO
INSERT INTO [dbo].[User] ([UserName],[CreatedDate],[ModifiedDate],[LoginName],[Password],[UserType]) VALUES ('Niranjan','2018-06-07 16:44:02.337','2018-06-07 16:44:02.337','Niranjan','123','Admin')
GO
/****** Object:  Table [dbo].[UserRoleGroupMapping]    Script Date: 6/8/2018 4:21:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoleGroupMapping](
	[UserRoleGroupId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_UserRoleGroupMapping] PRIMARY KEY CLUSTERED 
(
	[UserRoleGroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[RoleGroupMapping] ADD  CONSTRAINT [DF_ISActive]  DEFAULT (N'false') FOR [IsActive]
GO
ALTER TABLE [dbo].[Role]  WITH CHECK ADD  CONSTRAINT [FK_Role_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[Role] CHECK CONSTRAINT [FK_Role_Role]
GO
ALTER TABLE [dbo].[RoleGroupMapping]  WITH CHECK ADD  CONSTRAINT [FK_RoleGroupMapping_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[RoleGroupMapping] CHECK CONSTRAINT [FK_RoleGroupMapping_Role]
GO
ALTER TABLE [dbo].[RoleGroupMapping]  WITH CHECK ADD  CONSTRAINT [FK_RoleGroupMapping_RoleGroupMapping] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([GroupId])
GO
ALTER TABLE [dbo].[RoleGroupMapping] CHECK CONSTRAINT [FK_RoleGroupMapping_RoleGroupMapping]
GO
ALTER TABLE [dbo].[UserRoleGroupMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserRoleGroupMapping_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Group] ([GroupId])
GO
ALTER TABLE [dbo].[UserRoleGroupMapping] CHECK CONSTRAINT [FK_UserRoleGroupMapping_Group]
GO
ALTER TABLE [dbo].[UserRoleGroupMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserRoleGroupMapping_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[UserRoleGroupMapping] CHECK CONSTRAINT [FK_UserRoleGroupMapping_Role]
GO
ALTER TABLE [dbo].[UserRoleGroupMapping]  WITH CHECK ADD  CONSTRAINT [FK_UserRoleGroupMapping_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserRoleGroupMapping] CHECK CONSTRAINT [FK_UserRoleGroupMapping_User]
GO
USE [master]
GO
ALTER DATABASE [UserAcess] SET  READ_WRITE 
GO
