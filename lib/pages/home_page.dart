import 'package:flutter/material.dart';
import 'package:quik_scan/services/authentication.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'login.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:quik_scan/pages/recent_scans.dart';
import 'package:quik_scan/pages/about_us.dart';
import 'dart:io';


class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //  void notificationNow() {
   // notifications.sendNotificationsNow('Upgrade to Premium', 'Two weeks left in free trial.', 'payload');
  //}

  signOut() async {
    Navigator.pushReplacementNamed(context, "/logout");
  }

  String data = 'Enter data';
  final controller = TextEditingController();

  void generateQR() {
    setState(() {
      data = controller.text;
    });

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('QR code generated'),
//          actions: <Widget>[
//            FlatButton(
//              onPressed: () {
//
//              },
//            )
//          ]
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          "Quik Scan",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
            new FlatButton(
                child: new Text('Logout',
                    style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                onPressed: signOut)
          ],
        automaticallyImplyLeading: false,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.all(15)
              ),
              QrImage(
                data: data,
                version: QrVersions.auto,
                size: 200.0,
              ),
              Spacer(),
              Text('Enter a string to generate'),
              Container(
                padding: EdgeInsets.all(5),
                width: 300,
                child: TextField(
                  controller: controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter data',
                    )
                ),
              ),
              FlatButton(
                color: Colors.indigo,
                child: Text('Generate', style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                onPressed: generateQR
              )
            ],
          ),
        ],
      )
    );
  }
}