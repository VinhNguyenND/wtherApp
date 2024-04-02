import 'package:flutter/material.dart';
import 'package:my_weather/App/presentation/routers/route_name.dart';
import 'package:my_weather/App/presentation/screens/splash/splash.dart';

import '../screens/home/home_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    final initialWidget = Splash();
    Widget routeWidget = initialWidget;
    final arguments = routeSettings.arguments;

    switch (routeSettings.name) {
      case RouteName.root:
        break;
      case RouteName.home:
        routeWidget = HomeScreen();
      default:
        routeWidget = initialWidget;
        break;
    }

    return MaterialPageRoute(
        builder: (_) => routeWidget, settings: routeSettings);
  }
}
