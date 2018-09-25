const express = require('express');
const request = require('request');
const mysql = require('../conmmon/mysql')
var router = express.Router();

var appid = require('../config').appid;
var secret = require('../config').secret;

//200 成功
//400 失败
router.use((Request, Response) => {
    console.log('login-->', Request.query)
    let code = Request.query.code;
    var options = {
        method: 'GET',
        url: `https://api.weixin.qq.com/sns/jscode2session?appid=${appid}&secret=${secret}&js_code=${code}&grant_type=authorization_code`
    }
    //先获取openid和sessionkey
    request(options, (err, res, body) => {
        if (err) {
            console.log('请求openid错误', err)
        } else {
            console.log(body)
            var jsonbody = JSON.parse(body);
            var openid = jsonbody["openid"];
            console.log('得到的aopenid：', openid);
            var sessionkey = jsonbody['session_key'];
            console.log('得到的sessionkey：', sessionkey);
            //先判断此openid是否在数据库中，如果在，更新session，如果不在，新增数据
            let sql = `select * from user where openid = '${openid}'`
            mysql.query(sql).then(resset => {
                console.log('查询openid', openid, '结果:', resset)
                if (resset.length == 0) {
                    console.log('查无此人')
                    //数据库没有查到openid
                    let sql = `INSERT INTO user(openid,sessionkey) VALUES(?,?)`
                    let par = [openid, sessionkey]
                    mysql.insert(sql, par).then(result => {
                        console.log('插入new user:', result)
                        Response.send({
                            code: 200,
                            sessionkey: sessionkey,
                            message: 'new user'
                        });
                    }).catch(err => {
                        console.log('插入失败', err);
                        Response.send({
                            code: 401,
                            sessionkey: sessionkey,
                            message: 'insert fail'
                        });
                    })
                } else {
                    //如果数据库中有这个人，那就更新数据库中的sessionkey
                    let sql = `UPDATE user SET sessionkey = '${sessionkey}' WHERE openid = '${openid}'`
                    mysql.update(sql).then(result => {
                        console.log('--', openid, '更新sessionkey成功')
                        Response.send({
                            code: 200,
                            sessionkey: sessionkey,
                            message: 'update user'
                        });

                    }).catch(err => {
                        console.log('--', openid, '更新sessionkey失败')
                        Response.send({
                            code: 400,
                            sessionkey: sessionkey,
                            message: 'update sessionkey fail'
                        });
                    })
                }
            })
            //Response.send({code:200,sessionkey:sessionkey,message:''});
        }
    })
})
module.exports = router;