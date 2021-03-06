import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:sensemind_counselor/screen/selfup/play_list.dart';

class PlaySongModel with ChangeNotifier {
  AudioPlayer _audioPlayer = AudioPlayer();
  StreamController<String> _curPositionController =
      StreamController<String>.broadcast();
  List<Chapter> _playList = [];
  int curIndex = 0;
  Duration curSongDuration;
  AudioPlayerState _curState;

  List<Chapter> get allChapters => _playList;
  Chapter get curChapter => _playList[curIndex];
  Stream<String> get curPositionStream => _curPositionController.stream;
  AudioPlayerState get curState => _curState;

  void init() {
    _audioPlayer.setReleaseMode(ReleaseMode.STOP);

    // 播放状态监听
    _audioPlayer.onPlayerStateChanged.listen((state) {
      _curState = state;

      /// 先做顺序播放
      if (state == AudioPlayerState.COMPLETED) {
        nextPlay();
      }
      // 其实也只有在播放状态更新时才需要通知。
      notifyListeners();
    });

    _audioPlayer.onDurationChanged.listen((d) {
      curSongDuration = d;
    });
    // 当前播放进度监听
    _audioPlayer.onAudioPositionChanged.listen((Duration p) {
      sinkProgress(p.inMilliseconds > curSongDuration.inMilliseconds
          ? curSongDuration.inMilliseconds
          : p.inMilliseconds);
    });
  }

  // 歌曲进度
  void sinkProgress(int m) {
    _curPositionController.sink.add('$m-${curSongDuration.inMilliseconds}');
  }

  // 播放一首歌
  void playSong(Chapter song) {
    _playList.insert(curIndex, song);
    play();
  }

  // 播放很多歌
  void playSongs(List<Chapter> songs, {int index}) {
    this._playList = songs;
    if (index != null) curIndex = index;
    play();
  }

  // 添加歌曲
  void addSongs(List<Chapter> songs) {
    this._playList.addAll(songs);
  }

  /// 播放
  void play() async {
    var songId = this._playList[curIndex].filePath;
    // var url = await NetUtils.getMusicURL(null, songId);
    var url = "http://119.29.64.158:8989/" + songId;

    _audioPlayer.play(url);
    // saveCurSong();
  }

  /// 暂停、恢复
  void togglePlay() {
    if (_audioPlayer.state == AudioPlayerState.PAUSED) {
      resumePlay();
    } else {
      pausePlay();
    }
  }

  // 暂停
  void pausePlay() {
    _audioPlayer.pause();
  }

  /// 跳转到固定时间
  void seekPlay(int milliseconds) {
    _audioPlayer.seek(Duration(milliseconds: milliseconds));
    resumePlay();
  }

  /// 恢复播放
  void resumePlay() {
    _audioPlayer.resume();
  }

  /// 下一首
  void nextPlay() {
    if (curIndex >= _playList.length) {
      curIndex = 0;
    } else {
      curIndex++;
    }
    play();
  }

  void prePlay() {
    if (curIndex <= 0) {
      curIndex = _playList.length - 1;
    } else {
      curIndex--;
    }
    play();
  }

  // 保存当前歌曲到本地
  // void saveCurSong() {
  //   Application.sp.remove('playing_songs');
  //   Application.sp.setStringList('playing_songs',
  //       _playList.map((s) => FluroConvertUtils.object2string(s)).toList());
  //   Application.sp.setInt('playing_index', curIndex);
  // }

  @override
  void dispose() {
    super.dispose();
    _curPositionController.close();
    _audioPlayer.dispose();
  }
}
