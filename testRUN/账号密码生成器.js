const mysql = require('../conmmon/mysql')
const setPW = require('../utils/setPassword').createAdminAccount;
const random = require('../utils/random')

function doit(resset , now ,len){
    if(now == len) return ;
    let account = resset[now].id;
    let name = resset[now].name;
    let xiaoqu = resset[now].xiaoqu;
    let radStr = random(false,3);

    console.log(now,': 账号:',account,'密码:',radStr,'社团:',name,'校区:',xiaoqu);

    setPW(account,radStr,account,doit(resset,now+1,len))
}

let sql = `select id , name ,xiaoqu from shetuan`
mysql.query(sql).then(resset =>{
    let length = resset.length;
    console.log('总长度:',length)
    doit(resset,0,length)
}).catch(error =>{
    console.log('错误：',error)
})