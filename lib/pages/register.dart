import 'dart:async';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quik_scan/services/bottomNavController.dart';
import 'package:quik_scan/services/notifications.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  var notifications = Notifications();


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

  void notificationNow() {
    notifications.sendNotificationsNow('Upgrade to Premium', 'Two weeks left in free trial.', 'payload');
  }


  @override
  Widget build(BuildContext context) {
    notifications.init();
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.indigo,
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
                      onPressed: () => signUpWithEmail(),
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