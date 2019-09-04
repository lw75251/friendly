
import 'package:flutter/material.dart';
import 'package:friendly/ui/gradients.dart';
import 'package:provider/provider.dart';

class ColorList extends StatelessWidget {
  const ColorList(this._colors, {Key key}) : super(key: key);
  final List<List<Color>> _colors;

  @override
  Widget build(BuildContext context) {
    final ColorTheme colorTheme = Provider.of<ColorTheme>(context);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      addRepaintBoundaries: false,
      itemCount: _colors.length,
      itemBuilder: (context, int) {
        return GestureDetector(
          child: ColorWheel(_colors[int]),
          onTap: () {
            colorTheme.gradient = _colors[int];
          }
        );
      },
    );
  }
}

class ColorScroll extends StatelessWidget {
  const ColorScroll({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(

    );
  }
}

class ColorWheel extends StatelessWidget {
    final List<Color> _gradient;
    const ColorWheel(this._gradient, {Key key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      double _width = 80.0;
      double _height = _width;
      return Padding(
          padding: const EdgeInsets.all(7.0),
          child: Container(
            width: _width,
            height: _height,
            decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black)],
              gradient: LinearGradient(
                colors: _gradient,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight
              ),
              shape: BoxShape.circle,
              border: Border.all(width: 5, color: Colors.white)
            ),
          ),
      );
    }
  }