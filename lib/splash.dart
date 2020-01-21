import 'dart:async';
import 'package:bookface/constants/images.dart';
import 'package:bookface/constants/strings.dart';
import 'package:bookface/routes/routes.dart';
import 'package:flutter/material.dart';

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
    return Material(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0xFF915FB5), const Color(0xFFCA436B)],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              Images.app_logo,
            ),
            Text(
              Strings.app_name,
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  fontSize: 40,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }

  startTimer() {
    var _duration = Duration(milliseconds: 5000);
    return Timer(_duration, navigate);
  }

  navigate() async {
    Navigator.of(context).pushNamed(Routes.login);
  }
}
