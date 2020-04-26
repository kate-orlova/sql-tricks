SELECT Id, [Name],
 JSON_VALUE(jsonContent,'$.address[0].city') AS City
FROM dbo.Stores
WHERE JSON_VALUE(jsonContent,'$.address[0].county') LIKE '%yorkshire%'
ORDER BY JSON_VALUE(jsonContent,'$.address[0].city')