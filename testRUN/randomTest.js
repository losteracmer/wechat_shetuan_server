const multer = require('multer'),
    path = require('path'),
    express = require('express'),
    random = require('../utils/random')

let rdstr = random(false,6); 
console.log(rdstr)