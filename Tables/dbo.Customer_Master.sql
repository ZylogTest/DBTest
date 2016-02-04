CREATE TABLE [dbo].[Customer_Master]
(
[customer_id] [int] NOT NULL IDENTITY(1, 1),
[customer_name] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Customer_address] [varchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[is_active] [bit] NULL,
[Phone] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[telephone] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[fax] [varchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[website] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[special_notes] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Customer_instructions] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[created_date] [datetime] NOT NULL,
[last_modified_date] [datetime] NULL,
[created_by] [int] NOT NULL,
[last_modified_by] [int] NULL
) ON [PRIMARY]
GO
