import 'package:flutter/material.dart';
import 'package:quik_scan/services/authentication.dart';
import 'package:firebase_database/firebase_database.dart';
import 'qr_generator.dart';
import 'dart:async';
import 'package:quik_scan/pages/recent_scans.dart';
import 'package:quik_scan/pages/settings.dart';

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
      body:
      Column( 
        children: <Widget>[  
          Padding(
            padding: EdgeInsets.all(15),
          ),
        InkWell(
          // onTap: () => showDialog(  
          //   context: context, 
          //   builder: (BuildContext context) { 
          //     return AlertDialog(  
          //       title: Text('Options'),
          //       content: new ListView(
          //         children: <Widget>[  
          //           new DropdownButton<String>(  
          //             items: <String>['Logout'].map((String value) { 
          //               return new DropdownMenuItem<String>(
          //                 value: value,
          //                 child: new Text(value),
          //               );
          //             }).toList(), 
          //             onChanged: (_) {},
          //           )
          //         ],
          //       ) ,
          //     );
          //   }
          // ),
          child: CircleAvatar(
          backgroundImage: NetworkImage('https://icon-library.net/images/no-profile-picture-icon/no-profile-picture-icon-13.jpg'),
          radius: 30,
        ),
      ),

      FlatButton(
        color: Colors.indigo,
       child: new Text('Logout',
        style: new TextStyle(fontSize: 17.0, color: Colors.white)),
       onPressed: signOut),
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
      )
        ],
      ) 

    );
  }
}