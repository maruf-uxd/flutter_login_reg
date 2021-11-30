import 'package:flutter/material.dart';
import 'package:flutter_login_reg/Screens/Login/login_screen.dart';
import 'package:flutter_login_reg/Screens/SignUp/components/background.dart';
import 'package:flutter_login_reg/components/already_have_an_account.dart';
import 'package:flutter_login_reg/components/rounded_button.dart';
import 'package:flutter_login_reg/components/rounded_input_field.dart';
import 'package:flutter_login_reg/components/rounded_password_field.dart';
import 'package:flutter_login_reg/constants.dart';
import 'package:flutter_login_reg/utils/session_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  Body({
    Key? key,
  }) : super(key: key);

  String email = '';
  String password = '';

  @override
  void initState() {
    email = SessionManager.getUserEmail() ?? "";

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    emailField(String data) {
      email = data;
    }

    passwordField(String data) {
      password = data;
    }

    bool validation() {

      print(SessionManager.getUserEmail().toString());
      if (email.isNotEmpty && password.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    }

    registerNewUser() {
      if (validation()) {
        SessionManager.setUserEmail(email);
        SessionManager.setUserPassword(password);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 2),
            backgroundColor: Colors.green,
            content: Text(
              "Registration Complete",
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(seconds: 2),
            backgroundColor: Colors.red,
            content: Text(
              "both fields are required",
            ),
          ),
        );
      }
    }

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sign Up",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              width: size.width * 0.4,
            ),
            RoundedInputField(
              hintText: "Your email",
              onChanged: (value) {
                emailField(value);
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                passwordField(value);
              },
            ),
            RoundedButton(
              text: "Sign Up",
              press: () {
                registerNewUser();
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                // Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
