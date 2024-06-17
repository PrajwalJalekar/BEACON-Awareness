//lib/main.dart
import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../widget/navigator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppNavigator.generateRoute,
      initialRoute: AppNavigator.homeRoute,
      home: HomeScreen(),
    );
  }
}
