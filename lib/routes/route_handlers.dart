import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:friendly/ui/gradients.dart';
import 'package:friendly/ui/home/home_screen.dart';
import 'package:friendly/ui/login/background.dart';
import 'package:friendly/ui/login/landing.dart';
import 'package:friendly/ui/login/slides.dart';
import 'package:provider/provider.dart';

Handler welcomeHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return ChangeNotifierProvider(
      builder: (context) => ColorTheme(quepalGradients),
      child: Material(
        child: Stack(
          children: <Widget>[
            Background(),
            LandingScreen()
          ],
        ),
      ),
    );

  });

Handler mainHandler = Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params ) {
    List<Color> gradient = quepalGradients;
    return ChangeNotifierProvider(
          builder: (context) => ColorTheme(gradient),
          child: HomeScreen()
    );
  });

// Handler demoRouteHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   String message = params["message"]?.first;
//   String colorHex = params["color_hex"]?.first;
//   String result = params["result"]?.first;
//   Color color = Color(0xFFFFFFFF);
//   if (colorHex != null && colorHex.length > 0) {
//     color = Color(ColorHelpers.fromHexString(colorHex));
//   }
//   return DemoSimpleComponent(message: message, color: color, result: result);
// });

// Handler demoFunctionHandler = Handler(
//     type: HandlerType.function,
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//       String message = params["message"]?.first;
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text(
//               "Hey Hey!",
//               style: TextStyle(
//                 color: const Color(0xFF00D6F7),
//                 fontFamily: "Lazer84",
//                 fontSize: 22.0,
//               ),
//             ),
//             content: Text("$message"),
//             actions: <Widget>[
//               Padding(
//                 padding: EdgeInsets.only(bottom: 8.0, right: 8.0),
//                 child: FlatButton(
//                   onPressed: () {
//                     Navigator.of(context).pop(true);
//                   },
//                   child: Text("OK"),
//                 ),
//               ),
//             ],
//           );
//         },
//       );
//     });

// /// Handles deep links into the app
// /// To test on Android:
// ///
// /// `adb shell am start -W -a android.intent.action.VIEW -d "fluro://deeplink?path=/message&mesage=fluro%20rocks%21%21" com.theyakka.fluro`
// Handler deepLinkHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   String colorHex = params["color_hex"]?.first;
//   String result = params["result"]?.first;
//   Color color = Color(0xFFFFFFFF);
//   if (colorHex != null && colorHex.length > 0) {
//     color = Color(ColorHelpers.fromHexString(colorHex));
//   }
//   return DemoSimpleComponent(
//       message: "DEEEEEP LINK!!!", color: color, result: result);
// });
