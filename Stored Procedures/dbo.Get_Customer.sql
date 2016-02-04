SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE	PROCEDURE	[dbo].[Get_Customer]
    (  
		@pi_customer_id						int			=	-1	,   
		@pi_record_per_page					int = null,        
		@pi_page_no							int = null,        
		@pi_sorting_column					nvarchar(100) = null,        
		@pi_sorting_order					nvarchar(50)  = null,       
		@pi_all_records						bit = 0  ,      
		@pi_last_modified_by				int						
	)  
as  

begin  
      set nocount on  
      
        select	@pi_record_per_page = isnull(@pi_record_per_page,100),    
		@pi_page_no					= isnull(@pi_page_no,1),    
		@pi_sorting_column			= isnull(@pi_sorting_column,'Customer_Name'),      
		@pi_sorting_order			= isnull(@pi_sorting_order,'asc') ,    
		@pi_all_records				= isnull(@pi_all_records,0)    
	
		declare	@l_start_id bigint, @l_end_id bigint, @l_count bigint,@l_str0 nvarchar(max),     
				@l_str1 nvarchar(max), @l_str2 nvarchar(max), @l_str3 nvarchar(max), @l_str4 nvarchar(max)    
	     
		select	@l_start_id = (@pi_page_no * @pi_record_per_page)-@pi_record_per_page,    
				@l_end_id = (@pi_page_no * @pi_record_per_page)    
		
		if @pi_customer_id > 0
		Begin
			select customer_id			,
				   customer_name		,
				   Customer_address		,
				   is_active			,	
				   Phone				,	
				   Email				,	
				   telephone			,	
				   fax					,	
				   website				,	
				   special_notes		,	
				   Customer_instructions
			from	customer_master
			where	customer_id = @pi_customer_id 			
		End
		Else
		Begin
		select @l_str1 = ' select	customer_id				,	
									customer_name			,
									Customer_address		,
									is_active				,
									Phone					,
									Email					,
									telephone				,
									fax						,
									website					,
									special_notes			,
									Customer_instructions									
							from	'
							
			select @l_str3 =  ' where a.sl_no >= '+cast(@l_start_id as varchar)+' and a.sl_no <= '+cast(@l_end_id as varchar)    
			
			select		customer_id				,	
						customer_name			,
						Customer_address		,
						is_active				,
						Phone					,
						Email					,
						telephone				,
						fax						,
						website					,
						special_notes			,
						Customer_instructions		
			into		#Customer_Master
			from		Customer_Master		a
			where		is_active = case when @pi_customer_id = 0 then 1 else is_active end
			order by	customer_name 
		
			select @l_str2 = '(    
				select top '+cast(@l_end_id as varchar)+' row_number() over(order by '+isnull(cast(@pi_sorting_column as varchar),'Customer_Name')
				+' '+isnull(@pi_sorting_order,'asc')+') as sl_no, 
											customer_id				,	
											customer_name			,
											Customer_address		,
											is_active				,
											Phone					,
											Email					,
											telephone				,
											fax						,
											website					,
											special_notes			,
											Customer_instructions		
				from		#Customer_Master
					order by '+isnull(cast(@pi_sorting_column as varchar),'Customer_Name')
							+' '+isnull(cast(@pi_sorting_order as varchar),'asc')+')a ' 
							
				
					select @l_str0 = '	select count(1)    
								from #Customer_Master '     	
			
			
			
			select @l_str4 = '	select	customer_id				,	
										customer_name			,
										Customer_address		,
										is_active				,
										Phone					,
										Email					,
										telephone				,
										fax						,
										website					,
										special_notes			,
										Customer_instructions		
					from #Customer_Master
					order by '+isnull(cast(@pi_sorting_column as varchar),'Customer_Name')
							+' '+isnull(cast(@pi_sorting_order as varchar),'asc') 		



 if (isnull(@pi_all_records,0)) = 0    
		 begin    
			  exec (@l_str1+@l_str2+@l_str3)    
			  exec (@l_str0)    
		 end    
	 else    
		 begin    
			  exec (@l_str1+@l_str2+@l_str3)    
			  exec (@l_str0)    
			  exec (@l_str4)        
		 end          
    End     
End    

GO
