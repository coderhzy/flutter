import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    FlatButton(
      color: Colors.blue,
      highlightColor: Colors.blue[700],
      colorBrightness: Brightness.dark,
      splashColor: Colors.grey,
      child: Text("Submit"),
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      onPressed: () {},
    );

    return Scaffold(
      appBar: AppBar(title: Text('button')),
      body: Center(
        child: Column(
          children: [
          // 涟漪动画
            ElevatedButton(onPressed: () {}, child: Text('normal')),
            // 扁平
            TextButton(onPressed: (){},child: Text('normal1'),),
            // 有默认边框
            OutlinedButton(onPressed: (){},child: Text('normal2'),),
            // IconButton
            IconButton(icon: Icon(Icons.thumb_down),onPressed: (){}),
            IconButton(icon: Icon(Icons.thumb_up),onPressed: (){}),
            // 带图标的按钮
            ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.send), label: Text('发送')),
            ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.add), label: Text('添加')),
            ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.details), label: Text('详情')),
            // 自定义按钮
            FlatButton(onPressed: (){}, child: Text('normal')),
          ],
        ),
      ),
    );
  }
}
