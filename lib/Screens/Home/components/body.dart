import 'package:flutter/material.dart';
import 'package:flutter_login_reg/Screens/Home/components/background.dart';
import 'package:flutter_login_reg/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_login_reg/components/rounded_button.dart';
import 'package:flutter_login_reg/constants.dart';
import 'package:flutter_login_reg/utils/session_manager.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  void logoutCheck(context) {
    SessionManager.setIsLoggedIn(false);
    Navigator.pushAndRemoveUntil(
        context,
        PageRouteBuilder(pageBuilder: (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
          return WelcomeScreen();
        }, transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return new SlideTransition(
            position: new Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        }),
            (Route route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Text(
                "Welcome\n" + SessionManager.getUserEmail().toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            RoundedButton(
              text: "LOGOUT",
              press: () {
                logoutCheck(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}