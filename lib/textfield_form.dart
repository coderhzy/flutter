import 'package:flutter/material.dart';

class TextFieldForm extends StatefulWidget {
  @override
  _TextFieldFormState createState() => _TextFieldFormState();
}

class _TextFieldFormState extends State<TextFieldForm> {
  @override
  Widget build(BuildContext context) {

    /// 监控文本变化
    TextEditingController _unameController = TextEditingController();
    initState() {
      //监听输入改变
      _unameController.addListener((){
        print(_unameController.text);
      });
    }


    /// 设置默认值
    TextEditingController _selectionController =  TextEditingController();
    _selectionController.text="hello world!";
    _selectionController.selection=TextSelection(
        baseOffset: 2,
        extentOffset: _selectionController.text.length
    );

    return Scaffold(
      appBar: AppBar(title: Text("textFileForm")),
      body: Center(
        child: Column(
          children: [
            TextField(
              autofocus: true,
              controller: _selectionController, //默认值
              onChanged: initState(),
              decoration: InputDecoration(
                  labelText: '用户名',
                  hintText: '用户名或邮箱',
                  prefixIcon: Icon(Icons.person)),
            ),
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                  labelText: '密码',
                  hintText: '您的登录密码',
                  prefixIcon: Icon(Icons.lock)),
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}
