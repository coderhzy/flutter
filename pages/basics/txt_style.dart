import 'dart:ui';

import 'package:flutter/material.dart';

class TextStyle1 extends StatefulWidget {
  @override
  _TextStyle1State createState() => _TextStyle1State();
}

class _TextStyle1State extends State<TextStyle1> {
  @override
  Widget build(BuildContext context) {
    // 声明文本样式
    const textStyle = const TextStyle(
      fontFamily: 'Raleway',
    );

    // 使用文本样式
    var buttonText = const Text(
      "Use the font for this text",
      style: textStyle,
    );


    return Scaffold(
        appBar: AppBar(
          title: Text('text测试'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                "Hello world",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                    height: 1.2,
                    fontFamily: "Courier",
                    background: new Paint()..color = Colors.yellow,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed),
              ),
              Text(
                'Line1',
                textAlign: TextAlign.left,
              ),
              Text('Line2' * 4, maxLines: 1, overflow: TextOverflow.ellipsis),
              Text(
                "Hello world",
                textScaleFactor: 1.5,
              ),
              Text.rich(TextSpan(children: [
                TextSpan(text: "Home: "),
                TextSpan(
                  text: "https://flutterchina.club",
                  style: TextStyle(color: Colors.blue),
                ),
              ])),
              DefaultTextStyle(
                //1.设置文本默认样式
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.start,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("hello world"),
                    Text("I am Jack"),
                    Text(
                      "I am Jack",
                      style: TextStyle(
                          inherit: false, //2.不继承默认样式
                          color: Colors.grey),
                    ),
                  ],
                ),
              ),
              buttonText,
            ],
          ),
        ));
  }
}
