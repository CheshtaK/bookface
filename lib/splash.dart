import 'dart:async';
import 'package:bookface/constants/images.dart';
import 'package:bookface/constants/strings.dart';
import 'package:bookface/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'helpers/connection.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 30,
                    bottom: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        FadeIn(
                          1.9,
                          Logo(),
                        ),
                        FadeIn(
                          2.1,
                          AppName(),
                        ),
                        FadeIn(
                          2.1,
                          AppTag(),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 30,
                    width: 80,
                    height: 200,
                    child: FadeIn(
                      1.0,
                      Light1(),
                    ),
                  ),
                  Positioned(
                    left: 80,
                    width: 80,
                    height: 150,
                    child: FadeIn(
                      1.3,
                      Light2(),
                    ),
                  ),
                  Positioned(
                    right: 50,
                    width: 100,
                    height: 150,
                    top: 60,
                    child: FadeIn(
                      1.6,
                      Clock(),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    width: 80,
                    height: 150,
                    bottom: 30,
                    child: FadeIn(
                      2.4,
                      Plant(),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    width: 240,
                    height: 240,
                    bottom: 40,
                    child: FadeIn(
                      2.7,
                      Bubble(),
                    ),
                  ),
                  Positioned(
                    right: 27,
                    width: 200,
                    height: 450,
                    bottom: 0,
                    child: FadeIn(
                      2.7,
                      Lamp(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _displayToast(String message) {
    /*
    This function will initialize a toast snakbar with the passed message String
    */

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  startTimer() async {
    var _duration = Duration(milliseconds: 5000);

    final bool connection = await isConnected();

    if (connection) // Connected To Internet
    {
      Timer(_duration, navigate);
    } else // Internet Connection Is Not Available
    {
      _displayToast("An Internet Connection Is Required.");
      //  Re-checks for internet availability again, after fixed _duration.
      Timer(_duration, startTimer);
    }
  }

  navigate() async {
    Navigator.of(context).pushNamed(Routes.login);
  }
}

enum _AniProps { opacity, translateY }

class FadeIn extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeIn(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<_AniProps>()
      ..add(_AniProps.opacity, Tween(begin: 0.0, end: 1.0),
          Duration(milliseconds: 500))
      ..add(_AniProps.translateY, Tween(begin: -30.0, end: 0.0),
          Duration(milliseconds: 500), Curves.easeOut);

    return PlayAnimation<MultiTweenValues<_AniProps>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(_AniProps.opacity),
        child: Transform.translate(
          offset: Offset(value.get(_AniProps.translateY), 0),
          child: child,
        ),
      ),
    );
  }
}

class Light1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Images.light1),
        ),
      ),
    );
  }
}

class Light2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Images.light2),
        ),
      ),
    );
  }
}

class Clock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Images.clock),
        ),
      ),
    );
  }
}

class Plant extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Images.plant),
        ),
      ),
    );
  }
}

class Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Images.bubble),
        ),
      ),
    );
  }
}

class Lamp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Images.lamp),
        ),
      ),
    );
  }
}

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      shape: CircleBorder(),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 90,
        child: Image.asset(
          Images.app_logo,
          width: 120,
          height: 120,
        ),
      ),
    );
  }
}

class AppName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      Strings.app_name,
      textDirection: TextDirection.ltr,
      style: TextStyle(
        fontSize: 50,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w300,
      ),
    );
  }
}

class AppTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      Strings.tagline,
      textDirection: TextDirection.ltr,
      style: TextStyle(
        fontSize: 30,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w200,
      ),
    );
  }
}
