USE [Learning]
GO

/****** Object:  Table [dbo].[Users]    Script Date: 22-06-2024 16:24:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE TABLE [dbo].[User](
	[ID] [bigint]  Identity(1,1) Primary key ,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[GenderID] [INT] NULL,
	[Phone] [nvarchar](250) NULL,
	[DOB] [Date] NULL,
	[SSN] [nvarchar](500) NULL,
	[AADHARNumber] [nvarchar](500) NULL,
	[CountryID] [INT] NULL,
	[StateID] [INT] NULL,
	[CityID] [INT] NULL,
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Country](
	[ID] [bigint]  Identity(1,1) Primary key ,
	[Name] [nvarchar](50) NULL,
	
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[State](
	[ID] [bigint]  Identity(1,1) Primary key ,
	[Name] [nvarchar](50) NULL,
	[CountryID] [bigint]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[City](
	[ID] [bigint]  Identity(1,1) Primary key ,
	[Name] [nvarchar](50) NULL,
	[StateID] [bigint]
) ON [PRIMARY]
GO

