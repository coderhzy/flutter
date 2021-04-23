import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class ziYuan extends StatefulWidget {
  @override
  _ziYuanState createState() => _ziYuanState();
}

class _ziYuanState extends State<ziYuan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        color: Colors.blue,
        child: Text('资源加载'),
      )
    );
  }


  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/config.json');
  }
}
