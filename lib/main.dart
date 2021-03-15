import 'package:flutter/material.dart';
import 'package:sensemind_counselor/screen/welcome/welcome_screen.dart';

void main() {
  runApp(MyApp());
  // todo // List<String> args  参数是不是应该用来控制这个是否第一次启动
  // 1st 注册 or 登陆
}

class MyApp extends StatelessWidget {
  // root of app
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SenseMind Counselor',
      theme: ThemeData(
        primaryColor: Color(0xFFF08700),
      ),
      home: WelcomeScreen2(),
      // 自动跳转
      // routes: <String, WidgetBuilder>{
      //   '/IndexPage': (context) => RegisterPage()
      // },
    );
  }
}
