import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:friendly/swiper/swiper_controls.dart';
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
    PageController landingController = PageController();
    PageController slideController = PageController();
    return Stack(
      children: <Widget>[
        PageView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            PageView(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              controller: landingController,
              children: <Widget>[
                LandingPage(),
                SignUpScreens(
                  slideController: slideController,
                  landingController: landingController,
                ),
              ],
            ),
            SignInPage(),
          ],
        ),
      ],
    );

  }
}


