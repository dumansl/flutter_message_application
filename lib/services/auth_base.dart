import 'package:flutter_message_application/model/user.dart';

abstract class AuthBase {
  Future<UserModel> currentUser();
  Future<UserModel> singInAnonymously();
  Future<bool> signOut();
}
