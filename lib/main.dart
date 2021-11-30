import 'package:flutter/material.dart';
import 'package:flutter_login_reg/Screens/Home/home_screen.dart';
import 'package:flutter_login_reg/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_login_reg/constants.dart';
import 'package:flutter_login_reg/utils/session_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SessionManager.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: SessionManager.getIsLoggedIn() == false ? const WelcomeScreen() : const HomeScreen(),
    );
  }
}


