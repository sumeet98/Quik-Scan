import 'package:flutter/material.dart';
import 'package:quik_scan/services/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import 'qr_generator.dart';
import 'barcode_scanner.dart';
import 'dart:async';
import 'package:quik_scan/pages/recent_scans.dart';
import 'package:quik_scan/pages/about_us.dart';

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

  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();

  }


  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
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
      body:

      Column(  
        children: <Widget>[  

      FlatButton(
        color: Colors.indigo,
        child: Text('Generator placeholder'),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => QRGenerator()
              )
          );
        },
      ), 

      FlatButton(
        color: Colors.indigo,
        child: Text('Barcode placeholder'),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => BarcodeScanner()
              )
          );
        },
      )

        ],
      ) 

      ); 

    
  }
}