


任务队列
    所有同步任务都在主线程上执行 形成一个执行栈（execution context stack）
    主线程之外 还存在一个"任务队列"（task queue） 只要异步任务有了运行结果 就在"任务队列"之中放置一个事件
    一旦"执行栈"中的所有同步任务执行完毕 系统就会读取"任务队列" 看看里面有哪些事件 那些对应的异步任务 于是结束等待状态 进入执行栈 开始执行
    主线程不断重复上面的第三步

    只要主线程空了 就会去读取"任务队列" 这就是JavaScript的运行机制 这个过程会不断重复



事件和回调函数
    "任务队列"是一个事件的队列（也可以理解成消息的队列） IO设备完成一项任务 就在"任务队列"中添加一个事件 表示相关的异步任务可以进入"执行栈"了
        主线程读取"任务队列" 就是读取里面有哪些事件
    "任务队列"中的事件 除了IO设备的事件以外 还包括一些用户产生的事件（比如鼠标点击 页面滚动等等）
    只要指定过回调函数 这些事件发生时就会进入"任务队列" 等待主线程读取
    所谓"回调函数"（callback） 就是那些会被主线程挂起来的代码 异步任务必须指定回调函数 当主线程开始执行异步任务 就是执行对应的回调函数
    "任务队列"是一个先进先出的数据结构 排在前面的事件 优先被主线程读取
    主线程的读取过程基本上是自动的 只要执行栈一清空 "任务队列"上第一位的事件就自动进入主线程
    但是 由于存在后文提到的"定时器"功能 主线程首先要检查一下执行时间 某些事件只有到了规定的时间 才能返回主线程




Event Loop
    主线程从"任务队列"中读取事件 这个过程是循环不断的 所以整个的这种运行机制又称为Event Loop（事件循环）
    主线程运行的时候 产生堆（heap）和栈（stack） 栈中的代码调用各种外部API 它们在"任务队列"中加入各种事件（click load done）
        只要栈中的代码执行完毕 主线程就会去读取"任务队列" 依次执行那些事件所对应的回调函数
    执行栈中的代码（同步任务） 总是在读取"任务队列"（异步任务）之前执行


定时器
    除了放置异步任务的事件 "任务队列"还可以放置定时事件 即指定某些代码在多少时间之后执行 这叫做"定时器"（timer）功能 也就是定时执行的代码
    定时器功能主要由setTimeout()和setInterval()这两个函数来完成 它们的内部运行机制完全一样 区别在于前者指定的代码是一次性执行 后者则为反复执行

    setTimeout()接受两个参数 第一个是回调函数 第二个是推迟执行的毫秒数
        如果将setTimeout()的第二个参数设为0 就表示当前代码执行完（执行栈清空）以后 立即执行（0毫秒间隔）指定的回调函数
    setTimeout(fn, 0)的含义是指定某个任务在主线程最早可得的空闲时间执行 也就是说 尽可能早得执行
        它在"任务队列"的尾部添加一个事件因此要等到同步任务和"任务队列"现有的事件都处理完才会得到执行

    HTML5标准规定了setTimeout()的第二个参数的最小值（最短间隔） 不得低于4毫秒 如果低于这个值 就会自动增加
        在此之前老版本的浏览器都将最短间隔设为10毫秒
    另外 对于那些DOM的变动（尤其是涉及页面重新渲染的部分） 通常不会立即执行 而是每16毫秒执行一次
        这时使用requestAnimationFrame()的效果要好于setTimeout()
    需要注意的是 setTimeout()只是将事件插入了"任务队列" 必须等到当前代码（执行栈）执行完 主线程才会去执行它指定的回调函数
        要是当前代码耗时很长 有可能要等很久 所以并没有办法保证 回调函数一定会在setTimeout()指定的时间执行




Node的Event Loop
    Node 也是单线程的Event Loop 但是它的运行机制不同于浏览器环境
    Node将不同的任务分配给不同的线程 形成一个Event Loop（事件循环） 以异步的方式将任务的执行结果返回（Node底层为多线程）

    Node提供了另外两个与"任务队列"有关的方法 process.nextTick setImmediate

    process.nextTick方法可以在当前"执行栈"的尾部 下一次Event Loop（主线程读取"任务队列"）之前触发回调函数
        也就是说 它指定的任务总是发生在所有异步任务之前
    setImmediate方法则是在当前"任务队列"的尾部添加事件
        也就是说 它指定的任务总是在下一次Event Loop时执行 这与setTimeout(fn, 0)很像

    

    process.nextTick(function A() {
        console.log(1);
        process.nextTick(function B(){console.log(2);});
    });

    setTimeout(function timeout() {
        console.log('TIMEOUT FIRED');
    }, 0)

    执行结果
        // 1
        // 2
        // TIMEOUT FIRED

    上面代码中 由于process.nextTick 方法指定的回调函数 总是在当前"执行栈"的尾部触发 所以不仅函数A比setTimeout指定的回调函数timeout先执行
        而且函数B也比timeout先执行 这说明如果有多个process.nextTick语句（不管它们是否嵌套）将全部在当前"执行栈"执行

    setImmediate(function A() {
        console.log(1);
        setImmediate(function B(){console.log(2);});
    });

    setTimeout(function timeout() {
    console.log('TIMEOUT FIRED');
    }, 0);

    上例运行结果不确定
        setImmediate与setTimeout(fn, 0)各自添加了一个回调函数A和timeout 都是在下一次Event Loop触发

    process.nextTick setImmediate的一个重要区别
        多个process.nextTick语句总是在当前"执行栈"一次执行完
        多个setImmediate可能则需要多次loop才能执行完

    

    // 案例 1
    i =0
    process.nextTick(function foo() {
        console.log(i++)
        process.nextTick(foo);
    });

    上例为一个死循环 因为每次执行完 console.log(i++) 后 process.nextTick(foo) 又在 "执行栈"（主线程）尾部添加了foo()
        而foo()中又有 process.nextTick(foo)

    // 案例 2
    i =0
    function foo () {
        setTimeout(() => {
            console.log(i++)

            foo()
        }, 0)
    }

    foo()

    上例同样也为一个死循环 因为每次执行完 console.log(i++)后又重复执行foo()
        而foo()中又有 setTimeout 它将里面的回调函数又添加到了"任务队列"

    案例1与案例2的区别
        前者是把回调添加到了"执行栈"（主线程）尾部 先于所有异步任务之前
        后者是把回调添加到了"任务队列"中 需要等到"执行栈"（主线程）的所有同步任务执行完毕 系统才会读取"任务队列"中的任务

    另外 由于process.nextTick指定的回调函数总是在"执行栈"（主线程）尾部触发 而setImmediate指定的是在下次"事件循环"触发
        所以很显然 前者总是比后者发生得早 而且执行效率也高（因为不用检查"任务队列"）
