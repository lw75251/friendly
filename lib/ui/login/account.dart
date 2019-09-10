import 'package:flutter/material.dart';
import 'package:friendly/ui/login/landing.dart';
import 'package:friendly/ui/login/sign_in.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        LandingScreen(),
        SignInScreen()
      ],
    );
  }
}