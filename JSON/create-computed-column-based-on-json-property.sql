CREATE TABLE dbo.Stores
 (
  Id INT IDENTITY(1,1) NOT NULL,
  [Name] NVARCHAR(100),
  jsonContent NVARCHAR(4000),
  Longitude AS JSON_VALUE(jsonContent, '$.address[0].longitude'),
  Latitude AS JSON_VALUE(jsonContent, '$.address[0].latitude')
 )