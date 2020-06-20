import 'dart:async';
import 'package:bookface/constants/images.dart';
import 'package:bookface/constants/strings.dart';
import 'package:bookface/routes/routes.dart';
import 'package:flutter/material.dart';

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
      body: Material(
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
