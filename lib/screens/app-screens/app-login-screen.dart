import 'package:flutter/material.dart';
import 'package:flutter_firebase_sign_in/screens/user/user-home-screen.dart';
import 'package:flutter_firebase_sign_in/services/sign-in-with-google.dart';

class AppLoginScreen extends StatefulWidget {
  @override
  AppLoginScreenState createState() => AppLoginScreenState();
}

class AppLoginScreenState extends State<AppLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 600),
              GoogleSignInButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget GoogleSignInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        SignInWithGoogle().then((result) {
          if (result != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return UserHomeScreen();
                },
              ),
            );
          }
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
