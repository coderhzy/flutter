import 'package:flutter/material.dart';

class Data extends StatefulWidget {
  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  Widget build(BuildContext context) {
    // methods写在这里
    _DataMent();
    return Container(
      child: Text("Dart基础学习"),
    );
  }

  /// 变量声明
  _DataMent() {
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
}
