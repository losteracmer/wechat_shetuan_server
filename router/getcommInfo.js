const express = require('express');
var router = express.Router();
const mysql = require('../conmmon/mysql')
getopenid = require('../conmmon/getopenid');

        
router.use((Request,Response)=>{
    //console.log('getcommInfo:->',Request.query)
    let commId = Request.query.commId;
    console.log('社团id：',commId,'类型：',typeof commId)
    let sql = `select * from shetuan where ID = '${commId}'`
    var sessionkey = Request.query.sessionkey;
    console.log('sessionkey',sessionkey)
    mysql.query(sql).then(res=>{
        console.log('从数据库得到社团info:',res)
        //查找是否关注了这个社团
        let sql2 = `SELECT * FROM stguanzhu WHERE shetuanid = '${commId}' \
        AND openid in (SELECT openid FROM user WHERE sessionkey = '${sessionkey}') `
        mysql.query(sql2).then(resset2=>{
            console.log("用户关注",resset2)
            if(resset2.length == 0){
                res[0].likeOrNot = false;
                Response.send(res[0])
            } else {
                res[0].likeOrNot = true;
                Response.send(res[0])
            }
        }).catch(err=>{
            console.log("社团详情信息：：",err)
            Response.send('程序员以删库跑路。。。');
        })
        //因为这里就只有一条数据，所以直接返回res[0]
        // Response.send(res[0]);
        // Response.end();
    }).catch(err=>{
        console.log("社团详情信息:",err)
        Response.send('程序员以删库跑路。。。')
    })
})
module.exports = router;