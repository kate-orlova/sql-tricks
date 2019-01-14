SELECT page_type,
       count(page_id)  as pages,
   convert(decimal(20,2),count(page_id)*8192.0/1048576) as Mb
from sys.dm_os_buffer_descriptors
group by page_type
order by convert(decimal(20,2),count(page_id)*8192.0/1048576) desc