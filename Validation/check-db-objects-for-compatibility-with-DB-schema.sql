DECLARE @name nvarchar(1000)
DECLARE @query nvarchar(2000)
DECLARE @result int
 
DECLARE objectCursor CURSOR FAST_FORWARD FOR
SELECT QUOTENAME(SCHEMA_NAME(o.schema_id)) + '.' + QUOTENAME(OBJECT_NAME(o.object_id))
FROM sys.objects o
WHERE
	type_desc IN ('SQL_STORED_PROCEDURE','VIEW','SQL_TRIGGER','SQL_SCALAR_FUNCTION','SQL_TABLE_VALUED_FUNCTION','SQL_INLINE_TABLE_VALUED_FUNCTION','INTERNAL_TABLE','USER_TABLE')
    AND ISNULL(OBJECTPROPERTY(o.object_id, 'IsSchemaBound'), 0) = 0
 
OPEN objectCursor
 
FETCH NEXT FROM objectCursor INTO @name
 
WHILE @@FETCH_STATUS = 0
BEGIN
    SET @query = N'EXEC sp_refreshsqlmodule ''' + @name + ''''
 
    BEGIN TRY
        EXEC @result = sp_executesql @query;
        IF @result <> 0 RAISERROR('Failed', 16, 1)
    END TRY
    
	BEGIN CATCH
        PRINT 'Object ''' + @name + ''' is not compatible'
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION
    END CATCH
 
    FETCH NEXT FROM objectCursor INTO @name
END
 
CLOSE objectCursor
DEALLOCATE objectCursor