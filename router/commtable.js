const express = require('express');
var router = express.Router();
const mysql = require('../conmmon/mysql')
const getopenid = require('../conmmon/getopenid')

router.use((Request, Response) => {
    let sql = `SELECT id,name,kinds,xiaoqu from shetuan ORDER BY xiaoqu,kinds `
    mysql.query(sql).then(resset => {
        Response.send({
            code: 200,
            commtable: resset
        })
    })

})

module.exports = router;