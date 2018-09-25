var fs = require('fs');
var gm = require('gm');  // 图片处理模块 npm安装模块并且需要电脑(服务端)安装graphicsmagick软件(gm.exe加入环境变量)
var path = require('path')

function imagecomress(ipath){
    console.log('当前路径',__dirname)
    console.log('开始压缩...')
    let newpath = path.join(ipath,'../../../imagesys/activity');
    let ext = path.basename(ipath)
    let imagepath = path.join(newpath,ext);
    //console.log(imagepath)
    //console.log(ipath)
    //图片压缩
    gm(ipath).resize(250,250).write(imagepath, err =>{
        if(err)console.log('压缩图片出现错误:',err)
        else  console.log('压缩成功',imagepath)
    })
}

module.exports=imagecomress;
//imagecomress("images/activity/1534772358936.jpg")