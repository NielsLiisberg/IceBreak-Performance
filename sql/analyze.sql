truncate iceperf.perflog; 
select * from iceperf.perflog; 
commit;

select count(*) 
from iceperf.perflog; 

select *
from icebreak.tlog01
order by 2 desc; 


select count(*) 
from icebreak.tlog01 
where lgrmtip =  '127.0.0.1'  ;  


select * 
from icebreak.tlog01 
where lgrmtip =  '127.0.0.1';  
and lgreq like 'GET /router/perform02%';

select 
    max(duration) max_time , 
    min(duration) min_time , 
    avg(duration) avg_time, 
    count(*) total_transactions, 
    max(lgtrnstr) - min(lgtrnstr) span_seconds
from icebreak.tlog01 
where lgrmtip =  '127.0.0.1'  
and lgreq like 'GET /router/perform02%';


select *
from icebreak.tlog01 
where lgrmtip =  '127.0.0.1'  
and lgreq like 'GET /router/perform02%';


delete from icebreak.tlog00;
  
