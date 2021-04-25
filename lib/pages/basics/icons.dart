
import 'package:flutter/material.dart';

import 'inconfont.dart';
class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String icons = "";
// accessible: &#xE914; or 0xE914 or E914
    icons += "\uE914";
// error: &#xE000; or 0xE000 or E000
    icons += " \uE000";
// fingerprint: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";

    return Scaffold(
      appBar: AppBar(
        title: Text('Icons'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              icons,
              style: TextStyle(
                  fontFamily: "MaterialIcons",
                  fontSize: 24.0,
                  color: Colors.green),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     Icon(
            //       Icons.accessible,
            //       color: Colors.green,
            //     ),
            //     Icon(
            //       Icons.error,
            //       color: Colors.green,
            //     ),
            //     Icon(
            //       Icons.fingerprint,
            //       color: Colors.green,
            //     ),
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  MyIcons.book,
                  color: Colors.purple,
                ),
                Icon(
                  MyIcons.wechat,
                  color: Colors.green,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
