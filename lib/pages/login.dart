import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quik_scan/services/bottomNavController.dart';
import 'register.dart';
import 'package:quik_scan/services/notifications.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  var notifications = Notifications();


  @override
  void initState() {
    super.initState();
    getUser().then((user) {
    });
  }

  Future<FirebaseUser> getUser() async {
    return await _auth.currentUser();
  }


  void signInWithEmail() async {
    FirebaseUser user;
    try {
      user = (await _auth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text)).user;
    } catch (e) {
      print(e.toString());
    } finally {
      if (user != null) {
        notificationNow();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BottomNavController()),
          );
        // sign in successful!
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
      }
    }
  }

  void notificationNow() {
    notifications.sendNotificationsNow('Upgrade to Premium', 'Two weeks left in free trial.', 'payload');
  }

  @override
  Widget build(BuildContext context) {
    notifications.init();
    return new Scaffold(
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