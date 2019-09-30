import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AnimatedSlides extends StatefulWidget {
  AnimatedSlides({Key key}) : super(key: key);

  _AnimatedSlidesState createState() => _AnimatedSlidesState();
}

class _AnimatedSlidesState extends State<AnimatedSlides> {

  final PageController controller = PageController(viewportFraction: 0.8);
  int current = 0;
  List slideList = [
    {
      "title": "Addition",
      "icon": FontAwesomeIcons.plus
    }, 
    {
      "title": "Subtraction",
      "icon": FontAwesomeIcons.minus
    }, 
    {
      "title": "Multiplication",
      "icon": FontAwesomeIcons.times
    }, 
    {
      "title": "Division",
      "icon": FontAwesomeIcons.divide
    }, 
    {
      "title": "Custom",
      "icon": FontAwesomeIcons.question
    },                 
  ];

  @override
  void initState() {
    controller.addListener((){
      int next = controller.page.round();
      if ( current != next ) {
        setState(() {
         current = next; 
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      itemCount: slideList.length,
      itemBuilder: (context, int index) {
        bool active = index == current;
        return _buildGamePage(slideList[index], active);
      } 
    );
  }


  _buildGamePage(Map data, bool active){
    final double blur = active ? 30 : 0;
    final double offset = active ? 10 : 0;
    final double top = active ? 150 : 200;

    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeOutQuint,
      margin: EdgeInsets.only(top: top, bottom: 150, right: 30),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black87, blurRadius: blur, offset: Offset(offset, offset))]
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(data["title"], style: TextStyle(fontSize: 40, color: Colors.white)),
            Icon(data["icon"], size: 30, color: Colors.white)
          ],))
    );
  }
}