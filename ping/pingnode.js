var http = require('http')
const { exit } = require('process')

let session = parseInt(process.argv[2])
let repeat  = parseInt(process.argv[3])
let sleep   = parseInt(process.argv[4])

function dorequest(session , repeat, sleep) {
    
    var data = 'n=' + repeat.toString()
    var options = {
        host: 'MY_IBM_I',
        port: '60080',
        path: '/.' + session + '/echoplusone?sleep=' + sleep,
        method: 'POST',
        headers: {
            'repeat': repeat,
            'sleep': sleep,
            'Content-Type': 'application/x-www-form-urlencoded',
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
            console.log("Session: %d, req %d, resp: %s" , session ,repeat,str )
            if (str != repeat + 1) {
                console.log("!!!!!!!" , str , repeat+1)
                exit();
            }
            if (repeat > 1) {
                dorequest (session , repeat - 1 , sleep)
            }
        });
    }
    var req = http.request(options, callback)
    req.write(data)
    req.end()  
}
dorequest ( session ,repeat  , sleep)
