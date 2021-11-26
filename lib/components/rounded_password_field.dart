import 'package:flutter/material.dart';
import 'package:flutter_login_reg/components/text_field_container.dart';
import 'package:flutter_login_reg/constants.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged onChanged;

  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _secureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: _secureText,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: IconButton(
            icon: Icon(_secureText == true ? Icons.visibility : Icons.visibility_off),
            color: kPrimaryColor,
            onPressed: () {
              setState(() {
                _secureText = !_secureText;
              });
            },
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
