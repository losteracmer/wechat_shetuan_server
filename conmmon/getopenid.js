//这个模块的作用就是，没作用，当然是不可能的，就是通过用户的sessionkey，从数据库里把openid找到，或者说把用户数据找到吧
mysql = require('./mysql')

var getopenid = function (sessionkey, callback) {
    console.log('getopenid moudle: sessinkey:',sessionkey)
    if (!sessionkey || sessionkey == 'undefined'||sessionkey == undefined || sessionkey == null || sessionkey == 'null') {
        console.log('传入的sessionkey非法！！')
        callback(null)
        return;
    } else {
        
        let sql = `SELECT openid FROM user WHERE sessionkey = '${sessionkey}'`

        mysql.query(sql).then(resset => {
            if (resset.length == 0) {
                callback(null);
            }
            if (resset.length > 1) {
                //能查到多个不同的openid值，理论上是不可能的，不过还是做个判断吧
                console.log('发生了不可能事件，一个sessionkey查出了多个openid')
            } else {
                //能查到openid则把值传给回调函数
                callback(resset[0].openid)
            }
        }).catch(error => {
            //查询错误
            console.log('获取openid出现了错误',error)
            callback(null)
        })
    }

}
module.exports = getopenid;