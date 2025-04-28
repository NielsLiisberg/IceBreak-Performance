**free
Ctl-Opt nomain PGMINFO(*PCML:*MODULE);
// Program to convert temperature from Fahrenheit to Celsius
// This program is called by the IWS HTTP server - 
// to compare perfoamce with IceBreak 
// compile:
// CRTRPGMOD MODULE(ICEPERF/CNVRTTMP) SRCSTMF('/www/icebreak-performance/services/cnvrttmp.rpgle') 
// CRTSRVPGM SRVPGM(ICEPERF/CNVRTTMP) MODULE(ICEPERF/CNVRTTMP) EXPORT(*ALL)

// To use this program, you need to have the IWS server running
// Go and configure the IWS and add the following URL:
// http://MY_IBM_I:2001/HTTPAdmin

/include QSYSINC/QRPGLESRC,UNISTD


Dcl-PR ConvertTemp;
  tempIn         Char(10)   const;
  tempOut        Char(10);
End-PR;

Dcl-Proc ConvertTemp export;

  Dcl-PI ConvertTemp;
    tempIn         Char(10)   const;
    tempOut        Char(10);
  End-PI;

  Dcl-S tempI        Packed(8:2);
  Dcl-S tempO        Packed(8:2);
  Dcl-S value        Char(50);

  value = %STR(%ADDR(tempIn));
  tempI=%DEC(value:7:2);
  tempO = (5/9)*(tempI / 32);
  value = %CHAR(tempO);
  tempOut = value;
  %STR(%ADDR(tempOut):10)=tempOut;
End-Proc;



