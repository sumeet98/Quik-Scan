import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'main.dart';
import 'main_menu.dart';
import 'page1.dart';

class Login extends StatelessWidget {

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();
String userName = " ";


Future<String> signInWithGoogle() async {
  print("test");
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final FirebaseUser user = await _auth.signInWithCredential(credential);

  assert(user.email != null);
  assert(user.displayName != null);
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);
  print(currentUser);
  userName = user.displayName;

  return 'signInWithGoogle succeeded: $user';
}

void signOutGoogle() async{
  await googleSignIn.signOut();

  print("User Sign Out");
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome to Quik Scan",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.indigo,
      body: Center(
        child: Column(
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
                    color: Colors.indigo, 
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
              ),

              Padding( 
               padding: EdgeInsets.all(8), 
              ),

              new Container( 
                child: new TextFormField( 
                  obscureText: true, 
                  style: new TextStyle(  
                    color: Colors.indigo, 
                  ), 
                  decoration: InputDecoration( 
                  labelText: 'Password',
                  ),
                ),
                decoration: new BoxDecoration(  
                  borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
                  color: Colors.white,
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
          signInWithGoogle().whenComplete(() {
    signInWithGoogle().whenComplete(() {
          Navigator.push(context, new MaterialPageRoute(builder: (context) => new Page1(user: new User(userName,"link"))));
    }
    );
          });
  },
      
        
                
          child: Image.network( 
            'https://www.c-learning.net/storage/app/media/img/buttons/google-login-button.png',
            width: 200,
          ),
          )
        )]
          )
                ),
                      );

    
  }
          }

  
  class User { 
    final String name;
    final String displayPic; 

    User(this.name, this.displayPic); 
  }

  
  
