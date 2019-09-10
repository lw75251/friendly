import 'package:flutter/material.dart';

List<String> images = ["assets/1.jpg", "assets/2.jpg", "assets/3.jpg"];

List<String> text0 = ["春归何处。寂寞无行路", "春无踪迹谁知。除非问取黄鹂", "山色江声相与清，卷帘待得月华生"];
List<String> text1 = ["若有人知春去处。唤取归来同住", "百啭无人能解，因风飞过蔷薇", "可怜一曲并船笛，说尽故人离别情。"];

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Text("Second");

    // return Container(
    //   child: TransformerPageView(
    //     transformer: PageTransformerBuilder(
    //       builder: (child, info) => Material(
    //         textStyle: TextStyle(color: Colors.white),
    //         child: Stack(
    //           children: <Widget>[
    //             LandingScreen(),
    //             SignInScreen(),
    //           ],
    //         ),
    //       )
    //     ),
    //     itemCount: 2,
    //   )
    // );

    // return Container(
    //   child: Stack(
    //     children: <Widget>[
    //       TransformerPageView(
    //           transformer: PageTransformerBuilder(
    //               builder: (Widget child, TransformInfo info) {
    //             return Material(
    //                 textStyle: TextStyle(color: Colors.white),
    //                 child: Stack(
    //                   fit: StackFit.expand,
    //                   children: <Widget>[
    //                     ParallaxImage.asset(
    //                       images[info.index],
    //                       position: info.position,
    //                     ),
    //                     DecoratedBox(
    //                       decoration: BoxDecoration(
    //                         gradient: LinearGradient(
    //                           begin: FractionalOffset.bottomCenter,
    //                           end: FractionalOffset.topCenter,
    //                           colors: [
    //                             const Color(0xFF000000),
    //                             const Color(0x33FFC0CB),
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                     Positioned(
    //                       child: Column(
    //                         mainAxisSize: MainAxisSize.min,
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: <Widget>[
    //                           ParallaxContainer(
    //                             child: Text(
    //                               text0[info.index],
    //                               style: TextStyle(fontSize: 15.0),
    //                             ),
    //                             position: info.position,
    //                             translationFactor: 300.0,
    //                           ),
    //                           SizedBox(
    //                             height: 8.0,
    //                           ),
    //                           ParallaxContainer(
    //                             child: Text(text1[info.index],
    //                                 style: TextStyle(fontSize: 18.0)),
    //                             position: info.position,
    //                             translationFactor: 200.0,
    //                           ),
    //                         ],
    //                       ),
    //                       left: 10.0,
    //                       right: 10.0,
    //                       bottom: 10.0,
    //                     )
    //                   ],
    //                 ),
    //               );
    //           }),
    //           itemCount: 3)
    //     ],
    //   ),
    // );
  }
}
