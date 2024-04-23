set lines 200 pages 200
select tablespace_name,file_name,bytes/1024/1024 MB,maxbytes/1024/1024 MAX_MB from dba_data_files where tablespace_name = upper('&TBS') and file_name like '/oracle/HCP/sapdata2%' order by 2;
select 'alter tablespace '||upper('&TBS')||' add datafile ' || chr(39) ||
(select file_name from (select file_name from dba_data_files where tablespace_name = upper('&TBS') and file_name like '/oracle/HCP/sapdata2%' order by 1 DESC) where rownum =1) || chr(39)
|| ' size 32767M;'
from dual;
