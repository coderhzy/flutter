import 'package:first_flutter_app/pages/basics/new_router.dart';
import 'package:flutter/material.dart';
import 'pages/basics/button.dart';
import 'pages/basics/context.dart';
import 'pages/basics/cpuertion.dart';
import 'pages/basics/get_child_state.dart';
import 'pages/basics/icons.dart';
import 'pages/basics/load_image.dart';
import 'pages/basics/progress.dart';
import 'pages/basics/random_english.dart';
import 'pages/basics/recrement_counter.dart';
import 'pages/basics/route_name.dart';
import 'pages/basics/routing_value_test.dart';
import 'pages/basics/routing_value_tip.dart';
import 'pages/basics/state_less_widget.dart';
import 'pages/basics/switch_checkbox.dart';
import 'pages/basics/textfield_form.dart';
import 'pages/basics/txt_style.dart';
import 'pages/basics/zi_yuan.dart';
import 'pages/basics/form.dart';
import 'pages/container/constrainedBox.dart';
import 'pages/container/padding.dart';
import 'pages/container/sizeBox.dart';
import 'pages/container/unconstrainedBox.dart';
import 'pages/layout/align.dart';
import 'pages/layout/center.dart';
import 'pages/layout/flex.dart';
import 'pages/layout/row_column.dart';
import 'pages/layout/stack.dart';
import 'pages/layout/wrap.dart';

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
        'Icons': (context) => Logo(),
        'switchCheckBox': (context) => SwitchAndCheckBoxTestRoute(),
        'textfieldform': (context) => TextFieldForm(),
        'form': (context) => TextFieldFormVal(),
        'progress': (context) => Progress(),
        'progress1': (context) => ProgressRoute(),
        'RowColumn': (context) => RowColumn(),
        'Nesting': (context) => Nesting(),
        'FlexLayoutTestRoute': (context) => FlexLayoutTestRoute(),
        'WrapOne': (context) => WrapOne(),
        'StackOne': (context) => StackOne(),
        'StackTwo': (context) => StackTwo(),
        'AlignOne': (context) => AlignOne(),
        'AlignTwo': (context) => AlignTwo(),
        'AlignThree': (context) => AlignThree(),
        'AlignFour': (context) => AlignFour(),
        'Factor': (context) => Factor(),
        'PaddingOne': (context) => PaddingOne(),
        'ConstrainedBoxOne': (context) => ConstrainedBoxOne(),
        'SizedBoxOne': (context) => SizedBoxOne(),
        'UnconstrainedBoxOne': (context) => UnconstrainedBoxOne()
        // 'RowCol1': (context) => RowCol1(),
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
      body: SingleChildScrollView(
        child: Center(
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
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
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
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
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
              TextButton(
                child: Text('Icons'),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue)),
                onPressed: () {
                  Navigator.of(context).pushNamed('Icons');
                },
              ),
              TextButton(
                child: Text('switchCheckBox'),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue)),
                onPressed: () {
                  Navigator.of(context).pushNamed('switchCheckBox');
                },
              ),
              TextButton(
                child: Text('textfieldform'),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue)),
                onPressed: () {
                  Navigator.of(context).pushNamed('textfieldform');
                },
              ),
              TextButton(
                child: Text('form'),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue)),
                onPressed: () {
                  Navigator.of(context).pushNamed('form');
                },
              ),
              TextButton(
                child: Text('progress'),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue)),
                onPressed: () {
                  Navigator.of(context).pushNamed('progress');
                },
              ),
              TextButton(
                child: Text('progress1'),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue)),
                onPressed: () {
                  Navigator.of(context).pushNamed('progress1');
                },
              ),
              TextButton(
                child: Text('RowColumn'),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue)),
                onPressed: () {
                  Navigator.of(context).pushNamed('RowColumn');
                },
              ),
              TextButton(
                child: Text('Nesting'),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue)),
                onPressed: () {
                  Navigator.of(context).pushNamed('Nesting');
                },
              ),
              TextButton(
                child: Text('FlexLayoutTestRoute'),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue)),
                onPressed: () {
                  Navigator.of(context).pushNamed('FlexLayoutTestRoute');
                },
              ),
              TextButton(
                child: Text('WrapOne'),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue)),
                onPressed: () {
                  Navigator.of(context).pushNamed('WrapOne');
                },
              ),
              TextButton(
                child: Text('StackOne'),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue)),
                onPressed: () {
                  Navigator.of(context).pushNamed('StackOne');
                },
              ),
              TextButton(
                child: Text('StackTwo'),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue)),
                onPressed: () {
                  Navigator.of(context).pushNamed('StackTwo');
                },
              ),
              TextButton(
                child: Text('AlignOne'),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue)),
                onPressed: () {
                  Navigator.of(context).pushNamed('AlignOne');
                },
              ),
              TextButton(
                child: Text('AlignTwo'),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue)),
                onPressed: () {
                  Navigator.of(context).pushNamed('AlignTwo');
                },
              ),
              TextButton(
                child: Text('AlignThree'),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue)),
                onPressed: () {
                  Navigator.of(context).pushNamed('AlignThree');
                },
              ),
              TextButton(
                child: Text('AlignFour'),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue)),
                onPressed: () {
                  Navigator.of(context).pushNamed('AlignFour');
                },
              ),
              TextButton(
                child: Text('Factor'),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue)),
                onPressed: () {
                  Navigator.of(context).pushNamed('Factor');
                },
              ),
              TextButton(
                child: Text('PaddingOne'),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue)),
                onPressed: () {
                  Navigator.of(context).pushNamed('PaddingOne');
                },
              ),
              TextButton(
                child: Text('ConstrainedBoxOne'),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue)),
                onPressed: () {
                  Navigator.of(context).pushNamed('ConstrainedBoxOne');
                },
              ),
              TextButton(
                child: Text('SizedBoxOne'),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue)),
                onPressed: () {
                  Navigator.of(context).pushNamed('SizedBoxOne');
                },
              ),
              TextButton(
                child: Text('UnconstrainedBoxOne'),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue)),
                onPressed: () {
                  Navigator.of(context).pushNamed('UnconstrainedBoxOne');
                },
              ),
            ],
          ),
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
