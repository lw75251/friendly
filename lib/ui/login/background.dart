
import 'package:flutter/material.dart';
import 'package:friendly/ui/gradients.dart';
import 'package:provider/provider.dart';

class Background extends StatelessWidget {
  const Background({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final ColorTheme colorTheme = Provider.of<ColorTheme>(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colorTheme.gradient,
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter
        )
      ),
    );
  }
}