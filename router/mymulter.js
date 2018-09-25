const multer = require('multer'),
    path = require('path'),
    express = require('express'),
    random = require('../utils/random')
const router = express.Router();

// 上传路径处理 ,上传文件重命名
let storage = multer.diskStorage({
    // 上传路径处理
    // destination: `${process.cwd()}/public`,
    
    destination: path.join(__dirname, '../images/activity'),
    filename: function (req, file, callback) { // file上传的文件信息, callback 重命名处理
        // console.log(file);
        // 重命名处理
        let filename = (file.originalname).split('.'); //['文件名','文件后缀'] eg: 1.png
        let rdstr = random(false,6); //防止因为时间过短，而产生了文件相同的名字，当然这也可能会出现相同的情况，不过概率极其小
        callback(null, `${Date.now()}-${rdstr}-.${filename[filename.length-1]}`); //参数1 null ,参数2 时间戳+后缀
    }
});
let fileFilter = function (req, file, cb) {
    // 当设置这个判断后  没允许的 && 没设置的类型 拒绝
    // console.log(file.mimetype);   //mimetype文件类型
    if (file.mimetype === 'image/gif' || file.mimetype === 'image/jpeg' || file.mimetype === 'image/jpg') {
        cb(null, true); //允许
    } else {

        console.log('保存失败')
        req.err = '失败';
        cb(null, false);
    }
}

// let limits = function (req, file, cb) {
//     if (file.fieldSize > 1000) {
//         console.log('文件太大')
//         cb(null, false)
//     } else {
//         console.log('文件合适')
//         cb(null, true)
//     }
// }
let upload = multer({
    // 上传文件路径,名字设置
    storage: storage,
    //limits: limits, // 限制文件的大小
    //fileFilter: fileFilter //文件的类型, 过滤
});

module.exports = upload;