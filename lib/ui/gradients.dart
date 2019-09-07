import 'package:flutter/material.dart';

class ColorTheme with ChangeNotifier {
  List<Color> _gradient;

  ColorTheme(this._gradient);

  List<Color> get gradient => _gradient;
  set gradient(List<Color> gradient) {
    _gradient = gradient;
    notifyListeners();
  }
}

// const Map<String, List<Color>> colorThemes1 = {
//   "orangeGradients": orangeGradients,
//   "aquaGradients": aquaGradients,
//   "quepalGradients": quepalGradients,
//   "bigheadGradients": bigheadGradients,
//   "hydrogenGradients": hydrogenGradients,
//   "orangecoralGradients": orangecoralGradients,
//   "socialiveGradients": socialiveGradients,
//   "blueskiesGradients": blueskiesGradients,
//   "digitalWaterGradients": digitalWaterGradients
// };

const List<List<Color>> colorThemes = [
  orangeGradients,
  aquaGradients,
  quepalGradients,
  bigheadGradients,
  hydrogenGradients,
  orangecoralGradients,
  socialiveGradients,
  blueskiesGradients,
  digitalWaterGradients
];

const List<Color> orangeGradients = [
  Color(0xFFFF9844),
  Color(0xFFFE8853),
  Color(0xFFFD7267),
];

const List<Color> aquaGradients = [
  Color(0xFF5AEAF1),
  Color(0xFF8EF7DA),
];

const List<Color> quepalGradients = [
  Color(0xFF11998E),
  Color(0xFF38EF7D)
];

const List<Color> bigheadGradients = [
  Color(0xFFC94B4B),
  Color(0xFF4B134F)
];

const List<Color> hydrogenGradients = [
  Color(0xFF667db6),
  Color(0xFF0082c8),
  Color(0xFF0082c8),
  Color(0xFF667db6)
];

const List<Color> orangecoralGradients = [
  Color(0xFFff9966),
  Color(0xFFff5e62)
];

const List<Color> socialiveGradients = [
  Color(0xFF06beb6),
  Color(0xFF48b1bf)
];

const List<Color> blueskiesGradients = [
  Color(0xFF56CCF2),
  Color(0xFF2F80ED)
];

const List<Color> digitalWaterGradients = [
  Color(0xFF74EBD5),
  Color(0xFFACB6E5)
];