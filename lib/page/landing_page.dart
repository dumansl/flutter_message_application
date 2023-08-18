import 'package:flutter/material.dart';
import 'package:flutter_message_application/page/home_page.dart';
import 'package:flutter_message_application/page/sign_in_page.dart';
import 'package:flutter_message_application/viewmodel/user_model.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userModel = Provider.of<UserViewModel>(context, listen: true);
    if (userModel.state == ViewState.Idle) {
      if (userModel.user == null) {
        return SignInPage();
      } else {
        return HomePage(user: userModel.user);
      }
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
