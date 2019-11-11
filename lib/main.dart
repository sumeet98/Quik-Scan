import 'package:flutter/material.dart';
import 'login.dart';
import 'main_menu.dart';
import 'page1.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'bottomNav.dart';
import 'page2.dart';
import 'page3.dart';


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
      home: MainMenu(),
    );
  }
}