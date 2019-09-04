
import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:friendly/ui/gradients.dart';
import 'package:friendly/ui/login/color_wheel.dart';
import 'package:friendly/ui/login/configs/swiper.dart';


class FriendlySwiper extends StatelessWidget {
  
  final List<Widget> slides = [SignUpSlide(), ThemeSlide(), ReminderSlide()];

  @override
  Widget build(BuildContext context) {
    // ThemeData themeData = Theme.of(context);
    // Color activeColor = themeData.primaryColor;
    // Color color = themeData.scaffoldBackgroundColor;
    return Swiper(
      scrollDirection: Axis.vertical,
      layout: SwiperLayout.DEFAULT,
      indicatorLayout: PageIndicatorLayout.SLIDE,
      loop: false,
      itemBuilder: (context, index) {
        return slides[index];
      },
      itemCount: 3,
      pagination: CustomPagination(),
      control: CustomSwiperControl(
        color: Colors.white,
        disableColor: Colors.black12
      ),
    );
  }
}

class SignUpSlide extends StatelessWidget {
  const SignUpSlide({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
