var ML = ["就业协会",
    "实习联盟",
    "马克思主义研究会",
    "中国特色社会主义研究会",
    "辩论协会",
    "民俗学社",
    "书评学社",
    "书法协会",
    "汉服社",
    "轮滑协会",
    "触角动漫社",
    "街舞协会",
    "吉他协会",
    "羽帆诗社",
    "影视协会",
    "英语协会",
    "魔术社",
    "铁塔文学社",
    "旅游协会",
    "士兵协会",
    "创意美协",
    "天文社",
    "自行车协会",
    "歌手俱乐部",
    "棋类协会",
    "健美操协会",
    "台球协会",
    "双截棍协会",
    "速写与创作协会",
    "模拟联合国协会",
    "主持人协会",
    "大平原文学社",
    "和式太极拳协会",
    "跆拳道协会",
    "太极拳协会",
    "曳步舞",
    "国际礼仪协会",
    "NGU演讲与表达协会",
    "粤语爱好者协会",
    "阳光长跑协会",
    "红学研究会",
    "国学研究会",
    "三农发展研究会",
    "爱心俱乐部",
    "绿色联盟协会",
    "法律服务中心",
]

const mysql = require('../conmmon/mysql');


for (var i = 0; i < ML.length; i++) {
    // let sql = `UPDATE shetuan SET xiaoqu = ? where name = ?`;
    // let par = ['明伦', ML[i]]
    // mysql.update(sql, par).then(result => {
    //     //console.log(result)
    //     console.log(ML[i],result.affectedRows, "  ", result.changedRows)
    // }).catch(error => {
    //     console.log('错误', ML[i])
    // })

    let sql = `select id ,name from shetuan where name = '${ML[i]}'`
    mysql.query(sql).then(resset =>{
        console.log(resset.length,'    ',resset)
    }).catch(error =>{
        console.log(error)
    })
}