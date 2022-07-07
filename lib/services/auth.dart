import 'package:azimio/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // user model to firebase user
  UserModel? _userFromFirebase(User? user) {
    if (user != null) {
      return UserModel(uid: user.uid);
    } else {
      return null;
    }
  }

  Stream<UserModel?> get onAuthStateChanged{
    return _auth.authStateChanges()
    .map((User? user) => _userFromFirebase(user));
    //.map(_userFromFirebase);
  }
  //listen to auth changes
  Stream<UserModel?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebase(user));
  }

//signin anonymously
  Future signInAnonymously() async {
    try {
      final userCredential = await _auth.signInAnonymously();
      User? result = userCredential.user;
      return _userFromFirebase(result!);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          return null;
      }
    }
  }

  // create user with email and password
  Future createWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? result = userCredential.user;
      return _userFromFirebase(result!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      return null;
    }
  }

  //signin with email and password
  Future signinWithEmailAndPassword(String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? result = userCredential.user;
      return _userFromFirebase(result!);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    } catch (e) {
      return null;
    }
  }

  //sign out
  Future signOut() async {
    return await _auth.signOut();
  }
}
