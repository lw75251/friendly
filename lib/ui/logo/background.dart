import 'package:divvy/ui/logo/logo_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Logo extends StatelessWidget {
  const Logo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final LogoSize dimensions = Provider.of<LogoSize>(context);

    return Consumer<LogoSize> (
      builder: (context, logoSize, _ ) => Container(
        child: Stack (
          children: <Widget>[
            LogoBackground(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                LogoEye(),
                LogoEye()
              ]),
          ],
        ),
      ),
    );
  }
}

class LogoEye extends StatelessWidget {
  const LogoEye({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LogoSize dimensions = Provider.of<LogoSize>(context);
    return Container(
      width: dimensions.width/6,
      height: dimensions.height/6,
      decoration: BoxDecoration(
        color: Colors.white60,
        shape: BoxShape.circle
      ),
    );
  }
}

class LogoBackground extends StatelessWidget {
  const LogoBackground({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LogoSize dimensions = Provider.of<LogoSize>(context);
    return Container(
      width: dimensions.width,
      height: dimensions.height,
      decoration: BoxDecoration(
        color: Colors.white60,
        shape: BoxShape.circle
      ),
    );
  }
}