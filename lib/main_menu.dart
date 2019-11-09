import 'package:flutter/material.dart';
import 'main.dart';
import 'login.dart';
import 'page1.dart';

class MainMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(75),
            ),
            Image.network(
              'https://cdn2.iconfinder.com/data/icons/antivirus-internet-security/33/quick_scan-512.png',
              height: 100,
              width: 200,
            ),
            Text(
              "Quik Scan",
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.w700,
              ),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(75),
                ),
                FlatButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.white)),
                  color: Colors.indigo,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(107, 15, 107, 15),
                  onPressed: () {
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new Login()));
                  },
                  child: Text(
                    "Login".toUpperCase(),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                FlatButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.white)),
                  color: Colors.indigo,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(100, 15, 100, 15),
                  onPressed: () {},
                  child: Text(
                    "Sign Up".toUpperCase(),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                FlatButton(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.white),
                  ),
                  color: Colors.indigo,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(25, 7, 25, 7),
                  onPressed: () {
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => new Page1(user: new User("guest", "url"))));
                  },
                  child: Text(
                    "Skip".toUpperCase(),
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}
