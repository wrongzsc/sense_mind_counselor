import 'package:flutter/material.dart';
import 'package:sensemind_counselor/screen/login/signin_screen.dart';
import 'package:sensemind_counselor/screen/register/signup_screen.dart';

class WelcomeScreen2 extends StatelessWidget {
  // const WelcomeScreen2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  // const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    //后续如果增加背景  container改成backage，要新增backage类
    return Container(
      height: size.height,
      width: double.infinity,
      color: Color(0xFFF08700),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.15),
            Text(
              "欢迎来到量心心理",
              style: TextStyle(
                fontSize: 18.0,
                // fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Image.asset(
              "assets/initial/xlogo.png",
              height: size.height * 0.5,
              width: size.width,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                // here push to mainpage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SignUpScreen();
                  }),
                );
              },
              // 注册按钮
              child: Text(" 注册 "),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                // backgroundColor: MaterialStateProperty.all(Colors.black12),
                textStyle: MaterialStateProperty.all(
                  TextStyle(
                    fontSize: 18.0,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                // here push to mainpage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return SigninScreen();
                  }),
                );
              },
              // 登陆按钮
              child: Text(" 登陆 "),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                // backgroundColor: MaterialStateProperty.all(Colors.black12),
                textStyle: MaterialStateProperty.all(
                  TextStyle(
                    fontSize: 18.0,
                    // fontWeight: FontWeight.bold,
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
