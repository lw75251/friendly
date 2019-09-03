import 'package:flutter/material.dart';

class LogoSize with ChangeNotifier {
  double _width;
  double _height;

  LogoSize(this._height, this._width);

  get width => _width;
  get height => _height;

  void setDimensions(double width, double height) {
    _width = width;
    _height = height;
    notifyListeners();
  }
}