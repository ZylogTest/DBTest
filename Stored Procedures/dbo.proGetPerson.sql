SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

create proc [dbo].[proGetPerson]
as
begin
select * from person
end
GO
