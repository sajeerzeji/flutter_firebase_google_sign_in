import 'package:flutter/material.dart';
import 'package:flutter_firebase_sign_in/screens/app-screens/app-login-screen.dart';
import 'package:flutter_firebase_sign_in/services/sign-in-with-google.dart';

class UserHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        actions: [
          Container(
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    imageUrl,
                  ),
                  radius: 20,
                  backgroundColor: Colors.transparent,
                ),
                SizedBox(width: 10),
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.grey[800]
                  ),
                ),
                FlatButton(
                  child: Image(
                      image: AssetImage('assets/logout_icon.png'),
                      width: 30.0,
                  ),
                  onPressed: () {
                    signOutGoogle();
                    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return AppLoginScreen();}), ModalRoute.withName('/'));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(),
        padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
        child: Column(
          children: [
            Row(
              children: [
                Text('Hello '),
                Text(
                  name + ' !',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Row(
              children: [
                Text('Here\'s your data')
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text('Name: ', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(name),
              ],
            ),
            Row(
              children: [
                Text('Email: ', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(email),
              ],
            ),
            if (phoneNumber != null)
            Row(
              children: [
                Text('Phone: ', style: TextStyle(fontWeight: FontWeight.bold)),
                Text(phoneNumber),
              ],
            ),
            if (tenantID != null)
              Row(
                children: [
                  Text('Tenant ID: ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(tenantID),
                ],
              ),
            if (userID != null)
              Row(
                children: [
                  Text('User ID: ', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(userID),
                ],
              ),
          ]
        ),
        /*child: Column(
          children: <Widget>[
            Text(
              'NAME',
            ),
            Text(
              name,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'EMAIL',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
            Text(
              email,
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40),

            RaisedButton(
              onPressed: () {
                signOutGoogle();
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) {return AppLoginScreen();}), ModalRoute.withName('/'));
              },
              color: Colors.deepPurple,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Sign Out',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
            )
          ],
        ),*/
      ),
    );
  }
}