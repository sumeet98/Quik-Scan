import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _isLoggedIn = false;

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _login() async{
    try{
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn = true;
      });
    } catch (err){
      print(err);
    }
  }

  _logout(){
    _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome To Quik Scan", 
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
                      Image.network(_googleSignIn.currentUser.photoUrl, height: 50.0, width: 50.0,),
                      Text(_googleSignIn.currentUser.displayName),
                      OutlineButton( child: Text("Logout"), onPressed: (){
                        _logout();
                      },)
                    ],
                  )
                : Center(
                    child: OutlineButton(
                      child: Text("Login with Google",),
                      textColor: Colors.white,
                      onPressed: () {
                        _login();
                      },
                    ),
                  )
                  ), 
    );
  }
}