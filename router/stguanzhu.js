const express = require('express');
var router = express.Router();
const mysql = require('../conmmon/mysql')
const getopenid = require('../conmmon/getopenid')
const silly_datetime = require('silly-datetime')

router.use((Request, Response) => {
    console.log('stguanzhu:->', Request.query)
    let sessionkey = Request.query.sessionkey;
    let shetuanid = Request.query.shetuanid;
    let likeOrNot = Request.query.likeOrNot;
    getopenid(sessionkey, openid => {
        if (openid == null) {
            console.log('没有找到此sessionkey对应的openid');
            Response.send({
                code:403,
                msg:'登录过期，请重新登录'
            })
        } else {
            if (likeOrNot == 'false') {
                let date = silly_datetime.format(new Date());
                let sql = `insert into stguanzhu values(?,?,?)`
                let param = [openid, shetuanid, date];
                mysql.insert(sql, param).then(result => {
                    console.log('插入成功：', result)
                    Response.send({
                        code:200,
                        msg:'关注成功'
                    })
                }).catch(error => {
                    console.log('插入出错:', error)
                    Response.send({
                        code:300,
                        msg:'出现了错误,关注失败'
                    })
                })
            } else {
                //用户取消了关注,删除数据库中的数据
                let sql = `DELETE FROM stguanzhu WHERE openid='${openid}' AND shetuanid = '${shetuanid}'`
                mysql.query(sql).then(result=>{
                    console.log('删除关注信息成功',result)
                    Response.send({
                        code:200,
                        msg:'取消关注成功'
                    })
            
                }).catch(error=>{
                    console.log('删除关系失败',error)
                    Response.send({
                        code:300,
                        msg:'出现了错误,关注失败'
                    })
                })
            }

        }
    })
})
module.exports = router;