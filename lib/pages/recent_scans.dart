import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quik_scan/services/authentication.dart';
import 'package:quik_scan/pages/home_page.dart';
import 'package:quik_scan/pages/login_signup_page.dart';
import 'package:quik_scan/pages/root_page.dart';
import 'package:quik_scan/main.dart';

class RecentScans extends StatelessWidget {
  const RecentScans({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
return Scaffold(
      appBar: AppBar(
        title: Text(
          "Recent Scans",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [

              Padding( 
               padding: EdgeInsets.all(20), 
              ),

              Image.network( 
                'https://2nd-page.de/wp-content/uploads/2018/11/cropped-Bild1-Holz-21.gif',
                height: 200, 
                width: 500,
              ),

              Padding( 
               padding: EdgeInsets.all(80), 
              ),
                ]
                ),
    );
  }
}