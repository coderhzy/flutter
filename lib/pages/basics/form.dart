import 'package:flutter/material.dart';

class TextFieldFormVal extends StatefulWidget {
  @override
  _TextFieldFormValState createState() => _TextFieldFormValState();
}

class _TextFieldFormValState extends State<TextFieldFormVal> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form test"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: _formKey,
          // 设置globalKey，用于后面获取FormState 开启自动校验
          child: Column(
            children: [
              TextFormField(
                  autofocus: true,
                  controller: _unameController,
                  decoration: InputDecoration(
                      labelText: "用户名",
                      hintText: "用户名或邮箱",
                      icon: Icon(Icons.person)),
                  // 校验用户名
                  validator: (v) {
                    return v.trim().length > 0 ? null : "用户名不能为空";
                  }),
              TextFormField(
                  autofocus: true,
                  controller: _pwdController,
                  decoration: InputDecoration(
                      labelText: "密码",
                      hintText: "您的登录密码",
                      icon: Icon(Icons.lock)),
                  obscureText: true,
                  // 隐藏输入显示
                  //校验密码
                  validator: (v) {
                    return v.trim().length > 5 ? null : "密码不能少于6位";
                  }),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Builder(builder: (context){
                          return RaisedButton(
                            padding: EdgeInsets.all(14.0),
                            child: Text("登录"),
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            onPressed: () {
                              print(Form.of(context)); // null 此处为修改后的代码，在Builder中去构建可以获取到Widget树的context
                              // 通过_formKey.currentState 获取FormState后，
                              // 调用validate()方法校验用户名密码是否合法，校验
                              // 通过后再提交数据。
                              // if ((_formKey.currentState as FormState).validate()) {
                              //   //验证通过提交数据
                              // }
                            },
                          );
                        },))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
