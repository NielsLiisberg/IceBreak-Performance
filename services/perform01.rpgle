**free
Ctl-Opt main(main) PGMINFO(*PCML:*MODULE);
// ---------------------------------------------------------------------
// Performance test 
// ---------------------------------------------------------------------
/include qsysinc/qrpglesrc,unistd 
/include qasphdr,jsonParser


dcl-f perflog                       
      extdesc('PERFLOG')            
      extfile(*extdesc)             
      usage(*output )               
      rename(PERFLOGR:perflogout);  

// ------------------------------------------------------------------------------------
// main
// ------------------------------------------------------------------------------------
dcl-proc main;

      dcl-s pResponse pointer;

      // Set JSON response:
      setContentType('application/json;charset=UTF-8');               


      // Simulate workload 0.5 sec    
      usleep (500000);                
                                    
      // write the log                
      plTime = %timestamp();          
      write perflogOut;   

      pResponse = json_successTrue (%char(plTime));

      responseWritejson (pResponse);
      json_delete (pResponse);
      
end-proc;