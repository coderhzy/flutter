import 'package:flutter/material.dart';

/// context
class Context extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Context测试'),
      ),
      body: Container(
        child: Builder(builder: (context){
          /// 在Widget树中向上查找最近的父级Scaffold Widget
          Scaffold scaffold = context.findAncestorWidgetOfExactType<Scaffold>();
          // 直接返回 AppBar的title， 此处实际上是Text("Context测试")
          return (scaffold.appBar as AppBar).title;
        }),
      ),
    );
  }
}