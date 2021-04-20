import 'package:flutter/material.dart';

// 常用数据类型
class DataType extends StatefulWidget {
  @override
  _DataTypeState createState() => _DataTypeState();
}

class _DataTypeState extends State<DataType> {
  @override
  Widget build(BuildContext context) {
    _numType();
    _stringType();
    return Container(child: Text('常用数据类型，请查看控制台输出'),);
  }
  // 数字类型
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

  // 字符串
  _stringType(){
    String str1 = '字符串',str2 = "双引号"; // 字符串的定义
    String str3 = 'str:$str1 str:$str2'; // 字符串拼接
    String str4 = 'str1:' + str1 + 'str2:' + str2; // 用 + 号进行字符串拼接
    String str5 = '常用数据类型，常用请看控,制台输出';
    print(str3);
    print(str4);
    // 字符串常用方法
    print(str5.substring(0,5)); // 字符串截取
    print(str5.indexOf('类型')); // 获取指定字符串位置
    print(str5.startsWith('用',1)); // 检测字符串是否以指定的前缀开始
    print(str5.replaceAll('常用', '不常用')); // 用于字符串中所有指定替换的数据
    print(str5.contains('控制台')); // 用于检测数组中是否含有指定元素
    print(str5.split(",")); // 在指定分隔符的匹配处拆分字符串并返回子字符串列表 flutter: [常用数据类型，常用请看控, 制台输出]
  }
}