const express = require("express");
const router = express.Router();
const crypto = require("crypto");
//引入数据库文件
const mysql = require('../conmmon/mysql')
//引入生成随机数的
const random = require("../utils/random");
//引入baset64加密的
const Base64 = require("../utils/base64");

const encode = require('../utils/encode');

const temporarycode = require('../utils/temporarycode');

const createncryptedPasswd = require('../utils/createncryptedPasswd')
/**
 * 定义post提交数据
 */


router.use("/login", (Request, Response) => {
    console.log('adminLogin:', Request.query)
    let account = Request.query.account;
    let password = Request.query.password;
    let sessionkey = Request.query.sessionkey;

    //403, 数据错误
    if (!account || !password) {
        Response.send({
            code: 403,
            msg: "请输入用户名与密码"
        });
        return false;
    }
    let sql = `
    SELECT * FROM shetuan ,admins WHERE admins.account = '${account}' AND shetuan.id = admins.shetuanid`;
    mysql.query(sql).then(resset => {
        if (resset.length > 0) {
            console.log(resset[0].password);
            //1.获取到的密码截取前面随机数通过base64加密的结果
            let base64Random = resset[0].password.substring(0, 12);
            let lastPassword = encode(base64Random, password);
            if (resset[0].password === lastPassword) {
                let key = temporarycode.creat(account);
                //登录成功后，生成key返回给前台，并且每次都以key和account作为凭证进行操作

                Response.send({
                    code: 200,
                    msg: "登录成功",
                    key: key,
                    id: resset[0].id,
                    profile: resset[0].profile,
                    name: resset[0].name
                });
            } else {
                Response.send({
                    code: 400,
                    msg: "密码错误"
                });
            }
        } else{
            Response.send({
                code:403,
                msg:"账号错误，请核对"
            })
        }
    }).catch(error => {
        //404 数据库错误
        console.log('登录异常', error)
        Response.send({
            code: 404,
            msg: "程序员删库跑路了。。。"
        });
    })
})


router.use("/changepw", (Request, Response) => {
    let account = Request.query.account;
    let password = Request.query.password;
    let newpassword = Request.query.newpassword;
    let sessionkey = Request.query.sessionkey;
    //403, 数据错误
    if (!password) {
        Response.send({
            code: 403,
            msg: "请输入密码"
        });
        return false;
    }
    let sql = `select * from admins where account = '${account}'`;
    mysql.query(sql).then(resset => {
        if (resset.length > 0) {
            console.log(resset[0].password);
            //1.获取到的密码截取前面随机数通过base64加密的结果
            let base64Random = resset[0].password.substring(0, 12);

            let lastPassword = encode(base64Random, password);
            if (resset[0].password === lastPassword) {
                let newencryptedpassword = createncryptedPasswd(newpassword);
                let sql = `UPDATE admins SET password = ? WHERE account = ?`
                let par = [newencryptedpassword, account];
                mysql.update(sql, par).then(result => {
                    console.log('更改密码成功:', result)
                    Response.send({
                        code: 200,
                        msg: "密码更新成功"
                    })
                }).catch(error => {
                    console.log('更新密码错误', error)
                    Response.send({
                        code: 403,
                        msg: "程序员删库跑路了。。。"
                    })
                })
            } else {
                Response.send({
                    code: 400,
                    msg: "密码错误"
                });
            }
        } else {
            console.log('更新密码失败');
            Response.send({
                code: 403,
                msg: '账号不存在'
            })
        }
    }).catch(error => {
        //404 数据库错误
        Response.send({
            code: 403,
            msg: "程序员删库跑路了。。。"
        });
    })
})
module.exports = router;