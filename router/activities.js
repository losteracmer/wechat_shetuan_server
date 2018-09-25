const express = require('express');
var router = express.Router();
const mysql = require('../conmmon/mysql')
const getopenid = require('../conmmon/getopenid')
const silly_time = require('silly-datetime')

router.use((Request, Response) => {
    let start = Request.query.start;
    let add = Request.query.add;
    let sessionkey = Request.query.sessionkey;
    let shetuanid = Request.query.shetuanid;
    let xiaoqu = Request.query.xiaoqu;
    if (xiaoqu == '全部') xiaoqu = null; //如果用户查询的是所有校区，那么。。。。
    console.log('shetuanid:', shetuanid)
    //首先要获取用户的openid
    getopenid(sessionkey, openid => {
        if (openid != null) {
            let sql;
            if (shetuanid) {
                sql = `SELECT
                huodong.hdID,
                shetuanID,
                hdtime,
                content,
                hddz,
                images,
                dzuser,
                dzstatus,
                NAME,
                profile ,
                xiaoqu
            FROM
                shetuan ,huodong
                LEFT JOIN ( SELECT * FROM huodongdz WHERE dzuser = '${openid}' ) AS huodongdz ON huodong.hdID = huodongdz.hdid 
            WHERE
                shetuan.id = huodong.shetuanID AND shetuanID = '${shetuanid}' AND hdstatus = 1
            ORDER BY
                hdtop DESC,hdtime DESC 
            LIMIT ${start},${add}  
            `

            } else {
                if (xiaoqu == '金明' || xiaoqu == '明伦') {
                    sql = `SELECT
                    huodong.hdID,
                    shetuanID,
                    hdtime,
                    content,
                    hddz,
                    images,
                    dzuser,
                    dzstatus,
                    NAME,
                    profile,
                    xiaoqu
                FROM
                    shetuan ,huodong
                    LEFT JOIN ( SELECT * FROM huodongdz WHERE dzuser = '${openid}' ) AS huodongdz ON huodong.hdID = huodongdz.hdid 
                WHERE
                    shetuan.id = huodong.shetuanID AND xiaoqu = '${xiaoqu}' AND hdstatus = 1
                ORDER BY
                    hdtop DESC,hdtime DESC 
                LIMIT ${start},${add}  
                `
                } else if (xiaoqu == '热门') {
                    sql = `SELECT
                    huodong.hdID,
                    shetuanID,
                    hdtime,
                    content,
                    hddz,
                    images,
                    dzuser,
                    dzstatus,
                    NAME,
                    profile ,
                    xiaoqu
                FROM
                    shetuan ,huodong
                    LEFT JOIN ( SELECT * FROM huodongdz WHERE dzuser = '${openid}' ) AS huodongdz ON huodong.hdID = huodongdz.hdid 
                WHERE
                    shetuan.id = huodong.shetuanID AND hdstatus = 1
                ORDER BY
                    hdtop DESC,hddz DESC 
                LIMIT ${start},${add}  
                `
                } else if (xiaoqu == '关注') {
                    sql = `SELECT
                    huodong.hdID,
                    shetuanID,
                    hdtime,
                    content,
                    hddz,
                    images,
                    dzuser,
                    dzstatus,
                    NAME,
                    profile ,
                    xiaoqu
                FROM
                    shetuan ,huodong
                    LEFT JOIN ( SELECT * FROM huodongdz WHERE dzuser = '${openid}' ) AS huodongdz ON huodong.hdID = huodongdz.hdid 
                WHERE
                    shetuan.id = huodong.shetuanID AND hdstatus = 1 AND shetuanID in (select shetuanid from stguanzhu where openid = '${openid}')
                ORDER BY
                    hdtop DESC,hdtime DESC 
                LIMIT ${start},${add} `
                } else {
                    sql = `SELECT
                    huodong.hdID,
                    shetuanID,
                    hdtime,
                    content,
                    hddz,
                    images,
                    dzuser,
                    dzstatus,
                    NAME,
                    profile ,
                    xiaoqu
                FROM
                    shetuan ,huodong
                    LEFT JOIN ( SELECT * FROM huodongdz WHERE dzuser = '${openid}' ) AS huodongdz ON huodong.hdID = huodongdz.hdid 
                WHERE
                    shetuan.id = huodong.shetuanID AND hdstatus = 1
                ORDER BY
                    hdtop DESC,hdtime DESC 
                LIMIT ${start},${add}  
                `
                }

            }
            mysql.query(sql).then(resset => {
                console.log('活动列表(length)：', resset.length)
                //对其中star进行处理
                for (var i = 0; i < resset.length; i++) {
                    //console.log('netc:',i,' --  ',resset[i].dzuser,resset[i].dzstatus)
                    if (resset[i].dzuser == null || resset[i].dzstatus == 0)
                        resset[i].star = 0;
                    else resset[i].star = 1;
                    //images处理
                    let images = resset[i].images;
                    if(images == '[]'){
                        let images3 = [];
                        resset[i].images = images3;
                    } else {
                        let images2 = images.substring(2, images.length - 2);
                        let images3 = images2.split('","');
                        resset[i].images = images3;
                    }
        
                    //时间处理
                    let time = resset[i].hdtime;
                    let dateStr = silly_time.format(time);
                    `fwsaQf ws2`
                    resset[i].hdtime = dateStr;
                    // let str = '["dfaf","fafas","adfas"]'
                    // let str2 = str.substring(2,str.length-2)
                    // console.log(str2)
                    // console.log(str2.split('","'))
                }

                Response.send({
                    code: 200,
                    activities: resset
                })
            })
        } else {
            Response.send({
                code: 403,
                msg: '登录过期，请重新登录'
            })
        }
    })
})
module.exports = router;