const express = require('express');
const request = require('request');
const mysql = require('../conmmon/mysql')
const silly_time = require('silly-datetime')
const getopenid = require('../conmmon/getopenid')
const random = require('../utils/random')
var router = express.Router();

router.use((Request,Response)=>{
    console.log(Request.query)
    let sessionkey = Request.query.sessionkey;
    let key = Request.query.key;
    let commid = Request.query.id;
    let imageslist = Request.query.images;
    let content = Request.query.content;
    //首先要判断id和key是否匹配，是否有资格发布动态
    let sql = `SELECT * FROM admins WHERE  temporarycode = '${key}' AND shetuanid = '${commid}'`
    mysql.query(sql).then(resset=>{
        if(resset.length == 0){
            //数据库中没有找到相关信息
            console.log('数据库中没有找到相关信息')
            Response.send({
                code:403,
                msg:'登录超时，请重新登录'
            })
            return;
        }
        //不慌，先找到发起人的openid
        getopenid(sessionkey,openid=>{
            if(openid == null){
                Response.send({
                    code:404,
                    msg:'信息审核失败，请重启小程序'
                })
                
            } else{
                let date = new Date();
                let datestr = silly_time.format(date);
                let sql2 = `INSERT INTO huodong(hdID,shetuanID,hdtime,content,creatuser,images) VALUES(?,?,?,?,?,?)`
                let rdstr = random(false,6);
                let par = [Date.now()+rdstr,commid,datestr,content,openid,imageslist];
                mysql.insert(sql2,par).then(result=>{
                    console.log('插入新活动成功',result)
                    Response.send({
                        code:200,
                        msg:'发布成功,等待审核'
                    })
                }).catch(error=>{
                    console.log('插入新活动失败',error)
                    Response.send({
                        code:404,
                        msg:'程序员删库跑路了。。。'
                    })
                })
            }
        })
        
    })
})

module.exports = router;
