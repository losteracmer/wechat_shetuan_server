//这个模块主要是写一些社团信息的修改
var express = require('express');
var path = require('path')
var mysql = require('../conmmon/mysql')
const silly_time = require('silly-datetime')
var app = express();
var multer = require('multer');
var mymulter = require('./mymulter')
const bodyparser = require('body-parser');
var imagecompress = require('../utils/imagecompress') // 图片压缩
var router = express.Router()


router.use('/contact', (Request, Response) => {
    console.log('change contact')
    let sessionkey = Request.query.sessionkey;
    let key = Request.query.key;
    let commid = Request.query.id;
    let text = Request.query.text; //这是要修改的信息
    //首先要判断id和key是否匹配，是否有资格发布动态
    let sql = `SELECT * FROM admins WHERE  temporarycode = '${key}' AND shetuanid = '${commid}'`
    mysql.query(sql).then(resset => {
        if (resset.length == 0) {
            //数据库中没有找到相关信息
            console.log('数据库中没有找到相关信息')
            Response.send({
                code: 403,
                msg: '登录超时，请重新登录'
            })
            return;
        }
        //不慌，先找到发起人的openid
        getopenid(sessionkey, openid => {
            if (openid == null) {
                Response.send({
                    code: 404,
                    msg: '信息审核失败，请重启小程序'
                })

            } else {
                //这里处理事务
                let sql = `UPDATE shetuan SET contact = ? WHERE id = ?`
                let par = [text, commid]
                mysql.update(sql, par).then(result => {
                    Response.send({
                        code: 200,
                        msg: '修改成功'
                    })
                }).catch(error => {
                    Response.send({
                        code: 403,
                        msg: '修改信息发生了错误'
                    })
                })
            }
        })
    }).catch(error => {
        Response.send({
            code: 404,
            msg: '未知错误'
        })
    })
})
//主要负责人
router.use('/zyfzr', (Request, Response) => {
    console.log('change zyfzr')
    let sessionkey = Request.query.sessionkey;
    let key = Request.query.key;
    let commid = Request.query.id;
    let text = Request.query.text; //这是要修改的信息
    //首先要判断id和key是否匹配，是否有资格发布动态
    let sql = `SELECT * FROM admins WHERE  temporarycode = '${key}' AND shetuanid = '${commid}'`
    mysql.query(sql).then(resset => {
        if (resset.length == 0) {
            //数据库中没有找到相关信息
            console.log('数据库中没有找到相关信息')
            Response.send({
                code: 403,
                msg: '登录超时，请重新登录'
            })
            return;
        }
        //不慌，先找到发起人的openid
        getopenid(sessionkey, openid => {
            if (openid == null) {
                Response.send({
                    code: 404,
                    msg: '信息审核失败，请重启小程序'
                })

            } else {
                //这里处理事务
                let sql = `UPDATE shetuan SET zyfzr = ? WHERE id = ?`
                let par = [text, commid]
                mysql.update(sql, par).then(result => {
                    Response.send({
                        code: 200,
                        msg: '主要负责人修改成功'
                    })
                }).catch(error => {
                    Response.send({
                        code: 403,
                        msg: '修改信息发生了错误'
                    })
                })
            }
        })
    }).catch(error => {
        Response.send({
            code: 404,
            msg: '未知错误'
        })
    })
})

