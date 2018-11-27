exec sp_MSforeachtable @command1="DBCC DBREINDEX ('?', '', 80)"
Go