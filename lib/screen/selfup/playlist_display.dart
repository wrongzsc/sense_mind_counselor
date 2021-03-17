import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sensemind_counselor/screen/selfup/album_list.dart';
import 'package:sensemind_counselor/screen/selfup/play_list.dart';

class PlayListScreen extends StatelessWidget {
  final AlbumInfo albumInfo;
  // final Chapter chapter;

  PlayListScreen({Key key, @required this.albumInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      body: CustomScrollView(
        slivers: <Widget>[
          // 顶部的标题图片部分
          buildSliverAppBar(),
          buildSliverList(),
        ],
      ),
    );
  }

  SliverAppBar buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: Color(0xFFF08700),
      pinned: true,
      snap: false,
      floating: true,
      // leading: Icon(Icons.home),
      actions: <Widget>[
        Icon(Icons.menu, color: Colors.white),
      ],
      title: Text(
        "自助练习",
        style: TextStyle(color: Colors.white),
      ),
      expandedHeight: 180,
      flexibleSpace: FlexibleSpaceBar(
        background: Row(
          children: <Widget>[
            Expanded(
              child: Image.asset(
                "assets/selfup/" + albumInfo.imagePath,
                fit: BoxFit.scaleDown,
              ),
            )
          ],
        ),
      ),
    );
  }

  SliverList buildSliverList() {
    return SliverList(
      ///懒加载代理
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          ///子Item的布局
          return _playChapterBuilder(context, index);
        },
        childCount: albumInfo.playList.length,
      ), //子Item的个数
    );
  }

  Widget _playChapterBuilder(BuildContext context, int index) {
    final List<Chapter> playList = albumInfo.playList;
    final String imagePath = "assets/selfup/src/" + playList[index].imagePath;
    // print(imagePath);
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(15.0),
        // // gradient: RadialGradient(
        //     //背景径向渐变
        //     colors: [Color(0xFFF08700), Color(0xffffe4b5)],
        //     center: Alignment.topLeft,
        //     radius: .98),
        boxShadow: [
          //卡片阴影
          BoxShadow(
              color: Colors.black54, offset: Offset(2.0, 2.0), blurRadius: 4.0)
        ],
      ),
      padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
      margin: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: SvgPicture.asset(
              imagePath,
              height: 40,
              width: 40,
              fit: BoxFit.scaleDown,
            ),
            flex: 1,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  "    " + albumInfo.playList[index].fileName,
                  style: TextStyle(fontSize: 14.0),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "     " +
                      albumInfo.playList[index].timeSpan.toString() +
                      "分钟",
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
              ],
            ),
            flex: 4,
          ),
          Expanded(
            child: Icon(
              Icons.favorite_outline,
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
