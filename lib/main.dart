import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 应用名称
      title: 'Flutter Demo',
      initialRoute: '/', // 应用初始路由
      theme: ThemeData(
        // 蓝色主题
        primarySwatch: Colors.blue,
      ),

      /// 路由表注册
      routes: {
        "new_page": (context) => NewRoute(),
        "/":(context) => MyHomePage(title: 'Flutter Demo Home Page'), // 首页路由
        "new_page1": (context) => EchoRoute(),
        "tip2": (context){
          return TipRoute(text: ModalRoute.of(context).settings.arguments);
        }
      },
      onGenerateRoute: (RouteSettings settings){
        return MaterialPageRoute(builder: (context){
          String routeName = settings.name;
          // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由
          // 引导用户登录没其他情况下则是正常打开路由
        });
      },
      // 应用首页路由
      // home: MyHomePage(title: 'First Flutter app'),
    );
  }
}

/// myHomePage
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; // 用于记录按钮点击次数

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4,
            ),
            TextButton(
              child: Text("open new route"),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              // onPressed: () {
              //   // 导航到新路由
              //   Navigator.push(context, MaterialPageRoute(builder: (context) {
              //     return new NewRoute();
              //   }));
              // },

              // 命名路由
              onPressed: (){
                Navigator.pushNamed(context, 'new_page');
              },
            ),
            TextButton(
              child: Text("open new route1"),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                // 导航到新路由
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RouterTestRoute();
                }));
              },
            ),
            TextButton(
              child: Text("命名路由传值"),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              onPressed: (){
                Navigator.of(context).pushNamed('new_page1',arguments: 'hi');
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, // 自增方法,link line 35
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/// 新路由
class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("new route"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}

/// 路由传值
class TipRoute extends StatelessWidget {
  TipRoute({
    Key key,
    @required this.text, // 接受第一个text参数
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('提示'),
      ),
      body: Padding(
          padding: EdgeInsets.all(18),
          child: Center(
            child: Column(
              children: <Widget>[
                Text(text),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context, '我是返回值'),
                  child: Text('返回'),
                ),
              ],
            ),
          )),
    );
  }
}

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        // onPressed: () async {
        //   // 打开TipRoute
        //   var result = await Navigator.push(context,
        //       MaterialPageRoute(builder: (context) {
        //         return TipRoute(
        //           // 路由参数
        //             text: "我是提示xxx");
        //       }));
        //   // 输出TipRoute路由返回结果
        //   print("路由返回值： $result");
        // },
        
        onPressed: () async {
          var result = Navigator.of(context).pushNamed('tip2',arguments: '我是提示金贝');
        },
        child: Text("打开提示页"),
      ),
    );
  }
}

/// 命名路由传值
class EchoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    var args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("命令路由"),
      ),
      body: Center(
        child: Text(args),
      ),
    );
    // 获取路由参数,RouteSetting
    // ....省略无关代码
  }
}
