import 'package:flutter/material.dart';
import 'package:mad_mad/Models/auth.dart';
import 'package:mad_mad/colour.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black26,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: RaisedButton(
            child: Text("Sign in as Anon"),
            onPressed: () async {
              dynamic result = await _auth.signinAnon();
              if (result == null) {
                print("error signing in");
              } else {
                print("signed in");
                print(result.uid);
              }
            }),
      ),
    );
  }
}

class User {
  final String uid;

  User({this.uid});
}
