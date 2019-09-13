import 'package:flutter/material.dart';

class SwiperControls extends StatefulWidget {
  final PageController slideController;
  final PageController landingController;
  final int itemCount;
  final IconData iconPrevious;
  final IconData iconNext;
  final double size;
  final Color activeColor;
  final Color color;
  final EdgeInsetsGeometry padding;
  final Key key;

  const SwiperControls({
    this.landingController,
    this.slideController,
    this.itemCount,    
    this.iconPrevious: Icons.keyboard_arrow_up,
    this.iconNext: Icons.keyboard_arrow_down,
    this.activeColor: Colors.white,
    this.color: Colors.white24,
    this.size: 30.0,
    this.padding: const EdgeInsets.all(5.0),
    this.key,
  }) : assert (slideController != null),
       assert (landingController != null),
       super(key: key)
  ;

  @override
  _SwiperControlsState createState() => _SwiperControlsState();
}

class _SwiperControlsState extends State<SwiperControls> {

  int _activeIndex = 0;
  Duration _duration = Duration(milliseconds: 900);
  Curve _curve = Curves.ease;

  Widget buildTopButton(Color color, IconData iconData, int quarterTurns, bool hasNext ) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (hasNext) {
          widget.slideController.previousPage(duration:_duration, curve: _curve);
          _activeIndex--;
          setState((){});
        } else if ( _activeIndex == 0 ) {
          widget.landingController.previousPage(duration: _duration, curve: _curve);
        }
      },
      child: Padding(
          padding: widget.padding,
          child: RotatedBox(
              quarterTurns: quarterTurns,
              child: Icon(
                iconData,
                semanticLabel: "Previous",
                size: widget.size,
                color: color,
              ))),
    );
  }

  Widget buildBottomButton(Color color, IconData iconData, int quarterTurns, bool hasNext ) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (hasNext) {
          widget.slideController.nextPage(duration:_duration, curve: _curve);
          _activeIndex++;
          setState((){});
        } 
      },
      child: Padding(
          padding: widget.padding,
          child: RotatedBox(
              quarterTurns: quarterTurns,
              child: Icon(
                iconData,
                semanticLabel: "Previous",
                size: widget.size,
                color: color,
              ))),
    );
  }

  Widget buildButton(Color color, IconData iconData,
      int quarterTurns, bool previous) {
    Curve _curve = Curves.easeIn;
    Duration _duration = Duration(milliseconds: 900);
    return new GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (previous ) {
          widget.slideController.previousPage(duration:_duration, curve: _curve);
          _activeIndex--;
          setState((){});
        } else {
          widget.slideController.nextPage(duration: _duration, curve: _curve);
          _activeIndex++;
          setState((){});
        }
      },
      child: Padding(
          padding: widget.padding,
          child: RotatedBox(
              quarterTurns: quarterTurns,
              child: Icon(
                iconData,
                semanticLabel: previous ? "Previous" : "Next",
                size: widget.size,
                color: color,
              ))),
    );
  }

  @override
  Widget build(BuildContext context) {

    int itemCount = widget.itemCount;
    Color activeColor = widget.activeColor;
    Color color = widget.color;

    // Padding Values
    const double right = 20.0;
    const double top = 15.0;
    const double bottom = top;

    bool next = _activeIndex < itemCount - 1;
    bool prev = _activeIndex > 0;

    Widget child;
    child = Column(
      key: widget.key,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: right, top: top),
          child: buildTopButton(color, widget.iconPrevious, 0, prev),
        ),
        Padding(
          padding: const EdgeInsets.only(right: right, bottom: bottom),
          child: buildBottomButton(activeColor, widget.iconNext, 0, next),
        ),
        Text("$_activeIndex"),
      ],
    );

    return new Container(
      height: double.infinity,
      child: child,
      width: double.infinity,
    );
  }
}