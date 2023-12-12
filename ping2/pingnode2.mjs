import fetch   from 'node-fetch'
import crypto from 'crypto'
console.log(crypto.randomUUID())

process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0"

let connection = parseInt(process.argv[2])
let repeat     = parseInt(process.argv[3])
let sleep      = parseInt(process.argv[4])

async function main() {
    for (let i = 1 ; i <= repeat ; i++) {
        const echo = crypto.randomUUID()
        const response = await fetch('https://MY_IBM_I:60800/router/perform02/performance?payload={"echo":"' + echo + '","sleeper":' + sleep +'}');
        const data = await response.text();
        console.log("connection: %d, Count: %d, Response: %s" , connection , i, data )
        if (data.substring(0 , 1) != '{') {
            return Promise.resolve("Error: "  + data)
        } 
    }
    return Promise.resolve('done ')
}
console.log ( await main())
