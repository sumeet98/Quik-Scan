import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quik_scan/services/authentication.dart';
import 'package:quik_scan/pages/home_page.dart';
import 'package:quik_scan/pages/login_signup_page.dart';
import 'package:quik_scan/pages/root_page.dart';
import 'package:quik_scan/main.dart';

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
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
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXiHRYTHatSdMe0hyLbo4QJc9pr0b_QB0T6bOCNn59_ucYR-jN&s',
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