CREATE TABLE [dbo].[UserProfiles]
(
[ID] [bigint] NOT NULL,
[FirstName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LastName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address] [nvarchar] (128) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddedDate] [datetime] NOT NULL,
[ModifiedDate] [datetime] NOT NULL,
[IP] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserProfiles] ADD CONSTRAINT [PK_dbo.UserProfiles] PRIMARY KEY CLUSTERED  ([ID]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ID] ON [dbo].[UserProfiles] ([ID]) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserProfiles] ADD CONSTRAINT [FK_dbo.UserProfiles_dbo.Users_ID] FOREIGN KEY ([ID]) REFERENCES [dbo].[Users] ([ID])
GO
