import 'package:flutter/material.dart';

class PaddingMargin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaddingMargin'),
      ),
      body: Center(
        child: Column(
          children: [
            // margin 是外部补白，padding是内部补白
            Container(
              margin: EdgeInsets.all(20.0), //容器外补白
              color: Colors.orange,
              child: Text("Hello world!"),
            ),
            Container(
              padding: EdgeInsets.all(30.0), //容器内补白
              color: Colors.orange,
              child: Text("Hello world!"),
            ),
            // 本质上margin和padding都是通过Padding组件来实现的
            Padding(
              padding: EdgeInsets.all(20.0),
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.orange),
                child: Text("Hello world!"),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.orange),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Hello world!"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
