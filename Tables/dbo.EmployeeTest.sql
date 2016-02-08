CREATE TABLE [dbo].[EmployeeTest]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[Name] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Address] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EmailId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
