import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quik_scan/services/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:quik_scan/pages/home_page.dart';
import 'package:quik_scan/pages/login_signup_page.dart';
import 'package:quik_scan/pages/root_page.dart';
import 'package:quik_scan/main.dart';

class RecentScans extends StatefulWidget {
  RecentScans({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _RecentScansState();
}

  class _RecentScansState extends State<RecentScans> {

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
return Scaffold(
      appBar: AppBar(
        title: Text(
          "Recent Scans",
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
