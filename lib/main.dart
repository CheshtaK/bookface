import 'package:bookface/routes/routes.dart';
import 'package:bookface/splash.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      onGenerateRoute: Router.generateRoute,
    );
  }
}
