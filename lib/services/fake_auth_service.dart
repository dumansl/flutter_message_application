import 'package:flutter_message_application/model/user.dart';
import 'package:flutter_message_application/services/auth_base.dart';

class FakeAuthenticationService implements AuthBase {
  String userID = "123123123123123213123123123";

  @override
  Future<UserModel> currentUser() async {
    return await Future.value(UserModel(userID: userID));
  }

  @override
  Future<bool> signOut() {
    return Future.value(true);
  }

  @override
  Future<UserModel> singInAnonymously() async {
    return await Future.delayed(
        const Duration(seconds: 2), () => UserModel(userID: userID));
  }
}
