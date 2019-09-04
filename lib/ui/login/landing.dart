import 'package:flutter/material.dart';
import 'package:friendly/ui/gradients.dart';
import 'package:provider/provider.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _fontSize = 30.0; 
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            // Logo(50.0,50.0),
            FlutterLogo(
              size: 150.0
            ),
            WelcomeText(_fontSize),
            WelcomeSubText(_fontSize),
            WelcomeButton(_fontSize)
          ],
        ),
      ),
    );
  }
}

class WelcomeText extends StatelessWidget {
  final double _fontSize;
  const WelcomeText( this._fontSize, {Key key}): super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Hi there,\n I'm Reflectly",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: _fontSize, color: Colors.white) 
      ),
    );
  }
}

class WelcomeSubText extends StatelessWidget {
  final double _fontSize;
  const WelcomeSubText(this._fontSize, {Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Your new personal relationship \n management companion",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: _fontSize, color: Colors.white),
      ),
    );
  }
}

class WelcomeButton extends StatelessWidget {
  final double _fontSize;

  const WelcomeButton(this._fontSize, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ColorTheme colorTheme = Provider.of<ColorTheme>(context);

    return RaisedButton(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50, top: 10.0, bottom: 10.0 ),
        child: Text("Hi, Friendly",
            style: TextStyle(
              fontSize: _fontSize,
              foreground: Paint()..shader = LinearGradient(
                colors: colorTheme.gradient
              ).createShader(Rect.fromLTRB(0.0, 0.0, 200.0, 70.0))
            )
          ),
      ),
      onPressed: (){},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
    );
  }
}