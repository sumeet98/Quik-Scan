import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quik_scan/services/authentication.dart';
import 'package:quik_scan/pages/home_page.dart';

import 'package:quik_scan/main.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:io';

class AboutUs extends StatefulWidget {
  AboutUs({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _AboutUsState();
}

  class _AboutUsState extends State<AboutUs> {

  final FirebaseDatabase _database = FirebaseDatabase.instance;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();

  }


  signOut() async {
   Navigator.pushReplacementNamed(context, "/logout");
  }

  @override
  Widget build(BuildContext context) {
return Scaffold(
      appBar: AppBar(
        title: Text(
          "About Us",
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
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[  
          ListTile( 
            title: Text('Developers', textScaleFactor: 3, textAlign: TextAlign.center,),
            subtitle: Text('', textAlign: TextAlign.right,),
          ),
          ListTile( 
            title: Text('Brandon Campbell', textScaleFactor: 2, textAlign: TextAlign.justify,),
            subtitle: Text('100555879', textAlign: TextAlign.right,),
          ),
          ListTile( 
            title: Text('Gage Adam', textScaleFactor: 2, textAlign: TextAlign.justify,),
            subtitle: Text('idk yet', textAlign: TextAlign.right,),
          ),
          ListTile( 
            title: Text('Liangyu Zhao', textScaleFactor: 2, textAlign: TextAlign.justify,),
            subtitle: Text('idk yet', textAlign: TextAlign.right,),
          ),
          ListTile( 
            title: Text('Sumeet Dhillon', textScaleFactor: 2, textAlign: TextAlign.justify,),
            subtitle: Text('100615629', textAlign: TextAlign.right,),
          ),
          ListTile( 
            title: Text('Zain Ansari', textScaleFactor: 2, textAlign: TextAlign.justify,),
            subtitle: Text('100586120', textAlign: TextAlign.right,),
          ),
        ], 
      ),
    );
  }
}