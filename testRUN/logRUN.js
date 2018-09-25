let fs = require('fs');
 
let options = {
  flags: 'a',     // append模式
  encoding: 'utf8',  // utf8编码
};
 
let stdout = fs.createWriteStream('./stdout.log', options);
let stderr = fs.createWriteStream('./stderr.log', options);
 
// 创建logger
let logger = new console.Console(stdout, stderr);
 
for (let i = 0; i < 100; i++) {
  logger.log(`log message ${i}`);
  logger.error(`err message ${i}`);
}