import 'package:flutter/material.dart';

/// 命名路由传值
class EchoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute
        .of(context)
        .settings
        .arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("命令路由"),
      ),
      body: Center(
        child: Text(args),
      ),
    );
    // 获取路由参数,RouteSetting
    // ....省略无关代码
  }
}
