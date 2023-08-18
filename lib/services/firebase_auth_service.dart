import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_message_application/model/user.dart';
import 'package:flutter_message_application/services/auth_base.dart';

class FirebaseAuthService implements AuthBase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  late UserModel user;

  @override
  Future<UserModel> currentUser() async {
    try {
      User user = _firebaseAuth.currentUser!;
      return _userFromFirebase(user)!;
    } catch (e) {
      debugPrint("Sorun Burada1"+e.toString());
      return user;
    }
  }

  UserModel? _userFromFirebase(User? user) {
    if (user == null) {
      return null;
    } else {

      return UserModel(userID: user.uid);
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      await _firebaseAuth.signOut();
      return true;
    } catch (e) {
      debugPrint("Sorun Burada2"+e.toString());
      return false;
    }
  }

  @override
  Future<UserModel> singInAnonymously() async {
    try {
      UserCredential result = await _firebaseAuth.signInAnonymously();
      return _userFromFirebase(result.user!)!;
    } catch (e) {
      debugPrint("Sorun Burada3"+e.toString());
      return user;
    }
  }
}
