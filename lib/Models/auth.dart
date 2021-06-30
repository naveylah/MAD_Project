import 'package:firebase_auth/firebase_auth.dart';
import 'package:mad_mad/screens/loginScreen.dart';

class AuthService {
  User _userFromFirebase(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  //anonymous signin

  Future signinAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  //sign in email & password

}
