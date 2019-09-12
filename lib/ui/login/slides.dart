
import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:friendly/swiper/pagination.dart';
import 'package:friendly/swiper/swiper_controls.dart';
import 'package:friendly/ui/gradients.dart';
import 'package:friendly/ui/login/color_wheel.dart';

class SignUpScreens extends StatefulWidget {
  final PageController slideController;
  final PageController landingController;
  final List<Widget> slides = [SignUpSlide(),ThemeSlide(),ReminderSlide()];
  SignUpScreens({
    this.slideController,
    this.landingController,
    Key key
    }): assert(slideController != null),
        assert(landingController != null),
        super(key: key);

  _SignUpScreensState createState() => _SignUpScreensState();
}

class _SignUpScreensState extends State<SignUpScreens> {  
  @override
  Widget build(BuildContext context) {
    
    return Stack(
      children: <Widget>[
        PageView(
          scrollDirection: Axis.vertical,
          controller: widget.slideController,
          // physics: NeverScrollableScrollPhysics(),
          children: widget.slides
        ),
        PaginationBuilder(
          scrollDirection: Axis.vertical,
          pageController: widget.slideController,
          layout: PageIndicatorLayout.SLIDE,
          color: Colors.black12,
          itemCount: widget.slides.length,
          spacing: 12.0,    
        ),
        SwiperControls(
          landingController: widget.landingController,
          slideController: widget.slideController,
          itemCount: widget.slides.length,
        )
      ]
    );
  }
}

class SignUpSlide extends StatelessWidget {
  const SignUpSlide({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align (
        alignment: Alignment.topLeft,
        child: Hero(
          tag: "logo",
          child: FlutterLogo(size: 50),
        ),
      ),
    );
  }
}

class ThemeSlide extends StatelessWidget {
  const ThemeSlide({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ColorList(colorThemes);   

  }
}

class ReminderSlide extends StatelessWidget {
  const ReminderSlide({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // child: child,
    );
  }
}
