import 'dart:io';

import 'package:flutter_message_application/locator.dart';
import 'package:flutter_message_application/model/user.dart';
import 'package:flutter_message_application/services/auth_base.dart';
import 'package:flutter_message_application/services/fake_auth_service.dart';
import 'package:flutter_message_application/services/firebase_auth_service.dart';
import 'package:timeago/timeago.dart' as timeago;

enum AppMode { DEBUG, RELEASE }

class UserRepository implements AuthBase {
  final FirebaseAuthService _firebaseAuthService = locator<FirebaseAuthService>();
  final FakeAuthenticationService _fakeAuthenticationService =
      locator<FakeAuthenticationService>();

  AppMode appMode = AppMode.RELEASE;

  @override
  Future<UserModel> currentUser() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.currentUser();
    } else {
      return await _firebaseAuthService.currentUser();
    }
  }

  @override
  Future<bool> signOut() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.signOut();
    } else {
      return await _firebaseAuthService.signOut();
    }
  }

  @override
  Future<UserModel> singInAnonymously() async {
    if (appMode == AppMode.DEBUG) {
      return await _fakeAuthenticationService.singInAnonymously();
    } else {
      return await _firebaseAuthService.singInAnonymously();
    }
  }
}
