import 'package:flutter/material.dart';
import 'package:friendly/validation/login_validation.dart';

class SignInPage extends StatelessWidget {
  final PageController accountController;

  final _duration = const Duration(milliseconds: 300);
  final _curve = Curves.decelerate;

  const SignInPage({
    this.accountController,
    Key key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        buildTopButtons(),
        buildText("Account\nLogin", Colors.black, 60, 0.1),
        LoginForm()
        
      ],
    );
  }

  Widget buildTopButtons() {
    Widget buildBackButton() {
      return Container(
        padding: EdgeInsets.only(left: 20,top: 30),
        child: GestureDetector(
          child: BackButtonIcon(),
          onTap: (){
            accountController.previousPage(duration: _duration, curve: _curve);
          },
        )
      );
    }
    Widget buildFacebookButton() {
      return Container(
        width: 80,
        height: 80,
        padding: EdgeInsets.all(15.0),
        child: FloatingActionButton(
          elevation: 15,
          child: Icon(Icons.face),
          backgroundColor: Colors.blue[300],
          onPressed: (){
            //TODO: Connect to Facebook
          },
        ),
      );
    }    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        buildBackButton(),
        buildFacebookButton()
      ]
    );
  }

  Widget buildText(String text, Color color, double fontSize, double opacity) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(top: 80.0),
        child: Opacity(
          opacity: opacity,
          child: Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontSize: fontSize,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
      ),
    );
  }
}
