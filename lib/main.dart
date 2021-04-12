import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensemind_counselor/screen/counselor/trtc/models/meeting.dart';
import 'package:sensemind_counselor/screen/selfup/music_player/play_song.dart';
import 'package:sensemind_counselor/screen/welcome/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PlaySongModel()..init(),
        ),
        ChangeNotifierProvider(
          create: (context) => MeetingModel(),
        ),
      ],
      child: MyApp(),
    ),
  );
  // todo // List<String> args  参数是不是应该用来控制这个是否第一次启动
  // 1st 注册 or 登陆
}

class MyApp extends StatelessWidget {
  // root of app·
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SenseMind Counselor',
      theme: ThemeData(
        primaryColor: Color(0xFFF08700),
      ),
      home: WelcomeScreen2(),
    );
  }
}
