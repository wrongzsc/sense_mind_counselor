import 'package:flutter/material.dart';
import 'package:sensemind_counselor/main.dart';
import 'package:sensemind_counselor/screen/selfup/selfup_page.dart';
import 'package:sensemind_counselor/screen/counselor/counselor_page.dart';
import 'package:sensemind_counselor/screen/myset/myinfo_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("我猜我才是主页"),
      ),
    );
  }
}
