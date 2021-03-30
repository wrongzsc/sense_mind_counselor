import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sensemind_counselor/screen/selfup/play_list.dart';

// 旧版测试页面
class AudioPlayerPage extends StatefulWidget {
  AudioPlayerPage({Key key, @required this.playList}) : super(key: key);
  final List<Chapter> playList;
  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState(this.playList);
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  final List<Chapter> playList;
  _AudioPlayerPageState(this.playList);

  String url;
  PlayerMode mode;

  AudioPlayer _audioPlayer;
  AudioCache _audioCache;

  AudioPlayerState _curPlayState;

  Duration _duration;
  Duration _position;

  StreamSubscription _durSubscription;
  StreamSubscription _posSubscription;
  StreamSubscription _PlayerCompSubscription;
  StreamSubscription _playerErrSubscription;
  StreamSubscription _playerStateSubscription;

  get _durationText => _duration?.toString()?.split('.')?.first ?? '';
  get _positionText => _position?.toString()?.split('.')?.first ?? '';

  @override
  //  初始化
  void initState() {
    // TODO: implement initState
    super.initState();
    // url = 'https://luan.xyz/files/audio/ambient_c_motion.mp3';
    url = "http://119.29.64.158:8989/20分钟正念.mp3";
    _initAudioPlayer();
  }

  @override
  void dispose() {
    //释放
    _audioPlayer.dispose();
    _durSubscription?.cancel();
    _posSubscription?.cancel();
    _PlayerCompSubscription?.cancel();
    _playerErrSubscription?.cancel();
    _playerStateSubscription?.cancel();
    super.dispose();
  }

  _initAudioPlayer() {
    //  /// Ideal for long media files or streams.
    mode = PlayerMode.MEDIA_PLAYER;
    //初始化
    _audioPlayer = AudioPlayer(mode: mode);

    _durSubscription = _audioPlayer.onDurationChanged.listen((duration) {
      setState(() => _duration = duration);

      // TODO implemented for iOS, waiting for android impl
      if (Theme.of(context).platform == TargetPlatform.iOS) {
        _audioPlayer.startHeadlessService();

        // set at least title to see the notification bar on iOS.
        _audioPlayer.setNotification(
            title: 'App Name',
            artist: 'Artist or blank',
            albumTitle: 'Name or blank',
            imageUrl: 'url or blank',
            forwardSkipInterval: const Duration(seconds: 30), // default is 30s
            backwardSkipInterval: const Duration(seconds: 30), // default is 30s
            duration: duration,
            elapsedTime: Duration(seconds: 0));
      }
    });

    //监听进度
    _posSubscription =
        _audioPlayer.onAudioPositionChanged.listen((p) => setState(() {
              _position = p;
            }));

    //播放完成
    _PlayerCompSubscription = _audioPlayer.onPlayerCompletion.listen((event) {
//          _onComplete();
      setState(() {
        _position = Duration();
      });
    });

    //监听报错
    _playerErrSubscription = _audioPlayer.onPlayerError.listen((msg) {
      print('audioPlayer error : $msg');
      setState(() {
//        _playerState = PlayerState.stopped;
        _duration = Duration(seconds: 0);
        _position = Duration(seconds: 0);
      });
    });

    //播放状态改变
    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (!mounted) return;
      setState(() {});
    });

    ///// iOS中来自通知区域的玩家状态变化流。
    _audioPlayer.onNotificationPlayerStateChanged.listen((state) {
      if (!mounted) return;
    });
  }

  //开始播放
  void _play() async {
    final playPosition = (_position != null &&
            _duration != null &&
            _position.inMilliseconds > 0 &&
            _position.inMilliseconds < _duration.inMilliseconds)
        ? _position
        : null;
    final result = await _audioPlayer.play(url, position: playPosition);
    if (result == 1) {
      print('succes');
    }
    _audioPlayer.setPlaybackRate(playbackRate: 1.0);
  }

  //暂停
  void _pause() async {
    final result = await _audioPlayer.pause();
    if (result == 1) {
      print('succes');
    }
  }

  //停止播放
  _stop() async {
    final result = await _audioPlayer.stop();
    if (result == 1) {
      setState(() {
        _position = Duration();
      });
    }
  }

  void togglePlay() {
    if (_audioPlayer.state == AudioPlayerState.PAUSED) {
      _play();
    } else {
      _pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    // 显示界面+控制
    return Container(
      // appBar: AppBar(),
      margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
      child: Column(
        children: <Widget>[
          // 进度条
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Stack(
                children: [
                  Slider(
                    activeColor: Color(0xFFF08700),
                    inactiveColor: Color(0xffffe4b5),
                    onChanged: (v) {
                      final Position = v * _duration.inMilliseconds;
                      _audioPlayer
                          .seek(Duration(milliseconds: Position.round()));
                    },
                    value: (_position != null &&
                            _duration != null &&
                            _position.inMilliseconds > 0 &&
                            _position.inMilliseconds < _duration.inMilliseconds)
                        ? _position.inMilliseconds / _duration.inMilliseconds
                        : 0.0,
                  ),
                ],
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  // 图标
                  child: ClipOval(
                    child: Image.network(
                      "http://119.29.64.158:8989/natural.jpg",
                      width: 40,
                      height: 40,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  //   child: SvgPicture.asset(
                  //     "assets/selfup/src/Basketball_Isometric.svg",
                  //     width: 40,
                  //     height: 40,
                  //     fit: BoxFit.scaleDown,
                  //   ),
                  // ),
                  flex: 1,
                ),
                // 文本图标
                Expanded(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        // 歌名
                        Text(
                          "zhehsi yige feichang changde mignzi  buzhidao huishi shenme houguo ",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ),
                        // 时间戳
                        Text(
                          _position != null
                              ? '${_positionText ?? ''} / ${_durationText ?? ''}'
                              : _duration != null
                                  ? _durationText
                                  : '',
                          style: TextStyle(color: Colors.white30),
                        ),
                      ],
                    ),
                  ),
                  flex: 3,
                ),
                // play pause
                Expanded(
                  child: IconButton(
                    // icon: Icon(Icons.play_arrow_outlined),
                    icon: Icon(_audioPlayer.state == AudioPlayerState.PLAYING
                        ? Icons.pause_outlined
                        : Icons.play_arrow_outlined),
                    onPressed: () {
                      _play();
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                    icon: Icon(Icons.pause_outlined),
                    onPressed: () {
                      _pause();
                    },
                  ),
                ),
                Expanded(
                  child: IconButton(
                      icon: Icon(Icons.stop),
                      onPressed: () {
                        _stop();
                      }),
                  flex: 1,
                ),
              ],
            ),
            flex: 10,
          ),
        ],
      ),
    );
  }
}
