import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_reg/Screens/Home/home_screen.dart';
import 'package:flutter_login_reg/Screens/Login/components/background.dart';
import 'package:flutter_login_reg/Screens/SignUp/sign_up_screen.dart';
import 'package:flutter_login_reg/components/already_have_an_account.dart';
import 'package:flutter_login_reg/components/rounded_button.dart';
import 'package:flutter_login_reg/components/rounded_input_field.dart';
import 'package:flutter_login_reg/components/rounded_password_field.dart';
import 'package:flutter_login_reg/components/text_field_container.dart';
import 'package:flutter_login_reg/constants.dart';
import 'package:flutter_login_reg/utils/session_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String email = '';
    String password = '';

    void emailField(String data) {
      email = data;
    }

    void passwordField(String data) {
      password = data;
    }

    bool validate() {
      if (email.isNotEmpty && password.isNotEmpty) {
        String tempMail = SessionManager.getUserEmail().toString();
        String tempPass = SessionManager.getUserPassword().toString();
        if (tempMail == email && tempPass == password) {
          return true;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              duration: Duration(seconds: 2),
              backgroundColor: Colors.red,
              content: Text(
                "email and password did not match",
              ),
            ),
          );
          return false;
        }
      } else {
        return false;
      }
    }

    void loginCheck() {
      if (validate()) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              SessionManager.setIsLoggedIn(true);
              return HomeScreen();
            },
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
        // showFlash(
        //   context: context,
        //   duration: const Duration(seconds: 1),
        //   builder: (context, controller) {
        //     return Flash.dialog(
        //       controller: controller,
        //       borderRadius: const BorderRadius.all(Radius.circular(8)),
        //       backgroundGradient: const LinearGradient(
        //         colors: [Colors.indigo, Colors.deepPurple],
        //       ),
        //       alignment: Alignment.bottomCenter,
        //       margin: const EdgeInsets.only(bottom: 36),
        //       child: const Padding(
        //         padding: EdgeInsets.all(8.0),
        //         child: Text('both fields are required',
        //             style: TextStyle(
        //               color: Colors.white,
        //               fontSize: 16,
        //             )),
        //       ),
        //     );
        //   },
        // );
      }
    }

    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "LOGIN",
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * .03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.3,
            ),
            SizedBox(height: size.height * .03),
            RoundedInputField(
              hintText: "Your email",
              onChanged: (value) {
                emailField(value);
              },
              icon: Icons.person,
            ),
            RoundedPasswordField(
              onChanged: (value) {
                passwordField(value);
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                loginCheck();
              },
            ),
            SizedBox(height: size.height * .04),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
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
