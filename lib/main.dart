import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(TheatreApp());

class TheatreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(),
      },
    );
  }
}