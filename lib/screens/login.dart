import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../Models/colour.dart';
import 'homePage.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Color(0xffe7f4f5),
        body: Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/kids.png'),
                          fit: BoxFit.contain)),
                ),
                Text(
                  'Hello!',
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.openSans(color: Colors.black, fontSize: 28),
                ),
                SizedBox(height: 10),
                Text(
                  'Enter your email and password below to continue \nand let the learning begin!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(color: Colors.black54, fontSize: 14),
                ),
                SizedBox(
                  height: 50,
                ),
                _buildTextField(
                    nameController, Icons.account_circle, 'Username'),
                SizedBox(height: 20),
                _buildTextField(passwordController, Icons.lock, 'Password'),
                SizedBox(height: 40),
                MaterialButton(
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 50,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }, //async {
                  //   User firebaseUser;
                  //   firebaseAuth
                  //       .signInWithEmailAndPassword(
                  //           email: 'user1@gmail.com', password: 'demo123')
                  //       .then((authResult) {
                  //     setState(() {
                  //       firebaseUser = authResult.user;
                  //     });
                  //     print(firebaseUser.email);
                  //   });
                  // },
                  color: darkBlue,
                  child: Text('Login',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  textColor: Colors.white,
                ),
                SizedBox(height: 20),
                MaterialButton(
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 50,
                  onPressed: () {}, //_signInWithGoogle(),
                  color: yellow,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.google),
                      SizedBox(width: 10),
                      Text('Sign-in using Google',
                          style:
                              TextStyle(color: Colors.black54, fontSize: 16)),
                    ],
                  ),
                  textColor: Colors.white,
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ));
  }

  _buildTextField(
      TextEditingController controller, IconData icon, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: Colors.white38, border: Border.all(color: Colors.white)),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.black54),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.black38),
            icon: Icon(
              icon,
              color: Colors.black54,
            ),
            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }

//   _signInWithGoogle() async {
//     final GoogleSignInAccount googleUser = await googleSignIn.signIn();
//     final GoogleSignInAuthentication googleAuth =
//         await googleUser.authentication;

//     final AuthCredential credential = GoogleAuthProvider.credential(
//         idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

//     final User user =
//         (await firebaseAuth.signInWithCredential(credential)).user;
//   }

//   void setState(Null Function() param0) {}
// }
}
