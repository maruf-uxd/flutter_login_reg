import 'package:flutter/material.dart';
import 'package:flutter_login_reg/Screens/Home/components/body.dart';
import 'package:flutter_login_reg/utils/session_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
        ), 
      ),
      body: Body(),
    );
  }
}
