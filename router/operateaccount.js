const express = require('express');
var router = express.Router();
const mysql = require('../conmmon/mysql');
const kinds = require('../config').commkinds;
router.use((Request, Response) => {
    console.log('插入社团:', Request.query)
    let account = Request.query.account;
    let commname = Request.query.commname;
    let password = Request.query.kind;
    let xiaoqu = Request.query.xiaoqu;

    mysql.query(`select * from shetuan where name = '${commname}' and xiaoqu = '${xiaoqu}'`).then(resset => {
        if (resset.length != 0) {
            console.log('已经存在社团',resset)
            Response.send({
                code: 303,
                msg: "已经存在这个社团？"
            })
        } else {
            //
            let sql = `INSERT INTO shetuan(id,name,kinds,xiaoqu,profile,zyfzr) VALUES(?,?,?,?,?,?)`
            let par = [account, commname, password, xiaoqu, "/images/commLogo/none.png", "NULL"];
            mysql.insert(sql, par).then(result => {

                if (result) {
                    Response.send({
                        code: 200,
                        msg: '插入成功'
                    })
                }
            }).catch(err => {
                console.log("插入错误：：：", err)
                Response.send({
                    code: 404,
                    msg: "插入时发生了错误"
                })
            })
        }
    })
    //这里先不检查权限问题了

})
module.exports = router;