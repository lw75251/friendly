import 'package:flutter/material.dart';
import 'package:friendly/ui/gradients.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  final PageController controller;
  const LandingPage({
    this.controller,
    Key key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Make Screen Responsive
    // final MediaQueryData queryData = MediaQuery.of(context);
    // final Size _size = queryData.size;
    final double _fontSize = 30.0;

    return Center(
        child: Column(
          children: <Widget>[
            // Logo(50.0,50.0),
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
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0, bottom:  30.0
              ),
              child: WelcomeText(_fontSize),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 250.0),
              child: WelcomeSubText(_fontSize*.6),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: WelcomeButton(12.0),
            ),
            ExistingAccountText()
          ],
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
        child: Text("Hi, Friendly".toUpperCase(),
            style: TextStyle(
              fontSize: _fontSize,
              foreground: Paint()..shader = LinearGradient(
                colors: colorTheme.gradient
              ).createShader(Rect.fromLTRB(0.0, 0.0, 200.0, 70.0))
            )
          ),
      ),
      onPressed: (){

      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
    );
  }
}

class ExistingAccountText extends StatelessWidget {
  const ExistingAccountText({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text("I already have an account".toUpperCase(),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}