import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:friendly/ui/gradients.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key key}) : super(key: key);

  Widget _buildDifficulty(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[
        Text("Date Range", 
          style: TextStyle(color: Colors.white54, fontSize: 25,
        ),),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // DifficultyButton("Easy"),
            // DifficultyButton("Medium"),
            // DifficultyButton("Hard"),
            // DifficultyButton("Custom")
          ]),
      ])
    );
  }
  
  @override
  Widget build(BuildContext context) {
    // final ColorTheme _colorTheme = Provider.of<ColorTheme>(context);

    return Container(
      child: ListView(
        children: <Widget>[
          _buildDifficulty()
        ],
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: quepalGradients,
        // gradient: LinearGradient(colors: _colorTheme.gradient, 
          begin: Alignment.topLeft,
          end: Alignment.bottomRight
        ),

      )
    );
  }

}

class DifficultyButton extends StatefulWidget {
  final String text;
  final Color activeColor;
  final Color color;

  const DifficultyButton(
    this.text,
   {this.activeColor,
    this.color,
    Key key,
    }) : super(key: key);

  _DifficultyButtonState createState() => _DifficultyButtonState();
}

class _DifficultyButtonState extends State<DifficultyButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(widget.text,
        style: TextStyle(color: widget.activeColor),
      ),
      color: Color.fromRGBO(0, 0, 0, .2),
      disabledColor: widget.color,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
      onPressed: (){setState(() {
        
      });},
    );
  }
}