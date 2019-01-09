use master
GO
 
alter database [DatabaseName] set single_user with rollback immediate
GO
RESTORE DATABASE [DatabaseName] FROM  DISK = N'd:\SQL-BACKUPS\DatabaseName.bak' WITH  FILE = 1,  NOUNLOAD,  REPLACE,  STATS = 10
GO
alter database [DatabaseName] set multi_user
GO