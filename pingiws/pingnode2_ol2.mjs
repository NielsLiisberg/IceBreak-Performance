import fetch   from 'node-fetch';

let connection = parseInt(process.argv[2])
let repeat     = parseInt(process.argv[3])
let sleep      = parseInt(process.argv[4])

async function main() {
    for (let i = 1 ; i <= repeat ; i++) {
        const response = await fetch('http://MY_IBM_I:60080/perform01');
        const data = await response.text();
        console.log("connection: %d, Count: %d, Response: %s" , connection , i, data )
        if (data.substring(0 , 1) != '{') {
            return Promise.resolve("Error: "  + data)
        } 
    }
    return Promise.resolve('done ')
}
console.log ( await main())
