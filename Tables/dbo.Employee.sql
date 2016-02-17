CREATE TABLE [dbo].[Employee]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[EmpName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EmpAddress] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EmpEmailId] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
