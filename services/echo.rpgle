**free
// ------------------------------------------------------------------------------------
// Simple JSON from a data store
// ------------------------------------------------------------------------------------
/include qasphdr,jsonParser

dcl-s pJson pointer;
dcl-s termninalid varchar(32);


*INRT = *ON;
SetContentType('application/json;charset=utf-8');
pJson = json_ParseRequest();
// termninalid = json_getStr(pjSon : 'terminalid');
responseWriteJson (pJson);
json_delete(pJson);

	
	
