import 'package:flutter/material.dart';

class TextFieldForm extends StatefulWidget {
  @override
  _TextFieldFormState createState() => _TextFieldFormState();
}

class _TextFieldFormState extends State<TextFieldForm> {
  // 定义输入框聚焦状态
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  // 监听焦点状态改变事件
  FocusNode focusNode3 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  Widget build(BuildContext context) {
    /// 监控文本变化
    TextEditingController _unameController = TextEditingController();
    initState() {
      //监听输入改变
      _unameController.addListener(() {
        print(_unameController.text);
      });
    }

    /// 设置默认值
    TextEditingController _selectionController = TextEditingController();
    _selectionController.text = "hello world!";
    _selectionController.selection = TextSelection(
        baseOffset: 2, extentOffset: _selectionController.text.length);


    // 监听焦点状态改变事件 是否聚焦 true/false
    focusNode3.addListener(() {
      print(focusNode3.hasFocus);
    });

    return Scaffold(
      appBar: AppBar(title: Text("textFileForm")),
      body: Center(
        child: Column(
          children: [
            TextField(
              autofocus: true,
              controller: _selectionController, //默认值
              onChanged: initState(),
              // focusNode: focusNode1,
              focusNode: focusNode3,
              decoration: InputDecoration(
                  labelText: '用户名',
                  hintText: '用户名或邮箱',
                  prefixIcon: Icon(Icons.person),
              // 未获得焦点下划线设置为红色
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red)
              ),
              // 获得焦点下划线设置为蓝色
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue)
              )),
            ),
            TextField(
              autofocus: true,
              focusNode: focusNode2,
              decoration: InputDecoration(
                  labelText: '密码',
                  hintText: '您的登录密码',
                  prefixIcon: Icon(Icons.lock)),
              obscureText: true,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "电子邮件地址",
                  prefixIcon: Icon(Icons.email),
                  border: InputBorder.none // 隐藏下划线
              ),

            ),
            Builder(builder: (context){
              return Column(
                children: [
                  ElevatedButton(
                    child: Text('移动焦点'),
                    onPressed: () {
                      // 将焦点从第一个TextField移动到第二个TextField
                      // 这是一种写法
                      // FocusScope.of(context).requestFocus(focusNode2);
                      // 这是第二种写法
                      if(null == focusScopeNode){
                        focusScopeNode = FocusScope.of(context);
                      }
                      focusScopeNode.requestFocus(focusNode2);
                    },
                  ),
                  ElevatedButton(onPressed: (){
                    // 当所有编辑框都失去焦点时键盘收起
                    focusNode1.unfocus();
                    focusNode2.unfocus();
                  }, child: Text('隐藏键盘'))
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
