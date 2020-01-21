import 'package:bookface/constants/strings.dart';
import 'package:bookface/routes/routes.dart';
import 'package:bookface/widgets/custom_outline_button.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [const Color(0xFF915FB5), const Color(0xFFCA436B)],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(Strings.welcome,
                  style: TextStyle(
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold)),
              Padding(
                padding: EdgeInsets.only(bottom: 5),
              ),
              Text(Strings.tagline,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold)),
              Padding(
                padding: EdgeInsets.only(bottom: 40),
              ),
              CustomOutlineButton(
                height: 50.0,
                width: 300.0,
                text: Strings.google_login,
                color: Colors.white70,
                onPressed: () =>
                    Navigator.of(context).pushNamed(Routes.category),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5),
              ),
              CustomOutlineButton(
                height: 50.0,
                width: 300.0,
                text: Strings.facebook_login,
                color: Colors.white70,
                onPressed: () =>
                    Navigator.of(context).pushNamed(Routes.category),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
