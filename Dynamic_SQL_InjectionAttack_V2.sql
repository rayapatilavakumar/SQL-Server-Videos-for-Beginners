
/*

USP_GetUserswithoutSQLInjection_V2 N'lastname',N'%mi%'

select * from dbo.[user]

*/

Create OR Alter procedure USP_GetUserswithoutSQLInjection_V2
@FilterColumnName NVARCHAR(50),
@FilterValue  NVARCHAR(100)
as
begin

Declare @DynamicQuery NVARCHAR(MAX);
DECLARE @ParmDefinition NVARCHAR(500);

SET @ParmDefinition = N'@FilterParameter NVARCHAR(100)';

SET @DynamicQuery =N'SELECT * FROM [dbo].[user] where '+QUOTENAME(@FilterColumnName) +'like @FilterParameter';


EXECUTE sp_executesql @DynamicQuery,
    @ParmDefinition,
    @FilterParameter = @FilterValue;
END