var express = require('express');
var app = express();
var multer = require('multer');
var random = require('../utils/random')
var mymulter = require('./mymulter')
var imagecompress = require('../utils/imagecompress')// 图片压缩
var router = express.Router()
var storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, '__dirname');
    },//指定硬盘空间的路径，这里可以是任意一个绝对路径，这里为了方便所以写了个相对路径
    filename: function (req, file, cb) {
        let rdstr = random(true,6); //防止因为时间过短，而产生了文件相同的名字，当然这也可能会出现相同的情况，不过概率极其小
        cb(null,Date.now()+ '-' + rdstr+ '-' + file.fieldname   + '.jpg');//指定文件名和扩展名
    }
});//设置用硬盘的存储方法

// let fileFilter = function(req,file,cb){
//     // 当设置这个判断后  没允许的 && 没设置的类型 拒绝
//     // console.log(file.mimetype);   //mimetype文件类型
//     if(file.mimetype === 'image/gif'){
//         cb(null,true);//允许
//     }else{
//         req.err = '失败';
//         cb(null,false);
//     }
// }
let upload = multer({
    // 上传文件路径,名字设置
    storage:storage,
    // limits: { }, 限制文件的大小
    //fileFilter:fileFilter //文件的类型, 过滤
});
router.use(mymulter.single('data'));

router.use((Request,Response)=>{
    console.log('文件：',Request.file);
    console.log('query:',Request.query)
    var sessionkey = Request.query.sessionkey;

    imagecompress('./images/activity/'+Request.file.filename);

    Response.send('/images/activity/'+Request.file.filename);
    Response.sendfile
    
})
router.get('get',(Request,Response)=>{
    console.log('query:',Request.query)
    Response.send({code:200})
})

module.exports = router;