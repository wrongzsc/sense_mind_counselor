import 'package:flutter/material.dart';
import 'package:sensemind_counselor/screen/selfup/album_list.dart';
import 'package:sensemind_counselor/screen/selfup/playlist_display.dart';

class SelfHelpPage extends StatefulWidget {
  SelfHelpPage({Key key}) : super(key: key);
  @override
  _SelfHelpPageState createState() => _SelfHelpPageState();
}

class _SelfHelpPageState extends State<SelfHelpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "自助练习",
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          mainAxisSpacing: 50.0,
          crossAxisSpacing: 50.0,
        ),
        padding: EdgeInsets.fromLTRB(40, 40, 40, 80),
        itemBuilder: _albumItemBuilder,
        itemCount: album.length,
      ),
    );
  }

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
        decoration: BoxDecoration(
          // color: Colors.green,
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.fitHeight,
          ),
        ),
        alignment: Alignment.topLeft,
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
