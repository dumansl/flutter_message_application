import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_message_application/locator.dart';
import 'package:flutter_message_application/page/landing_page.dart';
import 'package:flutter_message_application/viewmodel/user_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserViewModel(),
      child: MaterialApp(
        title: 'Flutter Message Application',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
 
        ),
        home: ChangeNotifierProvider(
          create: (context) => UserViewModel(),
          child: LandingPage(),
        ),
      ),
    );
  }
}
