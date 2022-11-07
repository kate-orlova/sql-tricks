SELECT a.index_id, name, avg_fragmentation_in_percent, fill_factor, *
FROM sys.dm_db_index_physical_stats (DB_ID(N'Your_DB_Name'),NULL, NULL, NULL, NULL) AS a
JOIN sys.indexes AS b
ON a.object_id = b.object_id AND a.index_id = b.index_id;
GO