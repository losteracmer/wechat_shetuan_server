var getid = require('../conmmon/getopenid')
const mysql = require('../conmmon/mysql')

let sessionkey = 'vcauTojrhIRgHS3zvq3plQ==s'

getid(sessionkey, res => {
    if (res == null) {
        console.log('没有查到sessionkey，提示用户登录')
    } else {
        //再通过得到的openid查用户信息
        console.log('返回的openid是:', res)
        let openid = res.openid
        console.log('openid:', openid)
        let sql = `select * from user where openid = '${openid}'`
        mysql.query(sql).then(resset => {
            console.log(resset);
        })
    }
})
//测试成功！

try {
    var str = 'sssssstttttt';
    //str = str / 10;
} catch (error) {
    console.log('显然error')
}
var str = 'aaaaaaaa';
console.log(str)