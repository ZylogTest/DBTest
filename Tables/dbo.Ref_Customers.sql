CREATE TABLE [dbo].[Ref_Customers]
(
[CustomerId] [bigint] NOT NULL IDENTITY(1, 1),
[FirstName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address1] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address2] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailId] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsActive] [bit] NULL,
[CreatedDate] [datetime] NULL,
[CreatedBy] [bigint] NULL,
[UpdatedDate] [datetime] NULL,
[UpdatedBy] [bigint] NULL,
[RowVersions] [timestamp] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ref_Customers] ADD CONSTRAINT [PK_Ref_Customers_CustomerId] PRIMARY KEY CLUSTERED  ([CustomerId]) ON [PRIMARY]
GO
