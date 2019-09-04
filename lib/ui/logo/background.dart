
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Logo extends StatelessWidget {

  final double _width;
  final double _height;

  const Logo(this._height,this._width, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final LogoSize dimensions = Provider.of<LogoSize>(context);

    return Stack (
      children: <Widget>[
        LogoBackground(_width,_height),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            LogoEye(_width,_height),
            LogoEye(_width,_height)
          ]),
      ],
    );
  }
}

class LogoEye extends StatelessWidget {
  const LogoEye(this._height,this._width, {Key key}) : super(key: key);

  final double _width;
  final double _height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width/6,
      height: _height/6,
      decoration: BoxDecoration(
        color: Colors.white60,
        shape: BoxShape.circle
      ),
    );
  }
}

class LogoBackground extends StatelessWidget {
  const LogoBackground(this._height,this._width, {Key key}) : super(key: key);

  final double _width;
  final double _height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: _height,
      decoration: BoxDecoration(
        color: Colors.white60,
        shape: BoxShape.circle
      ),
    );
  }
}