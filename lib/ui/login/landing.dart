import 'package:flutter/material.dart';
import 'package:friendly/ui/login/landing_page.dart';
import 'package:friendly/ui/login/sign_in.dart';
import 'package:friendly/ui/login/slides.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({Key key}) : super(key: key);
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

  @override
  Widget build(BuildContext context) {
    var landingController = PageController();
    var slideController = PageController();
    var accountController = PageController();
    return Stack(
      children: <Widget>[
        PageView(
          controller: accountController,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            PageView(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              controller: landingController,
              children: <Widget>[
                LandingPage(
                  landingController: landingController,
                  accountController: accountController
                ),
                SignUpScreens(
                  slideController: slideController,
                  landingController: landingController,
                ),
              ],
            ),
            SignInPage(
              accountController: accountController
            ),
          ],
        ),
      ],
    );

  }
}


