
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:friendly/routes/router.dart';
import 'package:friendly/routes/undefined_view.dart';
import 'package:friendly/ui/gradients.dart';
import 'package:friendly/ui/login/background.dart';
import 'package:friendly/ui/login/slides.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  MyApp(){
    Routes.defineRoutes(router);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      title: 'Flutter Demo',

      // *THEME 
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.black,
        fontFamily: 'Varela',
        textTheme: TextTheme(
          body1: TextStyle(fontSize: 14.0, fontFamily: 'Montserrat'),
        ),
      ),

      // *ROUTES 
      // initialRoute: welcomeRoute,
      onGenerateRoute: router.generator,
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => UndefinedView(
              name: settings.name,
      )),
    );
  }
}