SET transaction isolation level READ uncommitted
SELECT
    top 100
    creation_time,
    last_execution_time,
    execution_count,
    total_worker_time/1000 AS CPU,
    convert(money, (total_worker_time))/(execution_count*1000)AS [AvgCPUTime],
    qs.total_elapsed_time/1000 AS TotDuration,
    convert(money, (qs.total_elapsed_time))/(execution_count*1000)AS [AvgDur],
    total_logical_reads AS [Reads],
    total_logical_writes AS [Writes],
    total_logical_reads+total_logical_writes AS [AggIO],
    convert(money, (total_logical_reads+total_logical_writes)/(execution_count + 0.0))AS [AvgIO],
    case
        when sql_handle IS NULL then ' '
        else(substring(st.text,(qs.statement_start_offset+2)/2,(
            case
                when qs.statement_end_offset =-1 then len(convert(nvarchar(MAX),st.text))*2     
                else qs.statement_end_offset   
            end - qs.statement_start_offset)/2  ))
    end AS query_text,
    db_name(st.dbid)AS database_name,
    object_schema_name(st.objectid, st.dbid)+'.'+object_name(st.objectid, st.dbid) AS object_name
FROM sys.dm_exec_query_stats  qs
CROSS apply sys.dm_exec_sql_text(sql_handle) st
WHERE total_logical_reads > 0
ORDER BY AvgDur DESC