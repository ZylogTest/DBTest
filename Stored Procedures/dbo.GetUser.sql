SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[GetUser]  
(  
       @P_UserName varchar(50),   
       @P_Password varchar(50)  
)  
as  
 
  
BEGIN  
  
  SET NOCOUNT ON  
  SET TRANSACTION ISOLATION LEVEL READ COMMITTED  
  
  IF not exists (SELECT 1 FROM Ref_Users au WHERE au.UserName = @P_UserName)  
   BEGIN   
    SELECT 'S1014' AS ErrorCode   ----> Invalid User Name  
    RETURN  
   END  
  
  IF not exists ( SELECT au.UserId FROM Ref_Users au  
      WHERE au.password = @P_Password)  
  BEGIN  
    SELECT 'S1015' AS ErrorCode   ----> Invalid Password  
    RETURN  
  END  
  ELSE
  BEGIN  
    SELECT 'S1001' AS ErrorCode   ----> Login Sucess
    RETURN  
  END  
    
   
END
GO
