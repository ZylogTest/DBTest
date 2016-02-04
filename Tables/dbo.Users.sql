CREATE TABLE [dbo].[Users]
(
[ID] [bigint] NOT NULL IDENTITY(1, 1),
[UserName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Email] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Password] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AddedDate] [datetime] NOT NULL,
[ModifiedDate] [datetime] NOT NULL,
[IP] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
