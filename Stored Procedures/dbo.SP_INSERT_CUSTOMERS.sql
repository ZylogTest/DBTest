SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
/*	=============================================
	Author:	Raja S
	Create date: 11-11-2014
	Description:	Insert New Customer
	

	Execution: Exec INSERT_NEW_CUSTOMERS 'Raghavan','V','Test Address1','Test Address2','Chennai','raghavanv@gmail.com',1,1,@result = 0
	=============================================*/
CREATE PROCEDURE [dbo].[SP_INSERT_CUSTOMERS]
	@FirstName varchar(50),
	@LastName varchar(50),
	@Address1 varchar(100),
	@Address2 varchar(100),
	@City varchar(100),
	@EmailId varchar(100) ,
	@IsActive bit,
	@CreatedBy bigint,
	@result int output
AS
BEGIN
	
	SET NOCOUNT ON;
	
	if exists(select 1 from Ref_Customers where EmailId=@EmailId )
	begin
		set @result = 1 -- Duplicate Email ID
		select @result
	end
	else
	begin
		INSERT INTO [dbo].[Ref_Customers]
			   ( [FirstName]
				,[LastName]
				,[Address1] 
				,[Address2]
				,[City]
				,[EmailId]
				,[IsActive]
				,[CreatedDate]
				,[CreatedBy]
			   )
		 VALUES
			   ( @FirstName
				,@LastName 
				,@Address1 
				,@Address2 
				,@City 
				,@EmailId  
				,@IsActive 
				,GETDATE()
				,@CreatedBy
			   )		
		set @result = 0 -- Success 
		select @result
	end
END




GO
