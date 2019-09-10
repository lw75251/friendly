import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';

class PaginationBuilder extends StatelessWidget {
  final Axis scrollDirection;
  final PageController pageController;
  final PageIndicatorLayout layout;
  final Color activeColor;
  final Color color;
  final double activeSize;
  final double size;
  final int itemCount;
  final double spacing;
  final double margin;


  const PaginationBuilder({
    this.scrollDirection,
    this.pageController,
    this.layout: PageIndicatorLayout.NONE,
    this.activeColor: Colors.white,
    this.color: Colors.white30,
    this.activeSize: 10.0,
    this.size: 10.0,
    this.itemCount,
    this.spacing: 10.0,
    this.margin: 10.0,    
    Key key}) :
      assert(scrollDirection != null),
      assert(pageController != null),
      assert(itemCount != null),
      super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget pagination = PageIndicator(
      controller: this.pageController,
      layout: this.layout,
      activeColor: this.activeColor,
      color: this.color,
      size: this.size,
      count: this.itemCount,
      space: this.spacing,
    );

    return this.scrollDirection == Axis.horizontal ?
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
        margin: EdgeInsets.only(bottom: this.margin),
        child: pagination,
      )) : 
      Align(
        alignment: Alignment.topRight,
        child: Transform.translate(
          offset: Offset(0, 80.0),
          child: Transform.rotate(
            angle: pi/2,
            child: Container(
              margin: EdgeInsets.only(top: this.margin, right: this.margin),
              child: pagination,
            ),
          )
        ),
      );

  }
}