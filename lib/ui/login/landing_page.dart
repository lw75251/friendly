import 'package:flutter/material.dart';
import 'package:friendly/ui/gradients.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  final PageController landingController;
  final PageController accountController;

  final _duration = const Duration(milliseconds: 300);
  final _curve = Curves.decelerate;

  const LandingPage({
    this.landingController,
    this.accountController,
    Key key
  }) : super(key: key);

  Widget buildButton(double _fontSize, _colors ) {
    return RaisedButton(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50, top: 10.0, bottom: 10.0 ),
        child: Text("Hi, Friendly".toUpperCase(),
            style: TextStyle(
              fontSize: _fontSize,
              foreground: Paint()..shader = LinearGradient(
                colors: _colors
              ).createShader(Rect.fromLTRB(0.0, 0.0, 200.0, 70.0))
            )
          ),
      ),
      onPressed: (){
        landingController.nextPage(duration: _duration, curve: _curve); 
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
    );
  }

  Widget buildText(String string, double fontSize, Color color, EdgeInsets padding) {
    return Padding (
      padding: padding, 
      child: Text(string,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: fontSize),
      ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: Make Screen Responsive
    // final MediaQueryData queryData = MediaQuery.of(context);
    // final Size _size = queryData.size;
    final double _fontSize = 30.0;
    final Color _fontColor = Colors.white;
    final ColorTheme _colorTheme = Provider.of<ColorTheme>(context);
    final List<Color> _colors = _colorTheme.gradient;


    return Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 50.0, bottom: 10.0
              ),
              child: Hero(
                tag: "logo",
                child: FlutterLogo(
                  size: 150.0
                ),  
              ),
            ),
            buildText("Hi there,\n I'm Reflectly",
              _fontSize, _fontColor, EdgeInsets.only(top: 10.0, bottom: 30.0)
            ),
            // buildText("Hi there,\n I'm Reflectly",
            //   _fontSize, _fontColor, EdgeInsets.only(top: 260.0, bottom: 30.0)
            // ),
            buildText("Your new personal relationship \n management companion",
              _fontSize*.6, _fontColor, EdgeInsets.only(bottom: 250.0)
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: buildButton(_fontSize/1.5, _colors)
            ),
            InkWell(
              child: buildText("I already have an account".toUpperCase(), 
                _fontSize/2.5, _fontColor, EdgeInsets.only(bottom: 5.0)),
              onTap: (){
                accountController.nextPage(duration: _duration, curve: _curve);
              },
            )
          ],
        ),
    );

  }
}