const express = require('express');
var router = express.Router();
const mysql = require('../conmmon/mysql')
const getopenid = require('../conmmon/getopenid')
router.use((Request, Response) => {
    console.log('getcommList:->', Request.query)
    let spi = Request.query.spi;
    let start = Request.query.start;
    let add = Request.query.add;
    let sessionkey = Request.query.sessionkey;
    let xiaoqu = Request.query.xiaoqu;
    let xiaoquStr ='';
    if(xiaoqu == '金明校区'){
        xiaoquStr = " AND xiaoqu = '金明' "
    } else if(xiaoqu == '明伦校区'){
        xiaoquStr = " AND xiaoqu = '明伦' "
    }
    if (spi == '热    门') {
        let sql = `SELECT * FROM shetuan WHERE  hot = 1 ${xiaoquStr} ORDER BY name LIMIT ${start},${add}`;
        mysql.query(sql).then(res => {
            //console.log('从数据库得到社团list:',res);
            Response.send({
                code:200,
                comm: res
            }); 
            Response.end();
        }).catch(err => {
            Response.send('呀，数据库炸了，请联系管理');
            Response.send({
                code:403,
                comm:[],
                msg:'呀，数据库炸了，请联系管理'
            });
        })
    } else if (spi == '关    注') {
        //这一部分比较麻烦，需要知道用户的关注社团
        if (sessionkey == undefined) {
            //没有正常获取到sessionkey，退出
            console.log('没有正常获取到sessionkey，退出');
            Response.send({
                code:403,
                comm:[],
                msg:'登录过期,请重新登录!'
            });
            return;
        }
        getopenid(sessionkey, openid => {
            if (openid == null) {
                //没有找到相关的id，应该提示用户重新登录
                console.log('没有找到相关的id，应该提示用户重新登录')
                Response.send({
                    code:403,
                    comm:[],
                    msg:'登录过期,请重新登录!'
                });
            } else {
                //拿到openid后,用这个openid去搜索user关注的社团
                //console.log('拿到的openid', openid)
                let sql = `select * from shetuan where id in (SELECT shetuanid from stguanzhu where openid = '${openid}')${xiaoquStr} ORDER BY name LIMIT ${start},${add}`
                mysql.query(sql).then(resset => {
                    // console.log('关注的社团:',resset)
                    if (resset.length == 0) {
                        //没有找到关注信息
                        Response.send({
                            code:200,
                            comm: resset
                        })
                    } else {
                        //没区别，前端去判断吧
                        Response.send({
                            code:200,
                            comm: resset
                        })
                    }
                })
            }
        })

    } else {
        let sql = `SELECT * FROM shetuan WHERE kinds like '%${spi}%' ${xiaoquStr} ORDER BY xiaoqu LIMIT ${start},${add}`;
        mysql.query(sql).then(res => {
            console.log('从数据库得到社团list:', res);
            Response.send({
                code:200,
                comm: res
            });
            Response.end();
        }).catch(err => {
            Response.send('呀，数据库炸了，请联系管理');
            Response.send({
                code:403,
                comm:[],
                msg:'程序员删库跑路....'
            });
        })
    }
})
module.exports = router;