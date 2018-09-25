const express = require('express');
var router = express.Router();
const mysql = require('../conmmon/mysql')

//接受一个sessionkey，同sessionkey找到openid
//数据库错误码404
router.use((Request,Response)=>{
    try {
        var sessionkey = Request.query.sessionkey;
    } catch (ParamNotFinderror) {
        console.log('异常的请求')
        return;
    }
    let sql = `SELECT id,name,brief,profile FROM shetuan WHERE id IN(SELECT shetuanid FROM user2shetuan WHERE openid IN\
        (SELECT openid FROM user WHERE sessionkey = '${sessionkey}') )`
    mysql.query(sql).then(resset=>{
        Response.send({
            code:200,
            comm:resset
        })
    }).catch(error=>{
        console.log('===error:',error)
        Response.send({
            code:404,
            comm:[]
        })
    })
})

module.exports = router;