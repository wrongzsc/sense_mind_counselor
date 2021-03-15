import 'package:flutter/material.dart';
// import 'package:sensemind_counselor/constants.dart';
import 'package:sensemind_counselor/screen/selfup/selfup_page.dart';
import 'package:sensemind_counselor/screen/counselor/counselor_page.dart';
import 'package:sensemind_counselor/screen/myset/myinfo_page.dart';
import 'package:sensemind_counselor/screen/homepage/home_page.dart';

class NavigatorPage extends StatefulWidget {
  NavigatorPage({Key key}) : super(key: key);
  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  // 底部导航栏内容
  List<BottomNavigationBarItem> navItems = [
    BottomNavigationBarItem(
      label: '首页',
      // 图标 默认状态
      icon: Icon(
        Icons.home_rounded,
      ),
      // backgroundColor: Colors.cyan,
    ),
    BottomNavigationBarItem(
      label: "咨询",
      icon: Icon(
        Icons.group_add_outlined,
      ),
    ),
    BottomNavigationBarItem(
      label: "自助",
      icon: Icon(
        Icons.compare,
      ),
    ),
    BottomNavigationBarItem(
      label: "我的",
      icon: Icon(
        Icons.attribution_sharp,
      ),
    ),
  ];

  // 需要导航到的目标页面
  final pages = [
    HomePage(),
    CounselorPage(),
    SelfHelpPage(),
    MyInfoPage(),
  ];

  // 当前选中的导航下标，默认从第一个开始
  int _curNavIdx = 0;
  // pageview 控制器
  PageController _pageViewCtrler = PageController();
  // 点击按钮触发函数
  void _changeCurNavIdx(int index) {
    // 当用户点击的当行按钮没有变化时不发生变化 节省资源
    if (index != _curNavIdx) {
      _curNavIdx = index;
      _pageViewCtrler.jumpToPage(index);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageViewCtrler,
        children: pages,
        onPageChanged: (index) => _changeCurNavIdx(index),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFF08700),
        items: navItems,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white60,
        unselectedFontSize: 12.0,
        selectedFontSize: 14.0,
        showUnselectedLabels: true,
        currentIndex: _curNavIdx,
        onTap: (index) {
          _changeCurNavIdx(index);
        },
      ),
    );
  }
}
