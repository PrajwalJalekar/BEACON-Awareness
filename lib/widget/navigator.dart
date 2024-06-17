// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../screens/agriculture_screen.dart';
import '../screens/education_screen.dart';
import '../screens/government_screen.dart';

class AppNavigator {
  static const String homeRoute = '/';
  static const String agricultureRoute = '/agriculture';
  static const String educationRoute = '/education';
  static const String governmentRoute = '/government';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case agricultureRoute:
        return MaterialPageRoute(builder: (_) => AgricultureScreen());
      case educationRoute:
        return MaterialPageRoute(builder: (_) => EducationScreen());
      case governmentRoute:
        return MaterialPageRoute(builder: (_) => GovernmentScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('Route not defined'),
            ),
          ),
        );
    }
  }

  static void navigateTo(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  static void navigateToAgriculture(BuildContext context) {
    navigateTo(context, agricultureRoute);
  }

  static void navigateToEducation(BuildContext context) {
    navigateTo(context, educationRoute);
  }

  static void navigateToGovernment(BuildContext context) {
    navigateTo(context, governmentRoute);
  }
}
