######其实真没啥好写的，要不是为了没有那个worning

管理授权
    高级管理（3）可以分配给普通成员权限，1，可以代表此社团发动态，2，可以管理申请

申请信息提交
    在社团详情页，要查询用户此时对这个社团是否申请过，申请是否在审核中（至少在提交的时候判断是否已经存在这个申请）
    管理可以给申请做回复信息（对于收费的社团）不做直接的决策
    申请状态：1，正在等待审核，0，已经被拒绝（此时可以重新发起申请）  2，收到回复，3通过申请（此时应该更新数据库社团成员）


对于已知的社团成员，可以给社团分配一个个人注册码，在注册页面直接输入注册码就能不通过申请直接加入社团


//新需求
热门：不应该设置hot，应该根据关注人数前10来决定是否为热门

//社团管理登录
密码的加密问题，md5，混淆加盐，数据库不能存明文
表格== 账号，密码key ， 社团权限


社团用户插入，自动关注社联，这可以用触发器实现，
还有，社团关注数量的更新，触发器

精品活动，，一些空数据，在数据库中设置为‘NULL’

9-25
往后更改方向

1 活动页时间显示  多少。。前
    各种logo
    每个操作的logo
2 社联 分开两个方向 新区老区，权限不同
    管理页重构。动态加载操作选项
3 活动页重新排版
    添加顶部swiper
    后台 活动请求重写，添加视图（点赞需要点开后处理）
    活动详情页
        1 评论功能（置底）
        2 点赞移到此处
    