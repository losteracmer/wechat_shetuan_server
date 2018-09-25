const express = require('express');
var router = express.Router();
const mysql = require('../conmmon/mysql');
const updatemsg = require('../config').updatemsg;
router.use((Request,Response)=>{
    console.log('getupdatemsg:->',Request.query)
    Response.send({
        code:200,
        updatemsg:updatemsg
    })
})
module.exports = router;