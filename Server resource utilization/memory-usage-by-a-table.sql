SELECT  DB_NAME(database_id),
        COUNT (*) * 8 / 1024 AS MBUsed
FROM    sys.dm_os_buffer_descriptors
GROUP BY    database_id
ORDER BY    COUNT (*) * 8 / 1024 DESC