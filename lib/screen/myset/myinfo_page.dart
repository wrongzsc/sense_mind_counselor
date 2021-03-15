import 'package:flutter/material.dart';

class MyInfoPage extends StatefulWidget {
  MyInfoPage({Key key}) : super(key: key);
  @override
  _MyInfoPageState createState() => _MyInfoPageState();
}

class _MyInfoPageState extends State<MyInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white12,
      child: Container(
        margin: EdgeInsets.all(100),
        padding: EdgeInsets.all(100),
        color: Colors.orangeAccent,
        child: Text('我一直在进步中'),
      ),
    );
  }
}
