// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:multirole_app/pages/login_screen.dart';
import 'package:multirole_app/pages/splash_screen.dart';
import 'pages/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
