// import fetch   from 'node-fetch'
import crypto from 'crypto'
import node_fetch from 'node-fetch'
import http from  'http'
import https from 'https'


// fetch: add option keepAlive with default true
const fetch = (function getFetchWithKeepAlive() {
    const httpAgent = new http.Agent({ keepAlive: true });
    const httpsAgent = new https.Agent({ keepAlive: true });
    return async function (url, userOptions) {
      const options = { keepAlive: true };
      Object.assign(options, userOptions);
      if (options.keepAlive == true)
        options.agent = (parsedUrl => parsedUrl.protocol == 'http:' ? httpAgent : httpsAgent);
      delete options.keepAlive;
      return await node_fetch(url, options);
    }
  })();
// process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0"

let connection = parseInt(process.argv[2])
let repeat     = parseInt(process.argv[3])
let sleep      = parseInt(process.argv[4])


async function main() {
    for (let i = 1 ; i <= repeat ; i++) {
        const payload = {
            "echo" : crypto.randomUUID(),
            "sleeper": sleep
        }
        const response = await fetch(
            'http://MY_IBM_I:60800/router/perform02/performance',
            {
                method: "POST",
                body: JSON.stringify(payload),
                keepAlive : true  
            }
        )
        const data = await response.json()
        // console.log("connection: %d, Count: %d, Response: %s" , connection , i, data )
        if (data.echo !== payload.echo) {
            console.log("invalid response " , data);
            return Promise.resolve("Error!!" )
        }
    }
    return Promise.resolve('done ')
}
console.log ( await main())
