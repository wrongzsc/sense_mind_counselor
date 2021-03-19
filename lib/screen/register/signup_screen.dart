import 'package:flutter/material.dart';
import 'package:sensemind_counselor/navigator.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "  注册",
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SignUpBody(),
    );
  }
}

class SignUpBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
            // 这个地方的注册 显示要向下移动
            Image.asset(
              'assets/initial/logo2.png',
              height: size.height * 0.4,
            ),
            // 手机号注册
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.keyboard_arrow_right),
                // enabledBorder: OutlineInputBorder(
                // borderSide: BorderSide(color: Colors.grey),
                // borderRadius: BorderRadius.all(Radius.circular(100)),
                // ),
                hintText: "请输入手机号码",
                // focusedBorder: OutlineInputBorder(
                // borderSide: BorderSide(color: Colors.grey),
                // borderRadius: BorderRadius.all(Radius.circular(100)),
                // ),
                labelStyle: TextStyle(
                  color: Colors.black45,
                  fontSize: 16,
                ),
              ),
              textAlign: TextAlign.center,
              obscureText: true,
            ),
            // 验证码
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.keyboard_arrow_right),
                // enabledBorder: OutlineInputBorder(
                // borderSide: BorderSide(color: Colors.grey),
                // borderRadius: BorderRadius.all(Radius.circular(100)),
                // ),
                hintText: "请设置密码",
                // focusedBorder: OutlineInputBorder(
                // borderSide: BorderSide(color: Colors.grey),
                // borderRadius: BorderRadius.all(Radius.circular(100)),
                // ),
                labelStyle: TextStyle(
                  color: Colors.black45,
                  fontSize: 16,
                ),
              ),
              textAlign: TextAlign.center,
              obscureText: true,
            ),
            // 注册按钮
            SizedBox(
              height: 40,
            ),
            TextButton(
              onPressed: () {
                // here push to mainpage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return NavigatorPage();
                  }),
                );
              },
              // 注册按钮
              child: Text("注册"),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.blueGrey),
                backgroundColor: MaterialStateProperty.all(Colors.black12),
                textStyle: MaterialStateProperty.all(
                  TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
