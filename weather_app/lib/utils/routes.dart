import 'package:flutter/material.dart';
import 'package:weather_app/screens/authentication_screen.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/screens/weather_screen.dart';

import 'constants.dart';

class RouterGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Constants.homeRoute:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case Constants.loginSignUpChooseRoute:
        return MaterialPageRoute(
            builder: (context) => const AuthenticationScreen());

      case Constants.weatherScreenRoute:
        return MaterialPageRoute(builder: (context) => const WeatherScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (context) {
      return const Scaffold(
        body: Center(
          child: Text('Page not found'),
        ),
      );
    });
  }
}
