

import 'package:flutter/material.dart';

/// 路由传值
class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        // onPressed: () async {
        //   // 打开TipRoute
        //   var result = await Navigator.push(context,
        //       MaterialPageRoute(builder: (context) {
        //         return TipRoute(
        //           // 路由参数
        //             text: "我是提示xxx");
        //       }));
        //   // 输出TipRoute路由返回结果
        //   print("路由返回值： $result");
        // },

        onPressed: () async {
          Navigator.of(context).pushNamed('tip2', arguments: '我是提示金贝');
        },
        child: Text("打开提示页"),
      ),
    );
  }
}