import 'package:flutter/material.dart';
import 'package:flutter_login_reg/constants.dart';


class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.6,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
            style: TextButton.styleFrom(
              backgroundColor: color,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            ),
            onPressed: () {
              press();
            },
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
              ),
            )),
      ),
    );
  }
}