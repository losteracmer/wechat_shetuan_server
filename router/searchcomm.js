const express = require('express');
var router = express.Router();
const mysql = require('../conmmon/mysql')
const getopenid = require('../conmmon/getopenid')
router.use((Request,Response)=>{
    console.log('search commList:->',Request.query)
    let text = Request.query.text;
    let sessionkey = Request.query.sessionkey;
    let sql = `SELECT * FROM shetuan WHERE  name LIKE '%${text}%' OR brief LIKE '%${text}%' OR kinds LIKE '%${text}%'`;

    mysql.query(sql).then(res=>{
        console.log('从数据库得到社团list:',res);
        //这只是通过名字搜索
        Response.send({comm:res});
        Response.end();
    }).catch(err=>{
        Response.send('呀，数据库炸了，请联系管理');
    })

})
module.exports = router;

