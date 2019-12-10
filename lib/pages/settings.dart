import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  Settings({Key key,})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => new _SettingsState();
}

class _SettingsState extends State<Settings> {
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
            "Settings",
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
        ),
        backgroundColor: Colors.white,
        body: Column( 
          children: <Widget>[
          Padding( 
              padding: EdgeInsets.all(10),
            ),  
          Text("App Version: 1.0", style: TextStyle( fontSize: 17.0, color: Colors.indigo)
          ),
          Padding( 
              padding: EdgeInsets.all(10),
          ),
          Text('© 2019 Quik Scan', style: TextStyle( fontSize: 17.0, color: Colors.indigo),
          )
          ]
        )
    );
  }
}