//社团简介################
router.use('/brief', (Request, Response) => {
    console.log('change brief')
    let sessionkey = Request.query.sessionkey;
    let key = Request.query.key;
    let commid = Request.query.id;
    let text = Request.query.text; //这是要修改的信息
    //首先要判断id和key是否匹配，是否有资格发布动态
    let sql = `SELECT * FROM admins WHERE  temporarycode = '${key}' AND shetuanid = '${commid}'`
    mysql.query(sql).then(resset => {
        if (resset.length == 0) {
            //数据库中没有找到相关信息
            console.log('数据库中没有找到相关信息')
            Response.send({
                code: 403,
                msg: '登录超时，请重新登录'
            })
            return;
        }
        //不慌，先找到发起人的openid
        getopenid(sessionkey, openid => {
            if (openid == null) {
                Response.send({
                    code: 404,
                    msg: '信息审核失败，请重启小程序'
                })

            } else {
                //这里处理事务
                //let sql = `UPDATE shetuan SET brief = ? WHERE id = ?`
                //par 的第三个字段是修改类型
                let par = [commid, text,'brief']

                let sql = `INSERT INTO stchange(shetuanid,text,cgtype,cgtime) VALUES(?,?,?,NOW())`
                mysql.insert(sql, par).then(result => {
                    Response.send({
                        code: 200,
                        msg: '等待审核'
                    })
                }).catch(error => {
                    console.log(error)
                    Response.send({
                        code: 403,
                        msg: '修改信息发生了错误'
                    })
                })
            }
        })
    }).catch(error => {
        Response.send({
            code: 404,
            msg: '未知错误'
        })
    })
})

//精品活动################
router.use('/jphd', (Request, Response) => {
    console.log('change jphd')
    let sessionkey = Request.query.sessionkey;
    let key = Request.query.key;
    let commid = Request.query.id;
    let text = Request.query.text; //这是要修改的信息
    //首先要判断id和key是否匹配，是否有资格发布动态
    let sql = `SELECT * FROM admins WHERE  temporarycode = '${key}' AND shetuanid = '${commid}'`
    mysql.query(sql).then(resset => {
        if (resset.length == 0) {
            //数据库中没有找到相关信息
            console.log('数据库中没有找到相关信息')
            Response.send({
                code: 403,
                msg: '登录超时，请重新登录'
            })
            return;
        }
        //不慌，先找到发起人的openid
        getopenid(sessionkey, openid => {
            if (openid == null) {
                Response.send({
                    code: 404,
                    msg: '信息审核失败，请重启小程序'
                })

            } else {
                //这里处理事务
                //let sql = `UPDATE shetuan SET brief = ? WHERE id = ?`
                //par 的第三个字段是修改类型
                let par = [commid, text,'jphd']

                let sql = `INSERT INTO stchange(shetuanid,text,cgtype,cgtime) VALUES(?,?,?,NOW())`
                mysql.insert(sql, par).then(result => {
                    Response.send({
                        code: 200,
                        msg: '等待审核'
                    })
                }).catch(error => {
                    console.log(error)
                    Response.send({
                        code: 403,
                        msg: '修改信息发生了错误'
                    })
                })
            }
        })
    }).catch(error => {
        Response.send({
            code: 404,
            msg: '未知错误'
        })
    })
})

