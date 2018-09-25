const express = require('express');
const multer = require('multer');
const path = require('path');
const fs = require('fs');

const router = express.Router();

router.use(multer({dest:path.join(__dirname,'../upload')}).any());


// path = require('path')
// console.log(process.execPath)
// console.log(__dirname)
// console.log(process.cwd())
// console.log(path.join(__dirname,'../image'));


router.use(function (req,res) {
    console.log('上传文件request：',req.query)
    console.log('文件路径',req.file)
    console.log('文件路径',req.files)
    var obj = path.parse(req.files[0].originalname);
    var ext = obj.ext;
    fs.rename(req.files[0].path,req.files[0].path+ext,err=>{
        if(err)
        console.log("a err!",err);
        

    })
    res.send(req.files[0].filename+ext);    
})
module.exports = router;