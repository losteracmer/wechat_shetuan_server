const express = require('express');
var router = express.Router();
const mysql = require('../conmmon/mysql')
const getopenid = require('../conmmon/getopenid')
const silly_datetime = require('silly-datetime')

router.use((Request, Response) => {
    console.log('反馈:',Request.query)
    let text = Request.query.text;
    let sessionkey = Request.query.sessionkey;
    getopenid(sessionkey, openid =>{
        if(openid == null){
            Response.send({
                code:404,
                msg:'登录过期，请重新登录'
            })
        } else{
            let sql = `INSERT INTO feedback VALUES(?,?,NOW())`;
            let par = [openid,text]
            mysql.insert(sql,par).then(result =>{
                Response.send({
                    code:200,
                    msg:'感谢您的反馈'
                })
            }).catch(error =>{
                console.log(error)
                Response.send({
                    code:403,
                    msg:'后台又出了点小问题呢，尴尬。。。'
                })
            })
        }
    })
})

module.exports = router;