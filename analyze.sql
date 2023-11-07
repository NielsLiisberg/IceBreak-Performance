truncate systest.perflog; 
select * from systest.perflog; 
commit;

select count(*) 
from systest.perflog; 

select count(*)  
from svcudvdb.shm00;

select count(*) 
from svcudvdb.tlog01 
where lgrmtip =  '192.168.5.42'  ;  


select count(*) 
from svcudvdb.tlog01 
where lgrmtip =  '192.168.5.42'  
and lgreq like 'GET /router/perform02%';

select max(duration) , min(duration), avg(duration) , count(*) , max(lgtrnstr) - min(lgtrnstr)
from svcudvdb.tlog01 
where lgrmtip =  '192.168.5.42'  
and lgreq like 'GET /router/perform02%';


select *
from svcudvdb.tlog01 
where lgrmtip =  '192.168.5.42'  
and lgreq like 'GET /router/perform02%';


--delete from svcudvdb.tlog00;
  
