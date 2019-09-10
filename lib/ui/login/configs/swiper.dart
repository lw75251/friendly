
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class CustomPagination extends SwiperPlugin {
  /// dot style pagination  
  static const SwiperPlugin dots = const DotSwiperPaginationBuilder(
    color: Colors.black12,
    activeColor: Colors.white,
    space: 15.0
  );

  /// Alignment.bottomCenter by default when scrollDirection== Axis.horizontal
  /// Alignment.centerRight by default when scrollDirection== Axis.vertical
  final Alignment alignment;

  /// Distance between pagination and the container
  final EdgeInsetsGeometry margin;

  /// Build the widet
  final SwiperPlugin builder;
  final Key key;

  const CustomPagination(
      {this.alignment,
      this.key,
      this.margin: const EdgeInsets.all(10.0),
      this.builder: dots});

  Widget build(BuildContext context, SwiperPluginConfig config) {
    Alignment alignment = this.alignment ??
        (config.scrollDirection == Axis.horizontal
            ? Alignment.bottomCenter
            : Alignment.topRight);

    Widget child = Transform.translate(
      offset: Offset(0, 80.0),
      child: Transform.rotate(
        angle: pi/2,
        child: Container(
          margin: margin,
          child: this.builder.build(context, config),
        )
      )
    );
    
    if (!config.outer) {
      child = new Align(
        key: key,
        alignment: alignment,
        child: child,
      );
    }
    return child;
  }
}

class CustomSwiperControl extends SwiperPlugin {
  ///IconData for previous
  final IconData iconPrevious;

  ///iconData fopr next
  final IconData iconNext;

  ///icon size
  final double size;

  ///Icon normal color, The theme's [ThemeData.primaryColor] by default.
  final Color color;

  ///if set loop=false on Swiper, this color will be used when swiper goto the last slide.
  ///The theme's [ThemeData.disabledColor] by default.
  final Color disableColor;

  final EdgeInsetsGeometry padding;

  final Key key;

  const CustomSwiperControl(
      {this.iconPrevious: Icons.keyboard_arrow_up,
      this.iconNext: Icons.keyboard_arrow_down,
      this.color,
      this.disableColor,
      this.key,
      this.size: 30.0,
      this.padding: const EdgeInsets.all(5.0)});

  Widget buildButton(SwiperPluginConfig config, Color color, IconData iconData,
      int quarterTurns, bool previous) {
    return new GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (previous) {
          config.controller.previous(animation: true);
        } else {
          config.controller.next(animation: true);
        }
      },
      child: Padding(
          padding: padding,
          child: RotatedBox(
              quarterTurns: quarterTurns,
              child: Icon(
                iconData,
                semanticLabel: previous ? "Previous" : "Next",
                size: size,
                color: color,
              ))),
    );
  }

  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {

    Color color = this.color;
    Color disableColor = this.disableColor;
    Color prevColor;
    Color nextColor;

    // Padding Values
    const double right = 20.0;
    const double top = 15.0;
    const double bottom = top;

    if (config.loop) {
      prevColor = nextColor = color;
    } else {
      bool next = config.activeIndex < config.itemCount - 1;
      bool prev = config.activeIndex > 0;
      prevColor = prev ? color : disableColor;
      nextColor = next ? color : disableColor;
    }

    Widget child;
    child = Column(
      key: key,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: right, top: top),
          child: buildButton(config, prevColor, iconPrevious, 0, true),
        ),
        Padding(
          padding: const EdgeInsets.only(right: right, bottom: bottom),
          child: buildButton(config, nextColor, iconNext, 0, false),
        )
      ],
    );

    return new Container(
      height: double.infinity,
      child: child,
      width: double.infinity,
    );
  }
}