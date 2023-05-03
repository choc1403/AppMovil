import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:apptaller/Pages/Pages.dart';

const String ROUTE_HOME = "/home";
const String ROUTE_NOTA = "/nuevo";

class MyRouters {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/home":
        return MaterialPageRoute(builder: (_) => MyHomePage());
      case "/nuevo":
        return MaterialPageRoute(builder: (_) => ModalNota());
      default:
        return MaterialPageRoute(builder: (_) => MyHomePage());
    }
  }
}
