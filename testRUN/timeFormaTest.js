var date = new Date()
console.log(date)

//-============
const silly_time = require('silly-datetime')


let dateStr = silly_time.format(date);
console.log(dateStr)
const mysql = require('../conmmon/mysql')
let sql= `insert into stguanzhu values('ssss11id','sh11etuanid','${dateStr}')`
mysql.query(sql).then(res=>{
    console.log(res)
}).catch(err=>{
    console.log('err:',err)
})