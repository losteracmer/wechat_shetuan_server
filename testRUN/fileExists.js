var fs = require('fs')
fs.exists('./testRUN/logRun.js',f=>{
    console.log(f)
})

console.log(__dirname)
let components = []
const files = fs.readdirSync('./')
files.forEach(function (item, index) {
    let stat = fs.lstatSync("./" + item)
    if (stat.isDirectory() === true) { 
      components.push(item)
    }
})

console.log(components);