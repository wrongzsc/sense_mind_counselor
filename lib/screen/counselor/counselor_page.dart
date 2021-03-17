import 'package:flutter/material.dart';
import 'package:sensemind_counselor/screen/counselor/counselor_info.dart';
import 'package:sensemind_counselor/screen/counselor/counselor_info.dart';

class CounselorPage extends StatefulWidget {
  CounselorPage({Key key}) : super(key: key);
  @override
  _CounselorPageState createState() => _CounselorPageState();
}

class _CounselorPageState extends State<CounselorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "咨询师",
          style: TextStyle(color: Colors.white),
          // style: TextStyle(
          //   fontSize: 16.0,
          //   fontWeight: FontWeight.w500,
          //   color: Colors.white,
          // ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemBuilder: _listCunselItemBuilder,
        itemCount: infos.length,
      ),
    );
  }

// 构建每个咨询师显示的内容信息
  Widget _listCunselItemBuilder(BuildContext context, int index) {
    final String s = "assets/counselor/" + infos[index].image;
    // Size size = MediaQuery.of(context).size;
    // print(s);
    return Container(
      padding: EdgeInsets.only(top: 20.0, left: 8.0, bottom: 30.0, right: 8.0),
      margin: EdgeInsets.all(20),
      // width: size.width * 0.95,
      // height: size.height * 0.4,
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
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          // 第一行个人头像
          ClipOval(
            child: Image.asset(
              s,
              height: 100.0,
              width: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          // Text(s),
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
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // 第二行是个人资质
              Text(
                infos[index].qa,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black87,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // 第三行是从业经验
              Text(
                infos[index].exp,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black87,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // 第四行是 擅长领域
              // 第四行要用两个label来显示
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  TextButton(
                    onPressed: () {},
                    child: Text(infos[index].prof1),
                    style: ButtonStyle(),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(infos[index].prof2),
                    style: ButtonStyle(),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
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
}
