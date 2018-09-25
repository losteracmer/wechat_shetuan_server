const encode = require('./encode')
const createncrytedPasswd = require('./createncryptedPasswd')
const mysql = require('../conmmon/mysql')
function setPassword(accout,password){
    let encrytedpassword = createncrytedPasswd(password)
    let sql = `UPDATE admins SET password = ? where account = ?`;
    let par = [encrytedpassword,accout]
    mysql.update(sql ,par).then(result =>{
        console.log('update password success!',result)
    }).catch(error=>{
        console.log('update password fail!',error)
    })
}

setPassword('lyh','lyh')

function createAdminAccount(account,password,shetuanid,callback){
    let encrytedpassword = createncrytedPasswd(password);
    let sql = `INSERT INTO admins(account,password,shetuanid) VALUES(?,?,?)`
    let par = [account,encrytedpassword,shetuanid];
    mysql.insert(sql,par).then(result=>{
        console.log('创建社团账号成功',result);
        if(callback) callback()
    }).catch(error=>{
        console.log('创建社团账号失败:',error);
    })
}

module.exports = {
    setPassword:setPassword,
    createAdminAccount:createAdminAccount
}
createAdminAccount('sst','sst','00000001')