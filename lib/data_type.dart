import 'package:flutter/material.dart';

/// 常用数据类型
class DataType extends StatefulWidget {
  @override
  _DataTypeState createState() => _DataTypeState();
}

class _DataTypeState extends State<DataType> {
  @override
  Widget build(BuildContext context) {
    _numType();
    _stringType();
    _boolType();
    _listType();
    _mapType();
    _tips();
    return Container(
      child: Text('常用数据类型，请查看控制台输出'),
    );
  }

  /// 数字类型
  void _numType() {
    num num1 = -1.0; // 是数字类型的父类 ， 可以接受浮点类型和整型
    num num2 = 2; // 是数字类型的父类
    int int1 = 3; // 只能接受整数
    double d1 = 1.68; // 双精度浮点数
    print("num:$num1 num:$num2 int:$int1 double:$d1");

    // dart中数据类型转换
    print(num1.abs()); // 求绝对值
    print(num1.toInt()); // 转换成int类型
    print(num1.toDouble()); // 转换成double
  }

  /// 字符串
  _stringType() {
    String str1 = '字符串', str2 = "双引号"; // 字符串的定义
    String str3 = 'str:$str1 str:$str2'; // 字符串拼接
    String str4 = 'str1:' + str1 + 'str2:' + str2; // 用 + 号进行字符串拼接
    String str5 = '常用数据类型，常用请看控,制台输出';
    print(str3);
    print(str4);
    // 字符串常用方法
    print(str5.substring(0, 5)); // 字符串截取
    print(str5.indexOf('类型')); // 获取指定字符串位置
    print(str5.startsWith('用', 1)); // 检测字符串是否以指定的前缀开始
    print(str5.replaceAll('常用', '不常用')); // 用于字符串中所有指定替换的数据
    print(str5.contains('控制台')); // 用于检测数组中是否含有指定元素
    print(str5
        .split(",")); // 在指定分隔符的匹配处拆分字符串并返回子字符串列表 flutter: [常用数据类型，常用请看控, 制台输出]
  }

  /// 布尔类型，Dart是 强 bool类型检查， 只有bool 类型的值是true 才被认为是true
  _boolType() {
    bool success = true, fail = false;
    print(success);
    print(fail);
    print(success || fail); // true
    print(success && fail); // false
  }

  /// List集合
  _listType() {
    print('--------——_listType----');
    // 集合初始的方式 -> 集合是一个泛型
    // 初始化方式一
    List list = [1, 2, 3, 4, '集合']; // 初始化集合并添加元素
    print(list);
    // List<int> list2 = [];
    // list2 = list1; // 这里会报错，因为list1没有定义泛型

    // 初始化集合方式二
    List list3 = [];
    list3.add('list3'); // 通过add方法添加元素
    list3.addAll(list);
    print(list3);

    // 集合的生成函数
    List list4 = List.generate(3, (index) => index * 2);
    print(list4); // [0, 2, 4]

    /// 集合的遍历方式
    for (int i = 0; i < list.length; i++) {
      print(list[i]);
    }
    for (var o in list) {
      print(o);
    }
    list.forEach((val) {
      print(val);
    });

    //list.removeXx,insert,sublist,indexf等
    list.remove('集合');
    print(list);
    list.removeAt(2);
    print(list);
    list.insert(1, 'city');
    print(list);
    List newList = list.sublist(2); // 不改变原集合
    print(newList);
    int index = list.indexOf(4);
    print(index);
  }

  /// map数据类型
  /// map是key和value的相关联对象,key和value都可以是任何类型的对象，并且key是唯一的，如果key是重复的那么后面的key覆盖前面的内容
  _mapType() {
    print('--------——_MapType---------');
    // 初始化map
    // map初始化方式一
    Map names = {'xiaoming': '小明', 'xiaohong': '小宏'};
    print(names);
    // map初始化方式二
    Map ages = {};
    ages['xiaoming'] = 16;
    ages['xiaohong'] = 18;
    print(ages);

    // Map遍历

    // 遍历1
    ages.forEach((key, value) {
      print('$key,$value');
    });

    // 遍历2
    // Map ages2 = ages.map((key,value) {
    //   // 迭代生成一个新Map，意味着map有返回值
    //   return MapEntry(value,key);
    // });
    // print(ages2);

    // 遍历3,返回一个数组
    // 我们想要字符串拼接的时候，如果需要调用方法则使用{}
    for (var key in ages.keys) {
      print('$key ${ages[key]}');
    } // 根据key来遍历

    // keys,values,remove,containsKey
    for (var value in ages.values) {
      print('$value ${ages.values}');
    } // 根据value来遍历

    ages.remove('xiaoming');
    print(ages);

    bool res = ages.containsKey('xiaoming'); // false 因为xiaoming被删除所以false
    bool res1 = ages.containsKey('xiaohong'); // true
    print('$res $res1');
  }

  /// 小知识: dynamic、var、Object三者区别
  /// dynamic: 是所有Dart对象的基础类型，在大多数情况下，通常不直接使用它
  /// 通过它定义的变量会关闭类型检查，这意味这 dynamic x = 'hello'; x.foo()方法
  /// 这段代码静态类型检查不会报错，但是运行会crash，因为x并没有foo()方法
  ///
  /// var: 是一个关键字，意思是"我不关心这里的类型是什么"，系统会自动推断类型runtimeType;而且将这个变量更改为其他的值的时候报错。
  /// var关键字定义就不可以再改变类型。
  ///
  /// Object： 是Dart对象的基类，当你定义： Object o = xxx；这个时候系统会认为o是个对象，你可以调用Object定义的方法。
  /// 因为Object提供了这些方法，但是如果你尝试调用o.foo()时，静态类型检查会进行报错
  /// 综上不难看出 dynamic 与 Object的最大区别是在静态类型检查上
  _tips() {
    print('--------——_MapType---------');
    /// dynamic
    dynamic x = 'hello';
    print(x.runtimeType); // String
    print(x); // hello

    x = 123;
    print(x.runtimeType); // int
    print(x); // 123

    /// var
    var a = 'hello';
    print(a.runtimeType); // String
    print(a); // hello

    // a = 123; var定义以后，不可更改数据类型 value of type 'int' can't be assigned to a variable of type 'String'.

    /// Object
    Object o1 = '111';
    print(o1.runtimeType);
    print(o1);
  }
}
