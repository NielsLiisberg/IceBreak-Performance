<%@ language="RPGLE" free="true" pgmtype="srvpgm" pgmopt="export(*ALL)" %><%
ctl-opt copyright('Sitemule.com  (C), 2023');
ctl-opt debug(*yes) nomain;
// -----------------------------------------------------------------------------
// Performance test ctl-opt debug(*yes) nomain PGMINFO(*PCML:*MODULE);
// -----------------------------------------------------------------------------
/include qsysinc/qrpglesrc,unistd 
/include qrpgleref,jsonparser

dcl-f perflog                       
      extdesc('PERFLOG')            
      extfile(*extdesc)             
      usage(*output )               
      rename(PERFLOGR:perflogout);  

// -----------------------------------------------------------------------------
// Simple JSON I/O returning a resultset
// curl -X POST 'http://MY_IBM_I:60800/router/perform02/performance' -d '{"sleeper":10,"echo":"abc"}' -k
// ----------------------------------------------------------------------------- 
dcl-proc performance export;

    dcl-pi *n pointer;
        pInput pointer value;
    end-pi;

    dcl-s pOutput pointer;
    dcl-s sleeper int(10);
    dcl-s echo    varchar(256);

    // Simulate workload in microseconds    
    sleeper = json_getint ( pInput: 'sleeper');
    if sleeper > 0;
        usleep (sleeper);   
    endif;       

    echo = json_getstr ( pInput: 'echo');

    // write the log                
    plTime = %timestamp();          
    write perflogOut;   

    pOutput = json_newObject();
    json_setBool(pOutput: 'success': *ON);
    json_setStr (pOutput: 'echo': echo);
    json_setInt (pOutput: 'sleeper': sleeper);

    return pOutput;


end-proc;

 


