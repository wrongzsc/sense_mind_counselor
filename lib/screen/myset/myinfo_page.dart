import 'package:flutter/material.dart';

class MyInfoPage extends StatefulWidget {
  MyInfoPage({Key key}) : super(key: key);
  @override
  _MyInfoPageState createState() => _MyInfoPageState();
}

class _MyInfoPageState extends State<MyInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.only(left: 40, right: 30),
        child: Column(
          children: <Widget>[
            Row(children: [
              SizedBox(height: 100.0),
            ]),
            // 头像 + id +分享
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipOval(
                  child: Image.asset(
                    "assets/initial/inital.jpg",
                    height: 70.0,
                    width: 70.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "我的昵称",
                        style: TextStyle(fontSize: 14.0),
                      ),
                      Text(
                        "testID:885079",
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.share_outlined,
                  color: Color(0xFFF08700),
                ),
              ],
            ),
            SizedBox(height: 60.0),
            // icon + 设置内容
            Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      //卡片阴影
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0)
                    ],
                  ),
                  padding: EdgeInsets.fromLTRB(0, 10.0, 10.0, 10.0),
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Icon(Icons.mood_outlined),
                        flex: 1,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              " 我的心情",
                              style: TextStyle(fontSize: 14.0),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                        flex: 4,
                      ),
                      Expanded(
                        child: Icon(
                          Icons.keyboard_arrow_right_outlined,
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      //卡片阴影
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0)
                    ],
                  ),
                  padding: EdgeInsets.fromLTRB(0, 10.0, 10.0, 10.0),
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Icon(Icons.chat_outlined),
                        flex: 1,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              " 我的预约",
                              style: TextStyle(fontSize: 14.0),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                        flex: 4,
                      ),
                      Expanded(
                        child: Icon(
                          Icons.keyboard_arrow_right_outlined,
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      //卡片阴影
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0)
                    ],
                  ),
                  padding: EdgeInsets.fromLTRB(0, 10.0, 10.0, 10.0),
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Icon(Icons.favorite_border_outlined),
                        flex: 1,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              " 我的收藏",
                              style: TextStyle(fontSize: 14.0),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                        flex: 4,
                      ),
                      Expanded(
                        child: Icon(
                          Icons.keyboard_arrow_right_outlined,
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      //卡片阴影
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0)
                    ],
                  ),
                  padding: EdgeInsets.fromLTRB(0, 10.0, 10.0, 10.0),
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Icon(Icons.settings_outlined),
                        flex: 1,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              " 设置",
                              style: TextStyle(fontSize: 14.0),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                        flex: 4,
                      ),
                      Expanded(
                        child: Icon(
                          Icons.keyboard_arrow_right_outlined,
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      //卡片阴影
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 4.0)
                    ],
                  ),
                  padding: EdgeInsets.fromLTRB(0, 10.0, 10.0, 10.0),
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Icon(Icons.info_outline),
                        flex: 1,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              " 关于",
                              style: TextStyle(fontSize: 14.0),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                        flex: 4,
                      ),
                      Expanded(
                        child: Icon(
                          Icons.keyboard_arrow_right_outlined,
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.mood_outlined,
          color: Color(0xFFF08700),
        ),
        backgroundColor: Colors.white,
        onPressed: null,
      ),
    );
  }
}
