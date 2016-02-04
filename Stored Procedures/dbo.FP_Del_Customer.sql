SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE	PROCEDURE	[dbo].[FP_Del_Customer]	
(
	@pi_customer_id                             int                   ,
	@pi_last_modified_by						int						,
	@po_error_code                              nvarchar(500)         OUTPUT, 
	@po_severity                                tinyint               OUTPUT
)
AS
BEGIN
	

	set nocount on

	/*     Declaration of local variables  */
	declare        @l_sp_name           varchar(128)
	declare			@l_error_catch      varchar(8000),
					@l_is_debug            bit

	select     @po_error_code     = null,
	           @po_severity       = null
	set            @l_is_debug            =    0

	
	BEGIN TRY
		IF	EXISTS
		(
			SELECT 1 
			FROM Customer_Master(nolock) 
			WHERE	customer_id	=	@pi_customer_id	
		)
		BEGIN

			DELETE	FROM	Customer_Master    
			WHERE
			customer_id   =	@pi_customer_id                         	

				select  @po_error_code  =   'Customer information deleted successfully'  ,@po_severity = 0	
						return  
		END
	END TRY

	/*Error Handling Part*/
	begin catch
		select @l_error_catch = error_message()
		set @l_sp_name = object_name(@@procid)
		print @l_error_catch
		if @l_error_catch is not null
		begin
			select @po_error_code = @l_error_catch, @po_severity = 1
			RETURN
		end
	end catch

END

GO
