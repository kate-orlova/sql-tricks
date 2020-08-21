CREATE proc [sys].[sp_MSforeachtable]
	@command1 nvarchar(2000), @replacechar nchar(1) = N'?', @command2 nvarchar(2000) = null,
   @command3 nvarchar(2000) = null, @whereand nvarchar(2000) = null,
	@precommand nvarchar(2000) = null, @postcommand nvarchar(2000) = null
as
	/* This proc returns one or more rows for each table (optionally, matching @where), with each table defaulting to its own result set */
	/* @precommand and @postcommand may be used to force a single result set via a temp table. */

	/* Preprocessor won't replace within quotes so have to use str(). */
	declare @mscat nvarchar(12)
	select @mscat = ltrim(str(convert(int, 0x0002)))

	if (@precommand is not null)
		exec(@precommand)

	/* Create the select */
   exec(N'declare hCForEachTable cursor global for select ''['' + REPLACE(schema_name(syso.schema_id), N'']'', N'']]'') + '']'' + ''.'' + ''['' + REPLACE(object_name(o.id), N'']'', N'']]'') + '']'' from dbo.sysobjects o join sys.all_objects syso on o.id = syso.object_id '
         + N' where OBJECTPROPERTY(o.id, N''IsUserTable'') = 1 ' + N' and o.category & ' + @mscat + N' = 0 '
         + @whereand)
	declare @retval int
	select @retval = @@error
	if (@retval = 0)
		exec @retval = sys.sp_MSforeach_worker @command1, @replacechar, @command2, @command3, 0

	if (@retval = 0 and @postcommand is not null)
		exec(@postcommand)

	return @retval
