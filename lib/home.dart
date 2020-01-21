import 'package:bookface/widgets/custom_outline_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
              Text("Welcome to bookface",
                  style: TextStyle(
                      fontSize: 30,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold)),
              Padding(
                padding: EdgeInsets.only(bottom: 30),
              ),
              CustomOutlineButton(
                height: 50.0,
                width: 300.0,
                text: "Google Login",
                color: Colors.white70,
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 5),
              ),
              CustomOutlineButton(
                height: 50.0,
                width: 300.0,
                text: "Facebook Login",
                color: Colors.white70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
