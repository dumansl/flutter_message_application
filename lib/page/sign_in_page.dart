import 'package:flutter/material.dart';
import 'package:flutter_message_application/model/user.dart';
import 'package:flutter_message_application/viewmodel/user_model.dart';
import 'package:flutter_message_application/wedgits/buttons/social_log_in_button.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  void _guestAccount(BuildContext context) async {
    final userModel = Provider.of<UserViewModel>(context);
    UserModel user = await userModel.singInAnonymously();
    print("Oturum açan user id:${user.userID}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Message App"),
        elevation: 0,
      ),
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "SIGN IN",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            LoginButton(
              onPressed: () => () {},
              butonIcon: const Icon(
                Icons.email,
                color: Colors.white,
                size: 32,
              ),
              butonText: "Login with Email and Password",
            ),
            const SizedBox(
              height: 8,
            ),
            LoginButton(
              butonText: "Sign in with Google",
              textColor: Colors.black87,
              butonColor: Colors.white,
              butonIcon: Image.asset("assets/images/google-logo.png"),
              onPressed: () {},
            ),
            const SizedBox(
              height: 8,
            ),
            LoginButton(
              butonText: "Login with Facebook",
              butonIcon: Image.asset("assets/images/facebook-logo.png"),
              onPressed: () {},
              butonColor: const Color(0xFF334D92),
            ),
            const SizedBox(
              height: 8,
            ),
            LoginButton(
              onPressed: () => () {},
              butonIcon: const Icon(
                Icons.phone,
                color: Colors.white,
                size: 32,
              ),
              butonText: "Login with Phone Number",
            ),
            LoginButton(
              onPressed: () => _guestAccount(context),
              butonColor: Colors.teal,
              butonIcon: const Icon(Icons.supervised_user_circle),
              butonText: "Guest Account",
            ),
          ],
        ),
      ),
    );
  }
}
