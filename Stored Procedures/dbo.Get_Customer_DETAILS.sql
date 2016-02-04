SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE	PROCEDURE	[dbo].[Get_Customer_DETAILS]
AS
 begin  
      set nocount on  
      
      select * from Ref_Customers
       
End    

GO
