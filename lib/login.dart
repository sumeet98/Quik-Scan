import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'main.dart';
import 'main_menu.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoggedIn = false;

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _login() async {
    try {
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn = true;
      });
    } catch (err) {
      print(err);
    }
  }

  _logout() {
    _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

/*
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Scanner',
      style: optionStyle,
    ),
    Text(
      'Index 1: Recent Scans',
      style: optionStyle,
    ),
    Text(
      'Index 2: Settings',
      style: optionStyle,
    ),
  ];
  

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome To Quik Scan",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.indigo,
      body: Center(
        child: _isLoggedIn
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.network(
                    _googleSignIn.currentUser.photoUrl,
                    height: 50.0,
                    width: 50.0,
                  ),
                  Text(_googleSignIn.currentUser.displayName),
                  OutlineButton(
                    child: Text("Logout"),
                    onPressed: () {
                      _logout();
                    },
                  )
                ],
              )
            : Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                children: [

              Padding( 
               padding: EdgeInsets.all(20), 
              ),

              Image.network( 
                'https://cdn2.iconfinder.com/data/icons/antivirus-internet-security/33/quick_scan-512.png',
                height: 100, 
                width: 200,
              ),

              Padding( 
               padding: EdgeInsets.all(80), 
              ),

              new Container( 
                child: new TextFormField(  
                  style: new TextStyle(  
                    color: Colors.white, 
                  ), 
                  decoration: InputDecoration( 
                  labelText: 'E-Mail',
                  hintText: 'someone@example.com',
                  ),
                ),
                decoration: new BoxDecoration(  
                  borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                  color: Colors.white,
                ),
               // padding: new EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
              ),

              Padding( 
               padding: EdgeInsets.all(8), 
              ),

              new Container( 
                child: new TextFormField( 
                  obscureText: true, 
                  style: new TextStyle(  
                    color: Colors.white, 
                  ), 
                  decoration: InputDecoration( 
                  labelText: 'Password',
                  ),
                ),
                decoration: new BoxDecoration(  
                  borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                  color: Colors.white,
                ),
               // padding: new EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 8.0),
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
              padding: EdgeInsets.fromLTRB(107, 15, 107, 15),
              onPressed: () {
                
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

          Text( 
              "------------ or ------------",
               style: TextStyle(  
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                )
              ),

          Padding( 
            padding: EdgeInsets.all(10),
          ),

        new Container( 
          color: Colors.white,
          child: GestureDetector(
          onTap: () {
          print("Login with google tapped");
          _login();
          },
          child: Image.network( 
            'https://www.c-learning.net/storage/app/media/img/buttons/google-login-button.png',
            width: 200,
          ),
        ),
        ), 

          

                ]
                ),
                
              ),
    
      );
      /*
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            title: Text('Scanner'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text('Recent Scans'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      */
  }
}
