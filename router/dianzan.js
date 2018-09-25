const express = require('express');
var router = express.Router();
const mysql = require('../conmmon/mysql')
const getopenid = require('../conmmon/getopenid')
const silly_time = require('silly-datetime')

router.use((Request, Response) => {
    console.log('点赞请求：',Request.query);
    let sessionkey = Request.query.sessionkey;
    let hdid = Request.query.hdid;

    let star = parseInt(Request.query.star);
    console.log(typeof star)
    getopenid(sessionkey, openid => {
        if (openid != null) {
            let sql = `SELECT * FROM huodongdz WHERE dzuser = '${openid}' AND hdid = '${hdid}'`;
            mysql.query(sql).then(resset => {

                let datastr = silly_time.format(new Date());

                if (resset.length == 0) {
                    //说明还没有点赞
                    console.log('还没有点赞');
                    let sql2 = `INSERT INTO huodongdz VALUES(?,?,?,?)`;
                    let par = [hdid, openid, datastr, 1]
                    mysql.insert(sql2, par).then(result => {
                        console.log('点赞成功', resset)
                        Response.send({
                            code: 200,
                            msg: '点赞成功'
                        })
                    }).catch(error => {
                        console.log('点赞错误：',error)
                        Response.send({
                            code: 200,
                            msg: '关注时发生了错误，请稍后重试'
                        })
                    })
                } else {
                    //说明已经点赞了
                    console.log('已经点过赞了，更新');
                    
                    let sql3 =`UPDATE huodongdz SET huodongdz.dzstatus = ? WHERE dzuser =? AND hdid = ?`;
                    let nowstar = star == 1?0:1;
                    let par3 = [nowstar,openid,hdid]
                    console.log('参数par3:',par3)
                    mysql.update(sql3,par3).then(result=>{
                        console.log('更改点赞状态：',result)
                        if(star == 0){
                            Response.send({
                                code: 200,
                                msg: '点赞成功'
                            })
                        } else {
                            Response.send({
                                code: 200,
                                msg: '取消点赞成功'
                            })
                        }
                    })
                }

            }).catch(error => {
                console.log('关注失败')
                Response.send({
                    code: 403,
                    msg: '程序员删库跑路了。。。'
                })
            })
        } else {
            Response.send({
                code: 404,
                msg: '登录超时，请重新登录'
            })
        }
    })
})

module.exports = router;

//点赞问题： 总是出现点赞成功，或者一直取消点赞。。。明天再改