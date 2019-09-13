import 'package:flutter/material.dart';

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
  final _fieldSize = 20.0;
  final _labelSize = 12.0;

  buildTextFieldForm(String string, String label ) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration.collapsed(hintText: string),
            style: TextStyle(color: _color, fontSize: _fieldSize),
          ),
          Text(label, 
            textAlign: TextAlign.left,
            style: TextStyle(color: _color, fontSize: _labelSize,))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          buildTextFieldForm("Email", "Account Email".toUpperCase()),
          buildTextFieldForm("Password", "Account Password".toUpperCase())

        ],
      ),
    );
  }
}