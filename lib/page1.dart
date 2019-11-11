import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'main.dart';
import 'main_menu.dart';
import 'login.dart';

class Page1 extends StatelessWidget {
  final User user;

  Page1({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hello ${user.name}",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.indigo,
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Padding(
          padding: EdgeInsets.all(20),
        ),
        Image.network(
          'https://cdn2.iconfinder.com/data/icons/antivirus-internet-security/33/quick_scan-512.png',
          height: 200,
          width: 500,
        ),
        Padding(
          padding: EdgeInsets.all(80),
        ),
      ]),
    );
  }
}
