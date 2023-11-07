<%
/include qasphdr,posix
/* -------------------------------------------------------------------- *\
 * Just go to sleep and increment response counter
\* -------------------------------------------------------------------- */
setContentType('text/plain');
if reqnum('sleep') > 0;
    sleep(reqnum('sleep'));
endif; 
responseWrite(%char(%int(reqnum('n') + 1)));
*INRT= *ON;


