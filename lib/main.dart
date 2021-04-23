import 'package:first_flutter_app/button.dart';
import 'package:first_flutter_app/get_child_state.dart';
import 'package:first_flutter_app/load_image.dart';
import 'package:flutter/material.dart';
import 'package:first_flutter_app/zi_yuan.dart';
import 'package:first_flutter_app/random_english.dart';
import 'package:first_flutter_app/new_router.dart';
import 'package:first_flutter_app/routing_value_tip.dart';
import 'package:first_flutter_app/routing_value_test.dart';
import 'package:first_flutter_app/route_name.dart';
import 'package:first_flutter_app/state_less_widget.dart';
import 'package:first_flutter_app/context.dart';
import 'package:first_flutter_app/recrement_counter.dart';
import 'package:first_flutter_app/cpuertion.dart';
import 'package:first_flutter_app/txt_style.dart';

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
      initialRoute: '/',
      // 应用初始路由
      theme: ThemeData(
        // 蓝色主题
        primarySwatch: Colors.blue,
      ),

      /// 路由表注册
      routes: {
        "new_page": (context) => NewRouter(),
        "/": (context) => MyHomePage(title: 'Flutter Demo Home Page'), // 首页路由
        "new_page1": (context) => EchoRoute(),
        "tip2": (context) {
          return TipRoute(text: ModalRoute.of(context).settings.arguments);
        },
        "ziyuan": (context) => ZiYuan(),
        "echo": (context) =>
            Echo(text: ModalRoute.of(context).settings.arguments),
        'context': (context) => Context(),
        'counter': (context) => CounterWidget(),
        'getchildstate': (context) => GetChildState(),
        'cupertinotestroute': (context) => CupertinoTestRoute(),
        'txtstyle': (context) => TextStyle1(),
        'button': (context) => Button(),
        'LoadImage': (context) => LoadImage(),
      },
      // onGenerateRoute: (RouteSettings settings) {
      //   return MaterialPageRoute(builder: (context) {
      //     String routeName = settings.name;
      //     // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由
      //     // 引导用户登录没其他情况下则是正常打开路由
      //   });
      // },
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
  // int _counter = 0; // 用于记录按钮点击次数
  //
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

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
            Random(),
            Text(
              'You have pushed the button this many times:',
            ),
            // Text(
            //   '$_counter',
            //   style: Theme
            //       .of(context)
            //       .textTheme
            //       .headline4,
            // ),
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
              onPressed: () {
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
              onPressed: () {
                Navigator.of(context).pushNamed('new_page1', arguments: 'hi');
              },
            ),
            TextButton(
              child: Text("资源加载"),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('ziyuan');
              },
            ),
            TextButton(
              child: Text('echo'),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue)),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed('echo', arguments: 'helloChina');
              },
            ),
            TextButton(
              child: Text('context'),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue)),
              onPressed: () {
                Navigator.of(context).pushNamed('context');
              },
            ),
            TextButton(
              child: Text('counter'),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue)),
              onPressed: () {
                Navigator.of(context).pushNamed('counter');
              },
            ),
            TextButton(
              child: Text('getchildstate'),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue)),
              onPressed: () {
                Navigator.of(context).pushNamed('getchildstate');
              },
            ),
            TextButton(
              child: Text('cupertinotestroute'),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue)),
              onPressed: () {
                Navigator.of(context).pushNamed('cupertinotestroute');
              },
            ),
            TextButton(
              child: Text('txtstyle'),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue)),
              onPressed: () {
                Navigator.of(context).pushNamed('txtstyle');
              },
            ),
            TextButton(
              child: Text('button'),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue)),
              onPressed: () {
                Navigator.of(context).pushNamed('button');
              },
            ),
            TextButton(
              child: Text('LoadImage'),
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue)),
              onPressed: () {
                Navigator.of(context).pushNamed('LoadImage');
              },
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter, // 自增方法,link line 35
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
