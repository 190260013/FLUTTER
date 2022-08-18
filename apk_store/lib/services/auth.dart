import 'package:apk_store/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  myUser _userfromUser(var user) {
    if (user != null)
      return myUser(
          uid: user.uid,
          email: user.email,
      );
    else
      return myUser(uid: "null");
  }

  Stream<myUser> get userrr {
    return _auth.authStateChanges().map((var user) => _userfromUser(user));
  }

  Future signInAnon() async {
    try {
      var result = await _auth.signInAnonymously();
      return _userfromUser(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signUp({required String email, required String password}) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return _userfromUser(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signIn({required String email,required String password}) async{
    try {
      var result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return _userfromUser(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
