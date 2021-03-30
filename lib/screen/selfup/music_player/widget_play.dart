import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sensemind_counselor/components/data_utils.dart';
import 'package:sensemind_counselor/components/h_empty.dart';
import 'package:sensemind_counselor/screen/selfup/music_player/play_song.dart';
import 'package:provider/provider.dart';
import 'package:sensemind_counselor/screen/selfup/play_list.dart';

// 页面下面的播放条
class PlayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Consumer<PlaySongModel>(builder: (context, model, child) {
        Widget child;

        if (model.allChapters.isEmpty)
          child = Text('暂无正在进行的练习');
        else {
          Chapter curSong = model.curChapter;
          child = StreamBuilder<String>(
            stream: model.curPositionStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var totalTime =
                    snapshot.data.substring(snapshot.data.indexOf('-') + 1);
                var curTime = double.parse(
                    snapshot.data.substring(0, snapshot.data.indexOf('-')));
                var curTimeStr =
                    DateUtil.formatDateMs(curTime.toInt(), format: "mm:ss");
                return buildPlayWidget(
                    curSong, model, curTime, totalTime, curTimeStr);
              } else {
                return buildPlayWidget(curSong, model, 0, "0", "00:00");
              }
            },
          );
        }

        return Container(
          width: MediaQuery.of(context).size.width,
          // height: ScreenUtil().setWidth(110) + 20,
          height: MediaQuery.of(context).size.height * 0.1,
          decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey[200])),
              color: Colors.white),
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(bottom: 10),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 110,
            // padding: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            child: child,
          ),
        );
      }),
    );
  }

  Widget buildPlayWidget(Chapter curSong, PlaySongModel model, double curTime,
      String totalTime, String curTimeStr) {
    return Column(
      children: <Widget>[
        // 进度条
        Expanded(
            flex: 1,
            child: buildProgress(model, curTime, totalTime, curTimeStr)),
        // 文字提示
        Expanded(
          flex: 10,
          child: buildButton(curSong, model, curTime, totalTime, curTimeStr),
        ),
      ],
    );
  }

  // 进度条显示
  buildProgress(PlaySongModel model, double curTime, String totalTime,
      String curTimeStr) {
    return Container(
      child: SliderTheme(
        data: SliderThemeData(
          trackHeight: 4,
          thumbShape: RoundSliderThumbShape(
            enabledThumbRadius: 7,
          ),
        ),
        child: Slider(
          value: curTime,
          onChanged: (data) {
            model.sinkProgress(data.toInt());
          },
          onChangeStart: (data) {
            model.pausePlay();
          },
          onChangeEnd: (data) {
            model.seekPlay(data.toInt());
          },
          activeColor: Color(0xFFF08700),
          inactiveColor: Color(0xffffe4b5),
          min: 0,
          max: double.parse(totalTime),
        ),
      ),
    );
  }

  // 标题 图标显示
  buildButton(Chapter curSong, PlaySongModel model, double curTime,
      String totalTime, String curTimeStr) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      // 进入全屏播放界面
      onTap: () {
        // NavigatorUtil.goPlaySongsPage(context);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          HEmptyView(10),
          // 图标
          ClipOval(
            child: SvgPicture.asset(
              "assets/selfup/src/" + model.curChapter.imagePath,
              width: 40,
              height: 40,
              fit: BoxFit.scaleDown,
            ),
          ),
          HEmptyView(10),
          // 标题时间
          Expanded(
            flex: 8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  curSong.fileName,
                  // style: commonTextStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  curTimeStr +
                      " / " +
                      DateUtil.formatDateMs(
                        int.parse(totalTime),
                        format: "mm:ss",
                      ),
                  style: TextStyle(color: Colors.orange[200], fontSize: 12),
                ),
              ],
            ),
          ),
          // 上一首
          HEmptyView(10),
          IconButton(
            onPressed: () {
              model.prePlay();
            },
            icon: Icon(Icons.keyboard_arrow_left_outlined),
          ),
          HEmptyView(10),
          // 播放暂停
          GestureDetector(
            onTap: () {
              if (model.curState == null) {
                model.play();
              } else {
                model.togglePlay();
              }
            },
            child: Icon(model.curState == AudioPlayerState.PLAYING
                ? Icons.pause_outlined
                : Icons.play_arrow_outlined),
          ),
          HEmptyView(10),
          // 下一首
          IconButton(
            onPressed: () {
              model.nextPlay();
            },
            icon: Icon(Icons.keyboard_arrow_right_outlined),
          ),
        ],
      ),
    );
  }
}
