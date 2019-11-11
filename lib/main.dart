import 'package:flutter/material.dart';
import 'package:quik_scan/services/authentication.dart';
import 'package:quik_scan/pages/root_page.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Welcome to Quik Scan',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: new RootPage(auth: new Auth()));
  }
}