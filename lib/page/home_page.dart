import 'package:flutter/material.dart';
import 'package:flutter_message_application/model/user.dart';
import 'package:provider/provider.dart';

import '../viewmodel/user_model.dart';

class HomePage extends StatelessWidget {
  final UserModel user;
  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton(
            onPressed: () => _signOut(context),
            child: const Text(
              "Sign Out",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
        title: const Text("Home Page"),
      ),
      body: Center(child: Text("Welcome ${user.userID}")),
    );
  }
}

Future<bool> _signOut(BuildContext context) async {
  final userModel = Provider.of<UserViewModel>(context, listen: false);
  bool result = await userModel.signOut();
  return result;
}
