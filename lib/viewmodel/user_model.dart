import 'package:flutter/cupertino.dart';
import 'package:flutter_message_application/locator.dart';
import 'package:flutter_message_application/model/user.dart';
import 'package:flutter_message_application/repository/user_repository.dart';
import 'package:flutter_message_application/services/auth_base.dart';

enum ViewState { Idle, Busy }

class UserViewModel with ChangeNotifier implements AuthBase {
  ViewState _state = ViewState.Idle;
  final UserRepository _userRepository = locator<UserRepository>();
  late UserModel _user = UserModel(userID: "");

  UserModel get user => _user;
  ViewState get state => _state;

  set state(ViewState value) => _state = value;
  @override
  void notifyListeners();

  UserViewModel() {
    currentUser();
  }

  @override
  Future<UserModel> currentUser() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.currentUser();
      return _user;
    } catch (e) {
      debugPrint("Sorun Burada4" + e.toString());
      return _user;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<bool> signOut() async {
    try {
      state = ViewState.Busy;
      return await _userRepository.signOut();
    } catch (e) {
      debugPrint("Sorun Burada5" + e.toString());
      return false;
    } finally {
      state = ViewState.Idle;
    }
  }

  @override
  Future<UserModel> singInAnonymously() async {
    try {
      state = ViewState.Busy;
      _user = await _userRepository.singInAnonymously();
      return _user;
    } catch (e) {
      debugPrint("Sorun Burada6" + e.toString());
      return _user;
    } finally {
      state = ViewState.Idle;
    }
  }
}
