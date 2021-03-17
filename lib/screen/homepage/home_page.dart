import 'package:flutter/material.dart';
import 'package:sensemind_counselor/main.dart';
import 'package:sensemind_counselor/screen/selfup/album_list.dart';
import 'package:sensemind_counselor/screen/selfup/playlist_display.dart';
import 'package:sensemind_counselor/screen/selfup/selfup_page.dart';
import 'package:sensemind_counselor/screen/counselor/counselor_page.dart';
import 'package:sensemind_counselor/screen/myset/myinfo_page.dart';
import 'package:sensemind_counselor/screen/counselor/counselor_info.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "我的空间",
          style: TextStyle(color: Colors.white),
        ),
        // leading: ,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          PopupMenuButton<String>(
            itemBuilder: (context) => _getPopupMenu(context),
            onSelected: (String value) {
              print('onSelected');
              // _selectValueChange(value);
            },
            onCanceled: () {
              print('onCanceled');
            },
            icon: Icon(
              Icons.settings_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      // 分成三部分内容 conlumn
      body: Column(
        children: <Widget>[
          // conlumn1 任务列表
          Expanded(
            child: toDoList(context),
          ),

          // conlumn2 咨询师横向查找
          Expanded(
            child: conselorList(context),
          ),
          // conlumn3 咨询训练包展示2个
          Expanded(
            child: selfUpList(context),
          ),
        ],
      ),
    );
  }

  Widget toDoList(BuildContext context) {
    return Container(
      child: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                  value: false,
                  onChanged: null,
                ),
                Text("I'm dedicating every day to you."),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                  value: false,
                  onChanged: null,
                ),
                Text('Domestic life was never quite my style.'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                  value: false,
                  onChanged: null,
                ),
                Text('When you smile, you knock me out.'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                  value: false,
                  onChanged: null,
                ),
                Text("代办列表显示."),
              ],
            ),
          ],
        ),
      ),
    );
  }

  conselorList(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: _listCunselItemBuilder,
        itemCount: infos.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(right: 50),
      ),
    );
  }

  Widget selfUpList(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: _albumItemBuilder,
        itemCount: album.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(right: 50),
      ),
    );
  }

  // 状态栏的设置按钮
  _getPopupMenu(BuildContext context) {
    return <PopupMenuEntry<String>>[
      PopupMenuItem(
        value: "setting",
        child: Text("设置"),
      ),
      PopupMenuItem(
        value: "feedback",
        child: Text(
          "反馈",
        ),
      ),
      PopupMenuItem(
        value: "contact",
        child: Text("联系我们"),
      ),
    ];
  }

  // 咨询师列表的构建页面
  Widget _listCunselItemBuilder(BuildContext context, int index) {
    final String s = "assets/counselor/" + infos[index].image;
    return Container(
      // padding: EdgeInsets.only(top: 10.0, left: 8.0, bottom: 10.0, right: 8.0),
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Color(0xffffe4b5),
          width: 2,
        ),
      ),
      // 咨询师信息显示
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // 第一行个人头像
          ClipOval(
            child: Image.asset(
              s,
              height: 50.0,
              width: 50.0,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          // 下方个人信息
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              // 第一行 姓名
              Text(
                infos[index].name,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              // 第二行是个人资质
              Text(
                infos[index].qa,
                style: TextStyle(
                  fontSize: 10.0,
                  color: Colors.black87,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              // 第三行是从业经验
              Text(
                infos[index].exp,
                style: TextStyle(
                  fontSize: 10.0,
                  color: Colors.black87,
                ),
              ),
              // 第四行是 擅长领域
              // 第四行要用两个label来显示
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      infos[index].prof1,
                      style: TextStyle(fontSize: 12.0),
                    ),
                    style: ButtonStyle(),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      infos[index].prof2,
                      style: TextStyle(fontSize: 12.0),
                    ),
                    style: ButtonStyle(),
                  ),
                ],
              ),
              // 第五行是预约咨询
              // 显示两个button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "在线预约",
                      style: TextStyle(fontSize: 12.0),
                    ),
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        return states.contains(MaterialState.pressed)
                            ? Color(0xffffe4b5)
                            : Colors.deepOrange;
                      }),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "视频咨询",
                      style: TextStyle(fontSize: 12.0),
                    ),
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.resolveWith((states) {
                        return states.contains(MaterialState.pressed)
                            ? Color(0xffffe4b5)
                            : Colors.deepOrange;
                      }),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // Icon(
          //   Icons.favorite,
          // ),
        ],
      ),
    );
  }

  // 自助列表
  Widget _albumItemBuilder(BuildContext context, int index) {
    final String imagePath = "assets/selfup/" + album[index].imagePath;
    // 显示内容
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlayListScreen(
              albumInfo: album[index],
            ),
          ),
        );
      },
      child: Container(
        // padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(20),
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.green,
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        // alignment: Alignment.topLeft,
        child: Text(
          album[index].fileName,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }
}
