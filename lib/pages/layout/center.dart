import 'package:flutter/material.dart';

class Factor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Factor'),
      ),
      body: Column(
        children: [
          DecoratedBox(
            // 当widthFactor或heightFactor为null时组件的宽高将会占用尽可能多的空间，
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
              child: Text("xxx"),
            ),
          ),
          DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
              widthFactor: 1,
              heightFactor: 1,
              child: Text("xxx"),
            ),
          )
        ],
      ),
    );
  }
}
