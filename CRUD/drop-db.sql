USE [master]
GO
 
ALTER DATABASE [Your_DB_name] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
DROP DATABASE [Your_DB_name]
GO