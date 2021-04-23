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
    _assets();
    return Container();
  }


  _assets() async {
    Future<String> loadAsset() async {
      try {
        return await rootBundle.loadString('./assets/config.json');
      } catch (e) {
        print(e);
      }
    }

    String a = await loadAsset();
    print(a);
  }
}
