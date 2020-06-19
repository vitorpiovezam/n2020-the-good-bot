import 'package:n2020_the_good_bot/screens/cases.screen.dart';
import 'package:n2020_the_good_bot/screens/complaint/list.screen.dart';
import 'package:n2020_the_good_bot/screens/complaint/new.screen.dart';
import 'package:n2020_the_good_bot/screens/login.screen.dart';
import 'package:n2020_the_good_bot/screens/menu.screen.dart';
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
        '/complaint-new': (context) => NewComplaintScreen(),
        '/complaint-list': (context) => ComplaintListScreen(),
        '/complaint-detail': (context) => NewComplaintScreen(),
        '/cases': (context) => CasesScreen(),
        //'/bot': (context) => AboutScreen(),
      },
    );
  }
}
