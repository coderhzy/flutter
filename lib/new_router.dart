import 'package:flutter/material.dart';

/// 新路由

class newRouter extends StatefulWidget {
  @override
  _newRouterState createState() => _newRouterState();
}

class _newRouterState extends State<newRouter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("new route"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}