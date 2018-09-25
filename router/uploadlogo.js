var express = require('express');
var path = require('path')
var mysql = require('../conmmon/mysql')
var app = express();
var multer = require('multer');

const bodyparser = require('body-parser');


var fs = require('fs');
var gm = require('gm');  // 图片处理模块 npm安装模块并且需要电脑(服务端)安装graphicsmagick软件(gm.exe加入环境变量)
var router = express.Router()

function imagecomress(ipath){
    console.log('当前路径',__dirname)
    console.log('开始压缩...')
    let newpath = path.join(ipath,'../../../imagesys/commLogo');
    let ext = path.basename(ipath)
    let imagepath = path.join(newpath,ext);
    //console.log(imagepath)
    //console.log(ipath)
    //图片压缩
    gm(ipath).resize(100,100).write(imagepath, err =>{
        if(err)console.log('压缩图片出现错误:',err)
        else  console.log('压缩成功',imagepath)
    })
}

let storage = multer.diskStorage({
    // 上传路径处理
    // destination: `${process.cwd()}/public`,
    
    destination: path.join(__dirname, '../images/commLogo'),
    filename: function (req, file, callback) { // file上传的文件信息, callback 重命名处理
        // console.log(file);
        // 重命名处理
        let filename = (file.originalname).split('.'); //['文件名','文件后缀'] eg: 1.png
        callback(null, `${Date.now()}logo.${filename[filename.length-1]}`); //参数1 null ,参数2 时间戳+后缀
    }
});
let uploadlogo = multer({
    // 上传文件路径,名字设置
    storage:storage,
    // limits: { }, 限制文件的大小
    //fileFilter:fileFilter //文件的类型, 过滤
});
router.use(uploadlogo.single('logo'));

router.use(bodyparser.json());

router.use((Request,Response)=>{
    console.log('文件：',Request.file);
    console.log('up logo body',Request.body)
    let sessionkey = Request.body.sessionkey;
    let key = Request.body.key;
    let commid = Request.body.id;
    var logoUrl ='/images/commLogo/'+ Request.file.filename
    //首先要判断id和key是否匹配，是否有资格发布动态
    let sql = `SELECT * FROM admins WHERE  temporarycode = '${key}' AND shetuanid = '${commid}'`
    console.log('查询SQL:',sql)
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
                
                let sql2 = `UPDATE shetuan SET profile =? WHERE id = ?`
                let par = [logoUrl,commid];
                mysql.update(sql2,par).then(result=>{
                    console.log('更新logo成功',result)
                    //把logo压缩
                    imagecomress("."+logoUrl);
                    Response.json({
                        code:200,
                        msg:'修改logo成功,重新登录后生效'
                    });
                }).catch(error=>{
                    console.log('更改logo失败',error)
                    Response.send({
                        code:404,
                        msg:'程序员删库跑路了。。。'
                    })
                })
            }
        })
    }).catch(error=>{

    })

    Response.sendfile
    
})


module.exports = router;