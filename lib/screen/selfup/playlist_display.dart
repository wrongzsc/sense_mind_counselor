import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sensemind_counselor/screen/selfup/album_list.dart';
import 'package:sensemind_counselor/screen/selfup/music_player/play_song.dart';
import 'package:sensemind_counselor/screen/selfup/music_player/widget_play.dart';
import 'package:sensemind_counselor/screen/selfup/play_list.dart';
import 'package:provider/provider.dart';

class PlayListScreen extends StatefulWidget {
  PlayListScreen({Key key, @required this.albumInfo}) : super(key: key);
  final AlbumInfo albumInfo;

  @override
  _PlayListScreenState createState() => _PlayListScreenState(this.albumInfo);
}

class _PlayListScreenState extends State<PlayListScreen> {
  final AlbumInfo albumInfo;

  _PlayListScreenState(this.albumInfo);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //顶部滑动
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 10,
            child: CustomScrollView(
              slivers: <Widget>[
                // 顶部的标题图片部分
                buildSliverAppBar(),
                // 内容展示
                // buildSliverList(),
                Consumer<PlaySongModel>(builder: (context, model, child) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        var d = albumInfo.playList[index];
                        return GestureDetector(
                          onTap: () {
                            playSongs(model, index);
                          },
                          child: _playChapterBuilder(context, index),
                        );
                      },
                      childCount: albumInfo.playList.length,
                    ),
                  );
                }),
                // _payerBar(),
              ],
            ),
          ),
          Expanded(
            // child: AudioPlayerPage(),
            child: PlayWidget(),
            // child: _payerBar(),
            flex: 1,
          ),
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
        Icon(
          Icons.favorite_border_outlined,
          color: Colors.white,
        ),
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
                fit: BoxFit.contain,
              ),
            )
          ],
        ),
      ),
    );
  }

  SliverList buildSliverList() {
    return SliverList(
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

  //
  _payerBar() {
    AudioPlayer player = AudioPlayer();
    return Container(
      // height: 100.0,
      margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            // 图标
            child: ClipOval(
              child: SvgPicture.asset(
                "assets/selfup/src/Basketball_Isometric.svg",
                width: 40,
                height: 40,
                fit: BoxFit.scaleDown,
              ),
            ),
            flex: 1,
          ),
          // 歌曲名称信息
          Expanded(
            child: TextButton(
              // 跳转进入播放全界面
              onPressed: null,
              // 点击上面的内容自动更新名称
              // 点击下一首自动更新名称
              child: Text(
                "zhehsi yige feichang changde mignzi  buzhidao huishi shenme houguo ",
                maxLines: 2,
                softWrap: true,
              ),
            ),
            flex: 3,
          ),
          // 播放暂停
          // 图标自动更新
          Expanded(
            child: IconButton(
              icon: Icon(Icons.play_arrow_outlined),
              onPressed: () {
                player.play("asset/selfup/audio_src/埃塞俄比亚的夜晚.mp3");
              },
            ),
          ),
          // 下一首
          Expanded(
            child: IconButton(
              icon: Icon(Icons.skip_next),
              onPressed: () {},
            ),
          ),
          // 当前播放列表
          Expanded(
            child: IconButton(
              icon: Icon(Icons.playlist_play_outlined),
              onPressed: null,
            ),
          ),
        ],
      ),
    );
  }

  void playSongs(PlaySongModel model, int index) {
    model.playSongs(
      albumInfo.playList,
      index: index,
    );
  }
}
