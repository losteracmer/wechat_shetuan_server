const express = require('express');
var router = express.Router();
const mysql = require('../conmmon/mysql');
const kinds = require('../config').commkinds;
router.use((Request,Response)=>{
    console.log('getkinds:->',Request.query)
    Response.send({
        code:200,
        kinds:kinds
    })
})
module.exports = router;