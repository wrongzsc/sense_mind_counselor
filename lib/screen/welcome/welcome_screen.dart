import 'package:flutter/material.dart';
import 'package:sensemind_counselor/components/round_button.dart';
import 'package:sensemind_counselor/constants.dart';
import 'package:sensemind_counselor/screen/login/signin_screen.dart';
import 'package:sensemind_counselor/screen/register/signup_screen.dart';
import 'package:sensemind_counselor/screen/welcome/background.dart';

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
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.15),
            Text(
              "欢迎来到量心心理",
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
            Image.asset(
              "assets/initial/xlogo.png",
              height: size.height * 0.5,
              width: size.width,
              fit: BoxFit.cover,
            ),
            RoundedButton(
              text: "登陆",
              color: Colors.purple,
              textColor: Colors.red,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SigninScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "注册",
              color: kPrimaryLightColor,
              textColor: Colors.purple,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
