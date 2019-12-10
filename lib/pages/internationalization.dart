import 'package:flutter/material.dart';

class Internationalization extends StatefulWidget {
  Internationalization({Key key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => new _InternationalizationState();
}

class _InternationalizationState extends State<Internationalization> {
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
          "Internationalization",
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
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Internationalization', textScaleFactor: 3, textAlign: TextAlign.center,),
          ),
        ],
      ),
    );
  }
}