const express = require('express');
const fs = require('fs')

var router = express.Router();
const path = require('path')
router.use((Request,Response)=>{
    let ys = Request.query.ys;
    //console.log(Request.url)
    let url = Request.url.split('?')[0];
    //console.log('url',url);
    //let pa = path.parse('images'+url);
    if(ys == '1'){
        // 说明请求的是压缩文件,判断是会否存在这个压缩文件
        let abpa = path.resolve('imagesys'+url);
        let t = fs.existsSync(abpa)
        if(t){
            //let abpa = path.resolve('imagesys'+url)//转化为绝对路径
            Response.sendFile(abpa);
            //console.log('找到压缩图:',url)
        }
        else {
            //不存在还发送原图
            let abpa = path.resolve('images'+url)//转化为绝对路径
            Response.sendFile(abpa)
            //console.log('未找到压缩图:',url)
        }
    } else {
        //发送原图
        let abpa = path.resolve('images'+url);//转化为绝对路径
        Response.sendFile(abpa)
        //console.log('直接打开大图:',url)
    }
    
})

module.exports = router;