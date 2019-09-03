
import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:friendly/ui/login/configs/swiper.dart';


class Slide extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    // Color activeColor = themeData.primaryColor;
    // Color color = themeData.scaffoldBackgroundColor;
    return new Swiper(
      scrollDirection: Axis.vertical,
      layout: SwiperLayout.DEFAULT,
      indicatorLayout: PageIndicatorLayout.SLIDE,
      loop: false,
      itemBuilder: (context, index) {
        return new Container(
          color: Colors.grey,
          child: new Center(
            child: new Text("$index"),
          ),
        );
      },
      itemCount: 3,
      pagination: CustomPagination(),
      control: CustomSwiperControl(),
    );
  }
}