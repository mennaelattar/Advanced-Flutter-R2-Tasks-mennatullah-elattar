import 'package:flutter/material.dart';
import 'package:day_3/views/screens/home_screen/index.dart';

class RoutesApp {
  static Map<String, Widget Function(BuildContext)> routes = {
    "login": (context) => HomeScreen(),
    "home": (context) => HomeScreen()
  };
}
