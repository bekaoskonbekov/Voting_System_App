import 'package:flutter/material.dart';
import 'package:voting_system_app/core/widgets/splash_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: SplashScreen());
  }
}
