import 'package:flutter/material.dart';

class TextFieldForm extends StatefulWidget {
  @override
  _TextFieldFormState createState() => _TextFieldFormState();
}

class _TextFieldFormState extends State<TextFieldForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("textFileForm")
      ),
      body: Center(
        child: Column(
          children: [
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: '用户名',
                hintText: '用户名或邮箱',
                prefixIcon: Icon(Icons.person)
              ),
            ),            TextField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: '密码',
                hintText: '您的登录面膜',
                prefixIcon: Icon(Icons.lock)
              ),
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}
