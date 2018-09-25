const mysql = require('./conmmon/mysql')
const express = require('express')

var app = express();

var path = require('path');  
var fs = require('fs');  

//使用nodejs自带的http、https模块  
var http = require('http');  
var https = require('https');  
  
//根据项目的路径导入生成的证书文件  
  
var privateKey  = fs.readFileSync(path.join(__dirname, './nginx/supersst.com.key'), 'utf8');  
var certificate = fs.readFileSync(path.join(__dirname, './nginx/supersst.com-ca-bundle.crt'), 'utf8');  
var credentials = {key: privateKey, cert: certificate};  
  
var httpServer = http.createServer(app);  
var httpsServer = https.createServer(credentials, app);  

http.createServer()
//可以分别设置http、https的访问端口号  
var PORT = 80;  
var SSLPORT = 443;  
  
//创建http服务器  
httpServer.listen(PORT, function() {  
    console.log('HTTP Server is running on: http://localhost:%s', PORT);  
});  
  
//创建https服务器  
httpsServer.listen(SSLPORT, function() {  
    console.log('HTTPS Server is running on: https://localhost:%s', SSLPORT);  
});  
  
//登录获取sessionkey
app.use('/login',require('./router/login'));

//获取静态文件
//app.use( '/images', express.static( __dirname + '/images') );

app.use('/images',require('./router/staticrouter'))
// app.use( '/images',(Request,Response)=>{
//     if(Request.query.ys == 1){
//         express.static(__dirname,'imagesys');
//     } else express.static(__dirname,'images');
// })

//获取navbar社团分类列表
app.use('/getkinds',require('./router/getkinds'));

//获取社团详细信息
app.use('/getcommInfo',require('./router/getcommInfo'));

//获取社团列表
app.use('/getcommlist',require('./router/getcommList'));

//获取我的关注
app.use('/mycomm',require('./router/mycomm'));

//更新用户Infor
app.use('/setuserInfo',require('./router/setuserInfo'));

//社团管理登录
app.use('/admin',require('./router/admin'));

//文件上传测试接口
app.use('/upload',require('./router/upload'));

//获取图片列表
app.use('/getimageslist',require('./router/setnewac'))

//活动列表
app.use('/activities',require('./router/activities'));

//点赞接口
app.use('/dianzan',require('./router/dianzan'));

//社团关注接口
app.use('/guanzhu',require('./router/stguanzhu'));

//社团搜索接口
app.use('/searchcomm',require('./router/searchcomm'));

//社团上传logo接口
app.use('/uploadlogo',require('./router/uploadlogo'));

//社团信息修改接口
app.use('/changecomm',require('./router/changecomm'));

//社团信息一览表
app.use('/commtable',require('./router/commtable'))

//提交反馈接口
app.use('/submitmsg',require('./router/submitmsg'));

//账号操作
app.use('/operateaccount',require('./router/operateaccount'));

//获取更新信息
app.use('/getupdatemsg',require('./router/getupdatemsg'));

//当请求异常时
app.use((Request,Response)=>{
    console.log('异常的请求:','host:',Request.host,'hostname:',Request.hostname,'method::',Request.method,'path:',Request.path)
    Response.send({
        code:404,
        message:'非法请求'
    })
})