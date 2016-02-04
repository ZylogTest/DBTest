SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE proc [dbo].[ProCreatePerson]
@Lastname varchar(50),
@Firstname varchar(50),
@Address varchar(50),
@City varchar(50)
as
begin
 insert into person
 (
 Lastname,
 Firstname,
 Address,
 City
 )
 values(
 
 @Lastname,
 @Firstname,
 @Address,
 @City
 )
end
GO
