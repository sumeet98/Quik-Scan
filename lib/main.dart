import 'package:flutter/material.dart';
import 'login.dart';
import 'main_menu.dart';
import 'package:google_sign_in/google_sign_in.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Quik Scan',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: MainMenu(title: 'Welcome to Quik Scan'),
      routes: <String, WidgetBuilder>{
      '/gotoLogin': (BuildContext context) {
      return Login(title: 'Login');
      },
      }
    );
  }
}