SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE	PROCEDURE	[dbo].[aup_customer]
	(
		@pi_customer_id					int			output		,
		@pi_customer_name				varchar(100)			,
		@pi_Customer_address			varchar(500)			,
		@pi_is_active					bit						,
		@pi_Phone						varchar(15) 			,
		@pi_Email						varchar(50) 			,
		@pi_telephone					varchar(15) 			,
		@pi_fax							varchar(15) 			,
		@pi_website						varchar(100)			,	
		@pi_special_notes				varchar(250)			,
		@pi_Customer_instructions		varchar(250)			,
		@pi_last_modified_by			int						,
		@po_error_code					nvarchar(500)	output		,
		@po_severity					tinyint			output	
	)
AS


BEGIN
	set nocount on
	
	declare		@l_error_catch varchar(4000) ,@l_cod int,@l_pro_serviec_address_id bigint, @l_pro_billing_account_id bigint,@l_address_id bigint
	
	Begin try	
		
			if	exists	(	select	1 
							from	dbo.Customer_Master	with (nolock)       
							where	customer_id		=	@pi_customer_id 
						)  
	  begin  
				update	c	
				set		c.customer_name				=	@pi_customer_name			,
						c.Customer_address			=	@pi_Customer_address		,
						c.is_active					=	@pi_is_active				,
						c.Phone						=	@pi_Phone					,
						c.Email						=	@pi_Email					,
						c.telephone					=	@pi_telephone				,
						c.fax						=	@pi_fax						,
						c.website					=	@pi_website					,
						c.special_notes				=	@pi_special_notes			,
						c.Customer_instructions		=	@pi_Customer_instructions	,
						c.last_modified_date		=	GETDATE()					,
						c.last_modified_by			=	@pi_last_modified_by							
				from	dbo.customer_master c	
				where	c.customer_id	=	@pi_customer_id 
				
				if @@rowcount <> 0  
					Begin
						select  @po_error_code = 'Customer Updated successfully ',@po_severity = 0	
						return
					End
	End
	Else
	Begin
			insert 
			into	dbo.customer_master
					(
						customer_name					,
						Customer_address				,
						is_active						,
						Phone							,
						Email							,
						telephone						,
						fax								,
						website							,
						special_notes					,
						Customer_instructions			,
						created_date					,
						last_modified_date				,
						created_by						,
						last_modified_by				
					)
														
			values	
					(
						@pi_customer_name			,
						@pi_Customer_address		,
						@pi_is_active				,
						@pi_Phone					,
						@pi_Email					,
						@pi_telephone				,
						@pi_fax						,
						@pi_website					,
						@pi_special_notes			,
						@pi_Customer_instructions	,
						GETDATE()					,
						GETDATE()					,
						@pi_last_modified_by		,
						@pi_last_modified_by		
					)		
	
			select @pi_customer_id = SCOPE_IDENTITY() 
			
			if @@rowcount <> 0  
				Begin
					select  @po_error_code = 'Customer Inserted successfully'	,@po_severity = 0	
						return
				End

		End
	End Try
	
	Begin catch
		select @l_error_catch = error_message()   

		if @l_error_catch is not null  
		begin  

		if @po_error_code is null 
			Begin
				select @po_error_code = @l_error_catch, @po_severity = 1
				return
			End
		end  

	End catch  

  
END



GO
