CREATE TABLE [dbo].[Ref_Users]
(
[UserId] [bigint] NOT NULL IDENTITY(1, 1),
[UserName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FirstName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Password] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RoleId] [tinyint] NULL,
[OrgId] [int] NULL,
[IsActive] [bit] NULL,
[CreatedDate] [datetime] NULL,
[CreatedBy] [bigint] NULL,
[UpdatedDate] [datetime] NULL,
[UpdatedBy] [bigint] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ref_Users] ADD CONSTRAINT [PK_Ref_Users_UserId] PRIMARY KEY CLUSTERED  ([UserId]) ON [PRIMARY]
GO
