**free
ctl-opt copyright('Company');
ctl-opt decEdit('0,') datEdit(*YMD.);
ctl-opt BndDir('QC2LE');
ctl-opt main(main); 
/include qasphdr,posix

// ------------------------------------------------------------------------------------
// Main entry procedure
// ------------------------------------------------------------------------------------
dcl-proc main;
    dcl-s timer int(10:0); 
    timer = reqNum ('timer': 1);
    responseWriteNl(%char(%timestamp()));
    sleep(timer);
    responseWriteNl(%char(%timestamp()));
end-proc;
