ALTER TABLE [DatabaseName].[dbo].[LocationsTableName]
ADD LocationGeography
AS GEOGRAPHY::STGeomFromText('POINT('+convert(varchar(20),Longitude)+' '+convert(varchar(20),Latitude)+')',4326)
GO