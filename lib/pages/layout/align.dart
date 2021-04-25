import 'package:flutter/material.dart';

class AlignOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Align'),
        ),
        body: Container(
          height: 120.0,
          width: 120.0,
          color: Colors.blue[50],
          child: Align(
            alignment: Alignment.topRight,
            child: FlutterLogo(
              size: 60,
            ),
          ),
        ));
  }
}

class AlignTwo extends StatelessWidget {
  //右上角
  static const Alignment topRight = Alignment(1.0, -1.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Align'),
        ),
        body: Align(
          // widthFactor: 2,
          // heightFactor: 2,
          alignment: Alignment.topRight,  // 右上角
          child: FlutterLogo(
            size: 60,
          ),
        ));
  }
}

class AlignThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Align'),
        ),
        body:  Align(
          widthFactor: 2,
          heightFactor: 2,
          alignment: Alignment(2,0.0),
          child: FlutterLogo(
            size: 60,
          ),
        ));
  }
}


class AlignFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Align'),
        ),
        body:  Align(
          widthFactor: 2,
          heightFactor: 2,
          alignment: Alignment(2,0.0),
          child: FlutterLogo(
            size: 60,
          ),
        ));
  }
}