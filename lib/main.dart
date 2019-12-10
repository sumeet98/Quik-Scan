import 'package:flutter/material.dart';
import 'package:quik_scan/pages/about_us.dart';
import 'package:quik_scan/pages/geolocation.dart';
import 'package:quik_scan/pages/internationalization.dart';
import 'package:quik_scan/pages/login.dart';
import 'package:quik_scan/pages/recent_scans.dart';
import 'package:quik_scan/pages/settings.dart';
import 'package:quik_scan/pages/tables.dart';

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
        home: new Login(),
        routes: {
        "/logout": (_) => new Login(),
        "/tables": (_) => new Tables(),
        "/geo": (_) => new Geo(),
        "/inter": (_) => new Internationalization(),
        "/about": (_) => new AboutUs(),
        "/settings": (_) => new Settings(),
        "/recentscans": (_) => new RecentScans(),
      },
    );
  }
}