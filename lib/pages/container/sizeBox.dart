import 'package:flutter/material.dart';

class SizedBoxOne extends StatelessWidget {
  Widget redBox = DecoratedBox(decoration: BoxDecoration(color: Colors.green));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sizeBox'),
      ),
      body: Center(
        child: Row(
          children: [
            SizedBox(
              // 等同
              //   ConstrainedBox(
              //     constraints: BoxConstraints.tightFor(width: 80.0,height: 80.0),
              //     child: redBox,
              //   )
                width: 80.0,
                height: 80.0,
                child: redBox
            )
          ],
        ),
      ),
    );
  }
}
