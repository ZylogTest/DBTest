use Sample
CREATE TABLE [dbo].[EmpSample](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[EmpName] [varchar](50) NOT NULL,
	[EmpAddress] [varchar](50) NOT NULL,
	[EmpEmailId] [varchar](50) NOT NULL
) ON [PRIMARY]

GO

--drop table EmpSample