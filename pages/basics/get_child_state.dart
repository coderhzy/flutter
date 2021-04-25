import 'package:flutter/material.dart';

class GetChildState extends StatefulWidget {
  @override
  _GetChildStateState createState() => _GetChildStateState();
}

/// 方法一
class _GetChildStateState extends State<GetChildState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("子树中获取State对象"),
      ),
      body: Center(
        child: Builder(builder: (context) {
          return ElevatedButton(
            onPressed: () {
              // 查找父级最近的Scaffold对应的ScaffoldState对象
              ScaffoldState _state = context.findAncestorStateOfType<
                  ScaffoldState>();
              //调用ScaffoldState的showSnackBar来弹出SnackBar
              _state.showSnackBar(
                SnackBar(
                  content: Text("我是SnackBar"),
                ),
              );
            },
            child: Text("显示SnackBar"),
          );
        }),
      ),
    );
  }
}