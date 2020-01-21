import 'package:bookface/categories.dart';
import 'package:bookface/home.dart';
import 'package:bookface/login.dart';
import 'package:bookface/main.dart';
import 'package:bookface/routes/routes.dart';
import 'package:bookface/splash.dart';
import "package:flutter/material.dart";

class Router {
  static Route<dynamic> generateRoute(RouteSettings routesettings) {
    switch (routesettings.name) {
      case Routes.main:
        return MaterialPageRoute(builder: (_) => MyApp());
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case Routes.category:
        return MaterialPageRoute(builder: (_) => CategoryPage());
      default:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
  }
}
