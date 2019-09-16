import 'package:flutter/material.dart';
import 'package:friendly/ui/login/landing_page.dart';
import 'package:friendly/ui/login/sign_in.dart';
import 'package:friendly/ui/login/slides.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatefulWidget {
  LandingScreen({Key key}) : super(key: key);
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> 
  with SingleTickerProviderStateMixin {

  PageController landingController = PageController();
  PageController slideController = PageController();
  PageController accountController = PageController();

  // AnimationController _animationController;
  // Animation<FlutterLogo> logoAnimation;
  // double _logoSize = 150;
  // double _top = 80;
  // double _left = 120;
  // double _opacity = 1;

  int get landingIndex => landingController.page.round();

  @override
  void initState() {

    super.initState();
    // _animationController = AnimationController(
    //   vsync: this,
    //   duration: Duration(milliseconds: 300)
    // );
  }

  @override
  void dispose() {
    // _animationController.dispose();
    slideController.dispose();
    landingController.dispose();
    accountController.dispose();
    super.dispose();
  }

  // void _startTransition() {
  //   setState(() {
  //     _top = 30;
  //     _left = 15;
  //     _logoSize = 80;
  //   });
  // }

  // void _reverseTransition() {
  //   setState(() {
  //     _top = 80;
  //     _left = 120;
  //     _logoSize = 150; 
  //   });
  // }

  @override
  Widget build(BuildContext context) {

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
              // onPageChanged: (int) {
              //   int == 1 ? _startTransition() : _reverseTransition();
              // },
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

        // Logo Animation HERE
        // AnimatedPositioned(
        //   duration: Duration(milliseconds: 600),
        //   child: FlutterLogo(size: _logoSize),
        //   left: _left,
        //   top: _top,
        // ),
      ],
    );

  }
}

class CustomPageController extends PageController {
  Function startTransition;
  Function endTransition;

  CustomPageController({
    this.startTransition,
    this.endTransition,
  });

  @override
  Future<void> nextPage({Duration duration, Curve curve}) {
    startTransition();
    return super.nextPage(duration: duration,curve: curve);
  }

  @override
  Future<void> previousPage({Duration duration, Curve curve}) {
    endTransition();
    return super.previousPage(duration: duration,curve: curve);
  }

}