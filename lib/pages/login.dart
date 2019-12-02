import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quik_scan/services/bottomNavController.dart';
import 'register.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();


  @override
  void initState() {
    super.initState();
    getUser().then((user) {
      if (user != null) {
        // send the user to the home page
        // homePage();
      }
    });
  }

  Future<FirebaseUser> getUser() async {
    return await _auth.currentUser();
  }

  void signUpWithEmail() async {
    // marked async
    FirebaseUser user;
    try {
      user = (await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )).user;
    } catch (e) {
      print(e.toString());
    } finally {
      if (user != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BottomNavController()),
          );
        // sign in successful!
        // ex: bring the user to the home page
      } else {
        // sign in unsuccessful
        // ex: prompt the user to try again
      }
    }
  }

  void signInWithEmail() async {
    // marked async
    FirebaseUser user;
    try {
      user = (await _auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text)).user;
    } catch (e) {
      print(e.toString());
    } finally {
      if (user != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BottomNavController()),
          );
        // sign in successful!
        // ex: bring the user to the home page
      } else {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Invalid Information Try Again'),
        );
      }
    );
        // sign in unsuccessful
        // ex: prompt the user to try again
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      //resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: new Text('Login'),
        backgroundColor: Colors.indigo,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 32.0,
          ),
          child: Column(
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
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Enter Email',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Enter Password",
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Builder(
                  builder: (context) {
                    return RaisedButton(
                      onPressed: () => signInWithEmail(),
                      color: Colors.indigo,
                      textColor: Colors.white,
                      child: Text('Login'),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  "New User? Register Below",
                  style:TextStyle(color: Colors.grey[700],
                  fontWeight: FontWeight.w500, 
                  fontSize: 18),
                    )
                  ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Builder(
                  builder: (context) {
                    return RaisedButton(
                      onPressed: () => 
                       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Register()),
                       ),
                      color: Colors.indigo,
                      textColor: Colors.white,
                      child: Text('Register'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}