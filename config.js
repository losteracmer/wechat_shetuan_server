var mysqlConfig = {
    host: 'localhost',
    user: 'root',
    password: '445247721',
    port: '3306',
    database: 'wechatdb',
    multipleStatements: true,
    charset:'utf8mb4_general_ci'
};


var config = 
{
    //mysql的配置
    mysqlConfig:mysqlConfig,

    //appid
    appid:'wxa32880bd5ddc2a31',
    //secret
    secret:'fcf01a9fed32431c09682c3fa4875f05',

    //社团分类信息
    commkinds:['热    门','关    注','文化体育','学术科技','创新创业','志愿公益','思想政治','自律互助'],

    //更新信息
    updatemsg:{
        name:'这里是一般人不会点开看的更新信息',
        id:1,
        time:'2018-9-20 1:00',
        text:['一点了，终于修复一个bug，为自己加个鸡腿','修复社团页滑动请求错误分类的bug']
    }
}

module.exports = config;