//更改活动信息################
router.use('/activities', (Request, Response) => {
    console.log('change brief', Request.query)
    let sessionkey = Request.query.sessionkey;
    let key = Request.query.key;
    let commid = Request.query.id;
    let start = Request.query.start;
    let add = Request.query.add;
    let operate = Request.query.operate; //操作方式 
    let hdid = Request.query.hdid; //活动id
    //首先要判断id和key是否匹配，是否有资格发布动态
    let sql = `SELECT * FROM admins WHERE  temporarycode = '${key}' AND shetuanid = '${commid}'`
    mysql.query(sql).then(resset => {
        if (resset.length == 0) {
            //数据库中没有找到相关信息
            console.log('数据库中没有找到相关信息')
            Response.send({
                code: 403,
                msg: '登录超时，请重新登录'
            })
            return;
        }
        //不慌，先找到发起人的openid
        var account = resset[0].account;
        var issuper = resset[0].issuper;
        getopenid(sessionkey, openid => {
            if (openid == null) {
                Response.send({
                    code: 404,
                    msg: '信息审核失败，请重启小程序'
                })

            } else {
                //这里处理事务
                if (operate == 'operate') {
                    //说明这是请求操作方式的
                    console.log('返回操作方式')
                    if (issuper) {
                        Response.send({
                            code: 200,
                            operate: ['删除', '展示', '停止展示']
                        })
                    } else {
                        Response.send({
                            code: 200,
                            operate: ['删除']
                        })
                    }

                } else {
                    //这可能就是操作
                    if (operate == '删除') {
                        //删除动态
                        let sql2 = `UPDATE huodong SET hdstatus = ? WHERE hdID = ? `;
                        let par = [2, hdid];
                        mysql.update(sql2, par).then(result => {
                            Response.send({
                                code: 200,
                                msg: '活动删除成功'
                            })
                        }).catch(error => {
                            //error
                            console.log('删除活动失败：', error)
                            Response.send({
                                code: 404,
                                msg: '删除活动失败'
                            })
                        })
                    }

                    if (operate == '展示') {
                        //这是展示操作
                        //展示动态
                        let sql2 = `UPDATE huodong SET hdstatus = ? WHERE hdID = ? `;
                        let par = [1, hdid];
                        mysql.update(sql2, par).then(result => {
                            console.log('展示msg：', result)
                            Response.send({
                                code: 200,
                                msg: '活动展示成功'
                            })
                        }).catch(error => {
                            //error
                            console.log('展示失败：', error)
                            Response.send({
                                code: 404,
                                msg: '展示活动失败'
                            })
                        })
                    }

                    if (operate == '停止展示') {
                        //这是展示操作
                        //展示动态
                        let sql2 = `UPDATE huodong SET hdstatus = ? WHERE hdID = ? `;
                        let par = [0, hdid];
                        mysql.update(sql2, par).then(result => {
                            console.log('停止展示msg：', result)
                            Response.send({
                                code: 200,
                                msg: '活动已停止展示'
                            })
                        }).catch(error => {
                            //error
                            console.log('停止展示失败：', error)
                            Response.send({
                                code: 404,
                                msg: '停止活动展示失败'
                            })
                        })
                    }

                    if (operate == 'getaclist') {
                        //获取活动列表
                        let sql;
                        if (issuper) {
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
                            xiaoqu,
                            hdstatus
                        FROM
                            shetuan ,huodong
                            LEFT JOIN ( SELECT * FROM huodongdz WHERE dzuser = '${openid}' ) AS huodongdz ON huodong.hdID = huodongdz.hdid 
                        WHERE
                            shetuan.id = huodong.shetuanID  AND (hdstatus = 1 OR hdstatus = 0)
                        ORDER BY
                            hdtime DESC 
                        LIMIT ${start},${add}   `
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
                            xiaoqu,
                            hdstatus
                        FROM
                            shetuan ,huodong
                            LEFT JOIN ( SELECT * FROM huodongdz WHERE dzuser = '${openid}' ) AS huodongdz ON huodong.hdID = huodongdz.hdid 
                        WHERE
                            shetuan.id = huodong.shetuanID AND shetuanID = '${commid}' AND (hdstatus = 1 OR hdstatus = 0)
                        ORDER BY
                            hdtime DESC 
                        LIMIT ${start},${add} `
                        }
                        mysql.query(sql).then(resset => {
                            //对结果进行处理
                            for (var i = 0; i < resset.length; i++) {
                                //console.log('netc:',i,' --  ',resset[i].dzuser,resset[i].dzstatus)
                                //images处理
                                let images = resset[i].images;
                                if (images == '[]') {
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
                                resset[i].hdtime = dateStr;
                                // let str = '["dfaf","fafas","adfas"]'
                                // let str2 = str.substring(2,str.length-2)
                                // console.log(str2)
                                // console.log(str2.split('","'))
                            }
                            console.log('获取到的管理活动列表：', resset);
                            Response.send({
                                code: 200,
                                activities: resset
                            })
                        }).catch(error => {
                            console.log('出现了一个错误', error);
                            Response.send({
                                code: 404,
                                msg: '出现了一个错误'
                            })
                        })
                    }
                }
            }
        })
    }).catch(error => {
        console.log('未可知错误:', error)
        Response.send({
            code: 404,
            msg: '未知错误'
        })
    })
})

//信息
router.use('/stchange', (Request, Response) => {
    console.log('change brief', Request.query)
    let sessionkey = Request.query.sessionkey;
    let key = Request.query.key;
    let commid = Request.query.id;
    let start = Request.query.start;
    let add = Request.query.add;
    let operate = Request.query.operate; //操作方式 
    let cgid = Request.query.cgid;
    //首先要判断id和key是否匹配，是否有资格发布动态
    let sql = `SELECT * FROM admins WHERE  temporarycode = '${key}' AND shetuanid = '${commid}'`
    mysql.query(sql).then(resset => {
        if (resset.length == 0) {
            //数据库中没有找到相关信息
            console.log('数据库中没有找到相关信息')
            Response.send({
                code: 403,
                msg: '登录超时，请重新登录'
            })
            return;
        }
        //不慌，先找到发起人的openid
        var account = resset[0].account;
        var issuper = resset[0].issuper;
        getopenid(sessionkey, openid => {
            if (openid == null) {
                Response.send({
                    code: 404,
                    msg: '信息审核失败，请重启小程序'
                })
            } else {
                //事务处理
                if (operate == 'getlist') {
                    if (issuper) {
                        let sql = `SELECT cgid,\`name\` ,\`profile\`,xiaoqu,cgstatus,text,cgtime,actime ,cgtype FROM stchange , shetuan 
                        WHERE shetuan.id = stchange.shetuanid 
                        ORDER BY cgstatus DESC, cgtime DESC 
                        LIMIT ${start},${add}`
                        mysql.query(sql).then(resset => {
                            Response.send({
                                code: 200,
                                issuper: true,
                                change: resset
                            })
                        }).catch(error => {
                            console.log(error)
                            Response.send({
                                code: 403,
                                msg: '出现了一个错误...'
                            })
                        })
                    } else {
                        let sql = `SELECT cgid,\`name\` ,\`profile\`,xiaoqu,cgstatus,text,cgtime,actime ,cgtype FROM stchange , shetuan 
                        WHERE shetuan.id = stchange.shetuanid AND shetuanid = '${commid}' 
                        ORDER BY cgstatus DESC, cgtime DESC 
                        LIMIT ${start},${add}`
                        mysql.query(sql).then(resset => {
                            Response.send({
                                code: 200,
                                issuper: false,
                                change: resset
                            })
                        }).catch(error => {
                            console.log(error)
                            Response.send({
                                code: 403,
                                msg: '出现了一个错误...'
                            })
                        })
                    }
                } else if( operate == '批准'){
                    let sql = `UPDATE stchange SET cgstatus = ? ,actime = NOW() WHERE cgid = ?`
                    let par = [1,cgid];
                    mysql.update(sql,par).then(result =>{
                        Response.send({
                            code:200,
                            msg:"以批准修改"
                        })
                    }).catch(error=>{
                        console.log('修改社团信息错误:',error)
                        Response.send({
                            code:404,
                            msg:"出现了一个未知的问题"
                        })
                    })
                } else if(operate == '拒绝'){
                    let sql = `UPDATE stchange SET cgstatus = ? ,actime = NOW() WHERE cgid = ?`
                    let par = [0,cgid];
                    mysql.update(sql,par).then(result =>{
                        Response.send({
                            code:200,
                            msg:"以拒绝修改"
                        })
                    }).catch(error=>{
                        console.log('修改社团信息错误:',error)
                        Response.send({
                            code:404,
                            msg:"出现了一个未知的问题"
                        })
                    })
                }

            }
        })
    }).catch(error => {
        console.log('未可知错误:', error)
        Response.send({
            code: 404,
            msg: '未知错误'
        })
    })
})

module.exports = router;