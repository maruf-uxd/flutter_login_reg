import 'package:flutter/material.dart';
import 'package:flutter_login_reg/Screens/Login/components/background.dart';
import 'package:flutter_login_reg/Screens/SignUp/sign_up_screen.dart';
import 'package:flutter_login_reg/components/already_have_an_account.dart';
import 'package:flutter_login_reg/components/rounded_button.dart';
import 'package:flutter_login_reg/components/rounded_input_field.dart';
import 'package:flutter_login_reg/components/rounded_password_field.dart';
import 'package:flutter_login_reg/components/text_field_container.dart';
import 'package:flutter_login_reg/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              onChanged: (value) {},
              icon: Icons.person,
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {

              },
            ),
            SizedBox(height: size.height * .03),
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
