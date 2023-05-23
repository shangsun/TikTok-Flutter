import 'package:firebase_auth/firebase_auth.dart';
import '../../model/tiktok_user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  TikTokUser _userFromFirebaseUser(User? user) {
    if (user == null) {
      return new TikTokUser(uid: "");
    }

    return TikTokUser(uid: user.uid);
  }

  // auth change user stream
  Stream<TikTokUser> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential credential = await _auth.signInAnonymously();
      User? user = credential.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  // sign in with email & password

  // register with email & password

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return new TikTokUser(uid: "");
    }
  }
}
