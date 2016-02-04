CREATE TABLE [dbo].[Person]
(
[ID] [bigint] NOT NULL IDENTITY(1, 1),
[LastName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Person] ADD CONSTRAINT [PK__Person__3214EC27182C9B23] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
