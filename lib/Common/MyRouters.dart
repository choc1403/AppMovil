import 'package:flutter/cupertino.dart';

const String ROUTE_HOME = "/home";
const String ROUTE_NOTA = "nuevo";

class MyRouters {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/home":
        return PageTransition();
    }
  }
}
