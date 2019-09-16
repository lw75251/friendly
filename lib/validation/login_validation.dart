import 'package:flutter/material.dart';
import 'package:friendly/ui/gradients.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  @override
  LoginFormState createState() {
    return LoginFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class LoginFormState extends State<LoginForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<LoginFormState>.
  final _color = Colors.white;
  final _formKey = GlobalKey<FormState>();
  final _fieldFontSize = 30.0;
  final _labelFontSize = 12.0;

  Widget buildRecoverButton(bool show) {
    return show ? GestureDetector(
      child: Container(
        child: Text("Forgot?".toUpperCase(),
          style: TextStyle(color: _color, fontSize: _labelFontSize,),
        ),
      ),
      onTap: (){
        //TODO: Toast Message to Reset Password by providng Email
      },
    ) : Container();
  }

  buildTextFieldForm(String string, String label, bool obscure) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            decoration: InputDecoration.collapsed(hintText: string,
              hintStyle: TextStyle(color: _color, fontSize: _fieldFontSize)
            ),
            style: TextStyle(color: _color, fontSize: _fieldFontSize),
            obscureText: obscure,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(label, 
                  textAlign: TextAlign.left,
                  style: TextStyle(color: _color, fontSize: _labelFontSize,)
                ),
                buildRecoverButton(obscure)
              ],
            )
          )
        ],
      ),
    );
  }

  Widget buildButton(String text, double _fontSize, _colors ) {
    return RaisedButton(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50, top: 10.0, bottom: 10.0 ),
        child: Text(text.toUpperCase(),
            style: TextStyle(
              fontSize: _fontSize,
              foreground: Paint()..shader = LinearGradient(
                colors: _colors
              ).createShader(Rect.fromLTRB(0.0, 0.0, 200.0, 70.0))
            )
          ),
      ),
      onPressed: (){
        // TODO: Sign In Validation and Logic 
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))
    );
  }

  Widget buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildTextFieldForm("Email", "Account Email".toUpperCase(), false),
          buildTextFieldForm("Password", "Account Password".toUpperCase(), true),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    final ColorTheme colorTheme = Provider.of<ColorTheme>(context);
    return Stack(
      children: <Widget>[
        buildLoginForm(),
        Align(
          alignment: FractionalOffset.bottomCenter,
          child:  Padding(
            padding: const EdgeInsets.symmetric(vertical: 80.0),
            child: buildButton("Sign In".toUpperCase(), 18.0, colorTheme.gradient),
          ),
        )
      ],
    );

  }
}