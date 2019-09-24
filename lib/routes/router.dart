// import 'package:flutter/material.dart';
// import 'package:friendly/routes/undefined_view.dart';
// import 'package:friendly/ui/gradients.dart';
// import 'package:friendly/ui/login/landing.dart';
// import 'package:friendly/ui/login/slides.dart';

// const String LandingScreenRoute = '/';
// const String SignUpRoute = 'signup';

// class Router {
  

//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case LandingScreenRoute:
//         return MaterialPageRoute(builder: (_) => LandingScreen());
//       case SignUpRoute:
//         return MaterialPageRoute(builder: (context) => FriendlySwiper());
//       default:
//         return MaterialPageRoute(builder: (context) => UndefinedView(name: settings.name,));
//     }
//   }
// }

import 'package:fluro/fluro.dart';
import 'package:friendly/routes/route_handlers.dart';


const String welcomeRoute = '/';
const String homeRoute = '/home';

final router = Router();

class Routes {
  static void defineRoutes(Router router) {
    router.define(welcomeRoute, handler: welcomeHandler, transitionType: TransitionType.fadeIn);
    router.define(homeRoute, handler: mainHandler, transitionType: TransitionType.fadeIn);
    // router.define(demoSimpleFixedTrans,
    //     handler: demoRouteHandler, transitionType: TransitionType.inFromLeft);
    // router.define(demoFunc, handler: demoFunctionHandler);
    // router.define(deepLink, handler: deepLinkHandler);

    // it is also possible to define the route transition to use
    // router.define("users/:id", handler: usersHandler, transitionType: TransitionType.inFromLeft);
  }
}

// class SlideRightRoute extends PageRouteBuilder {
//   final Widget page;
//   SlideRightRoute({this.page})
//       : super(
//           pageBuilder: (
//             BuildContext context,
//             Animation<double> animation,
//             Animation<double> secondaryAnimation,
//           ) =>
//               page,
//           transitionsBuilder: (
//             BuildContext context,
//             Animation<double> animation,
//             Animation<double> secondaryAnimation,
//             Widget child,
//           ) =>
//               SlideTransition(
//                 position: Tween<Offset>(
//                   begin: const Offset(-1, 0),
//                   end: Offset.zero,
//                 ).animate(animation),
//                 child: child,
//               ),
//         );
// }