import 'package:flutter/material.dart';

class Data extends StatefulWidget {
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  Widget build(BuildContext context) {
    // methods写在这里
    _dataMent();
    _funcDefined();
    _asyncStep();
    return Container(
      child: Text("Dart基础学习"),
    );
  }

  /// 变量声明
  void _dataMent() {
    /// var 一旦声明，类型便会确定，不能再改变
    var t;
    t = 'h1 world';
    // 下面代码在Dart中报错，因为变量t的类型已经确定为String
    // 类型一单确定后不能再更改类型
    // t = 100;

    /// dynamic和Object
    /// Object是Dart所有对象的根基类，所有类型都是Object的子类。
    /// 任何类型的数据都可以赋值给Object声明的对象
    /// dynamic，声明的变量可以赋值给任意对象
    /// 相同点：dynamic和Object声明的变量在后期可以改变赋值类型
    dynamic a;
    Object b;
    a = 'hi world';
    b = 'hello world';
    // 下面代码可以正常显示
    a = 1000;
    b = 999;
    print("$a,$b");

    /// 不同点：dynamic可以提供所有可能的组合。Object声明的对象只能使用Object的属性和方法。
    dynamic c; // 可以提供所有的组合
    Object d; // 访问Object的属性
    c = " ";
    d = " ";
    print(c.length); // no waring
    //print(b.length); // waring: Error: The getter 'length' isn't defined for the class 'Object'.

    /// final & const
    /// 1. 从未打算更改一个变量，使用final & const
    /// 2. 区别：const变量是一个编译时常量，final则是在第一次使用时就被初始化
    /// 3. final & const修饰的变量，其变量类型可以省略
    final str = 'hello world';
    // final String str = 'hello world'
    const str1 = 'hello world1';
    // const String stt1 = 'hello world1'
    print('$str,$str1');
  }

  /// 函数
  void _funcDefined() {
    //  Dart是一种真正的面向对象语言，所以函数即对象，这意味着函数可以赋值给变量或作为参数传递给其他函数。
    //   bool isNoble(int atomicNumber){
    //     return _nobleGases[ atomicNumber ] != null;
    //   }

    // 1. 不指定返回类型，此时默认为dynamic，而是bool
    // isNoble(int atomicNumber){
    //   return _nobleGases[ atomicNumber ] != null;
    // }
    // void test(CALLBACK cb){
    //   print(cb());
    // }
    // 报错，isNobel不是bool对象

    // 2. 函数只包含一个表达式的函数，可以使用简写语法。
    // bool isNoble(int atomicNumber) => _nobleGases[ atomicNumber ] != null;
    // 2.1 函数作为变量
    var say = (str) {
      print(str);
    };
    say('hi world');

    // 2.2 函数作为参数传递
    void execute(var callback) {
      callback();
    }

    execute(() => print('xxx'));

    // 2.3 可选位置参数 []
    String say1(String name, int age, [String city]) {
      var result = '$name 今年 $age';
      if (city != null) {
        result = '$name 今年 $age  住在 $city';
      }
      print(result);
      return result;
    }

    say1('hzy', 21); // hzy 今年 21
    say1('hzy', 21, '南京'); // hzy 今年 21  住在 南京

    // 2.4 可选命名参数 {param1,param2,...}
    void enableFlags({bool bold, bool hidden}) {
      /// .....
    }
    // 调用函数时，可以指定命名参数
    enableFlags(bold: true, hidden: false);
  }

  /// 异步支持
  _asyncStep() {
    print('__________________asyncStep________________');
    // 主要是Future & async/await
    // 1.Future.then
    // 主要场景: 真正的耗时任务，比如一次网络请求
    Future.delayed(new Duration(seconds: 0), () {
      return 'hi world';
    }).then((data) => {print(data)});

    // 2. Future.catchError
    // 主要场景: 捕获错误
    Future.delayed(new Duration(seconds: 0), () {
      throw AssertionError("Error");
    })
        .then((data) => {
              // 执行成果会走这里
              print('success')
            })
        .catchError((e) => {
              // 执行失败会走到这里
              print(e)
            });

    // 3. then中的捕获错误,onError
    // 主要场景: 在then的第二个参数使用onError捕获错误
    Future.delayed(new Duration(seconds: 0), () {
      throw AssertionError('Error');
    }).then((data) => {print('success')}, onError: (e) {
      print(e);
    });

    // 4. Future.whenComplete
    // 主要场景: 无论异步任务执行成功或者失败都需要做一些事情的场景
    Future.delayed(new Duration(seconds: 0), () {
      throw AssertionError('Error');
    })
        .then((data) => {print(data)})
        .catchError((e) => {print(e)})
        .whenComplete(() => {
              // 无论成功还是失败都会走这里
            });

    // 5.Future await
    // 主要场景: 有些时候，我们需要等待多个异步任务都执行结束后才进行一些操作。
    // 比如我们又一个界面，需要先分别从两个网络接口处获取数据，获取成功后，我们需要将两个接口数据进行特定的处理后再显示到UI上。
    Future.wait([
      // 2秒后返回结果
      Future.delayed(new Duration(seconds: 0), () {
        return "hello";
      }),

      Future.delayed(new Duration(seconds: 0), () {
        return 'world';
      }),
    ])
        .then((results) => {print(results[0] + results[1])})
        .catchError((e) => {print(e)});

    /// callback hell
    // 主要场景: 如果代码中存在大量异步逻辑，并且出现大量异步任务依赖其他异步任务的结果时，必然会出现Future.then回调中套回调的情况。
    // 1. 使用Future消除回调地狱
    // login('alice','xxxxxxxxxx').then(() => {
    //   return getUserInfo(id)
    // }).then((userInfo) => {
    //   return saveUserInfo(userInfo)
    // }).then((e) => {
    //   // 执行接下来的操作
    // }).catchError((e) => {
    //   // 错误处理
    //   print(e);
    // });

    // 2. async/await
    // task() async {
    //   try{
    //     String id = await login('alice',"xxxxxx");
    //     String userInfo = await getUserInfo(id);
    //     await saveUserInfo(userInfo);
    //     // 执行接下来的操作
    //   } catch(e) {
    //     // 错误处理
    //     print(e);
    //   }
    // }

  }
}
