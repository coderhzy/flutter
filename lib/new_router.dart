import 'package:flutter/material.dart';

/// 新路由

class NewRouter extends StatefulWidget {
  @override
  _NewRouterState createState() => _NewRouterState();
}

class _NewRouterState extends State<NewRouter> {
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