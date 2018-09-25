var fs = require('fs');
var gm = require('gm');  // 图片处理模块 npm安装模块并且需要电脑(服务端)安装graphicsmagick软件(gm.exe加入环境变量)

// 缩略图
console.log(__dirname)
fs.exists('./testRUN/original.jpg',f =>{
    console.log(f)
})
gm('./testRUN/original.jpg')
    .resize(250, 250)  // 缩略图  "!"表示不保持宽高比,可能会变形
    .write('./缩略图.jpg', function (err) {
        if (err) {
            console.log('错误:',err);
        }
    });
console.log('end')
// 裁剪图片  141,96表示裁剪大小  152,,181表示裁剪位置
//gm("./原图.jpg").crop(141,96,152,181).write("./裁剪.jpg",function(err){

//});
/*
resize函数, 详细参数
resize {w}x{h} {%} {@} {!} {<} {>}
这里需要注意第3个参数

%
表示按照width/height的百分比, resize(70, 0, '%')表示宽度为原先的70%

@
(×_×)表示不明白，貌似可以限制压缩文件的filesize, gm文档上是这样描述的：
Use @ to specify the maximum area in pixels of an image.

! 
表示强制width/height, resize(70, 70, '%')表示输出图片尺寸70x70，图片可能变形

^
表示最小width/height, resize(70,70,'^')表示width/height最小不能小于70px

>
表示只有源图片的width or height超过指定的width/height时，图片尺寸才会变。
如：源图片大小：640x640, resize(1000, 1000)最终图片尺寸不变。

<
跟>正好相反，表示只有源图片的width or height小于指定的width/height时，图片尺寸才会变
*/