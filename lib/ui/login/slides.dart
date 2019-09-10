
import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:friendly/swiper/pagination.dart';
import 'package:friendly/ui/gradients.dart';
import 'package:friendly/ui/login/color_wheel.dart';
import 'package:friendly/ui/login/configs/swiper.dart';

class FriendlySwiper extends StatelessWidget {
  
  final List<Widget> slides = [SignUpSlide(), ThemeSlide(), ReminderSlide()];
  final List<Color> gradient;

  FriendlySwiper({Key key, this.gradient}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Material(
      child: Stack(
        children: <Widget>[
          Swiper(
            scrollDirection: Axis.vertical,
            layout: SwiperLayout.DEFAULT,
            indicatorLayout: PageIndicatorLayout.SLIDE,
            loop: false,
            itemBuilder: (context, index) {
              return slides[index];
            },
            itemCount: 4,
            pagination: CustomPagination(),
            control: CustomSwiperControl(
              color: Colors.white,
              disableColor: Colors.black12
            ),
          )
        ],
      ));
  
  }
}

class SignUpScreens extends StatefulWidget {
  SignUpScreens({Key key}) : super(key: key);

  _SignUpScreensState createState() => _SignUpScreensState();
}

class _SignUpScreensState extends State<SignUpScreens> {
  PageController controller;

  @override
  void initState() { 
    controller = PageController(
      initialPage: 0
    );
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    List<Widget> slides = [SignUpSlide(),ThemeSlide(),ReminderSlide()];
    return Stack(
      children: <Widget>[
        PageView(
          scrollDirection: Axis.vertical,
          
          controller: controller,
          // physics: NeverScrollableScrollPhysics(),
          children: slides
        ),
        PaginationBuilder(
            scrollDirection: Axis.vertical,
            pageController: controller,
            layout: PageIndicatorLayout.SLIDE,
            color: Colors.black12,
            itemCount: slides.length,
            spacing: 12.0,
        ),
        // new Align(
        //           alignment: Alignment.bottomCenter,
        //           child: new Padding(
        //             padding: new EdgeInsets.only(bottom: 20.0),
        //             child: new PageIndicator(
        //               layout: PageIndicatorLayout.SLIDE,
        //               size: 10.0,
        //               activeSize: 10.0,
        //               activeColor: Colors.white,
        //               color: Colors.black12,
        //               controller: controller,
        //               space: 5.0,
        //               count: 4,
        //             ),
        //           ),
        // )
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
