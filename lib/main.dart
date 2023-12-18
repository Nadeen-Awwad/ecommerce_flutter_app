import 'package:flutter/material.dart';
import 'package:flutter_application_1/Registration/splash_screen.dart';

void main() => runApp(MyApp());

class PageLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SplashScreen',
      home: PageLoader(),
      debugShowCheckedModeBanner: false,
    );
  }
}
