create or replace table iceperf.perflog ( 
	pltime timestamp not null default current_timestamp , 
	pltext char(128) ccsid 277 not null default '' 
)   
rcdfmt perflogr   ; 
  
label on table iceperf.perflog 
	is 'Performance log' ; 
  
label on column iceperf.perflog ( 
    pltime is 'Log                 Timestamp' , 
	pltext is 'Log                 Text' 
) ; 
  
label on column iceperf.perflog ( 
    pltime text is 'Log Timestamp' , 
	pltext text is 'Log Text' 
) ; 
  
GRANT DELETE , INSERT , SELECT , UPDATE   
ON iceperf.PERFLOG TO PUBLIC ; 
  
GRANT ALTER , DELETE , INDEX , INSERT , REFERENCES , SELECT , UPDATE   
ON iceperf.PERFLOG TO QPGMR WITH GRANT OPTION ; 

SELECT * from iceperf.perflog;
  
