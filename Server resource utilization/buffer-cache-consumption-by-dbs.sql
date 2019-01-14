SELECT db_name(database_id) as dbname,
       count(page_id)  as pages,
   convert(decimal(20,2),count(page_id)*8192.0/1048576) as Mb
from sys.dm_os_buffer_descriptors
group by database_id
order by convert(decimal(20,2),count(page_id)*8192.0/1048576) desc