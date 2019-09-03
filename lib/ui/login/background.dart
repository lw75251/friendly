import 'package:divvy/ui/gradients.dart';
import 'package:flutter/material.dart';
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
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        )
      ),
    );
  }
}