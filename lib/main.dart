import 'package:college_backoffice/screens/about.screen.dart';
import 'package:college_backoffice/screens/login.screen.dart';
import 'package:college_backoffice/screens/login.screen.dart';
import 'package:college_backoffice/screens/menu.screen.dart';
import 'package:college_backoffice/screens/presence.screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(),
        '/home_screen': (context) => MenuScreen(),
        '/presence': (context) => PresenceScreen(),
        '/about': (context) => AboutScreen(),
      },
    );
  }
}
