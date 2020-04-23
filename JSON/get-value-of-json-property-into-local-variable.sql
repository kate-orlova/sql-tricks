DECLARE @jsonSettings NVARCHAR(MAX)
DECLARE @colour NVARCHAR(32)

SET @jsonSettings=N'{"settings":{"colours":[{"colour":"red"},{"colour":"amber"},{"colour":"green"}]}}';

SET @colour=JSON_VALUE(@jsonSettings,'$.settings.colours[2].colour');