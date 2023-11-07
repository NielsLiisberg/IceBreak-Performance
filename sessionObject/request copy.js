const http = require('http')
const fs = require('fs')
const { exit } = require('process')

let sessions  = parseInt(process.argv[2])
let threadno  = parseInt(process.argv[3])
let repeat    = parseInt(process.argv[4])
let sleep     = parseInt(process.argv[5])
let now       = 'X' +Date.now();
let subses  = now.substring(6 , 11)


function dorequest(threadno  , repeat, sleep) {
    
    var session = (repeat % sessions) +1 ;
    var sessionid = '2022-01-02-12.34.56.' + subses.toString() + session.toString()
    var data = 'n=' + repeat.toString() + '&thread=' + threadno.toString()
    var options = {
        host: 'MY_IBM_I',
        port: '60080', // Shared pool
        path: '/sesGetObj4?sleep=' + sleep,
        method: 'POST',
        headers: {
            'Cookie': 'sys_sesid="' + sessionid + '"', 
            'repeat': repeat,
            'sleep': sleep,
            'thread' : threadno ,
            'Content-Type': 'application/json',
            'Content-Length': data.length
        }
    }

    callback = function(response) {
        var str = ''

        // another chunk of data has been received, so append it to `str`
        response.on('data', function (chunk) {
            str += chunk
        });

        // the whole response has been received, so we just print it out here
        response.on('end', function () {
            var resp = JSON.parse(str)
            // +1000 is for sort in vsCode
            let count = 0;
            try {
                let s  = fs.readFileSync ('counter' + session.toString())
                console.log('>' + s.toString() + '<')
                

            } catch (error) {}
            count += 1;
            fs.writeFileSync ('counter' +  session.toString() , count.toString())    
            console.log("sesid: %s, session: %s, threadno: %d, req: %d, mycount: %d, resp: %s" ,
                sessionid ,session , 1000+ threadno  ,1000+repeat, count ,str )
            
            if (str != repeat + 1) {
               // console.log("!!!!!!!" , str , repeat+1)
                //exit();
            }
            if (repeat > 1) {
                dorequest (threadno  , repeat - 1 , sleep)
            }
        });
    }
    var req = http.request(options, callback)
    req.write(data)
    req.end()  
}
dorequest ( threadno  ,repeat  , sleep)
