import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_pinterest/home_screen.dart';
import 'package:my_pinterest/log_in/login_screen.dart';
import 'package:my_pinterest/sign_up/signup_screen.dart';
import 'package:my_pinterest/widgets/account_check.dart';
import 'package:my_pinterest/widgets/rectangular_button.dart';
import 'package:my_pinterest/widgets/rectangular_input_field.dart';

class Credentials extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late TextEditingController _emailTextController =
      TextEditingController(text: '');

  late TextEditingController _passTextController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Center(
              child: Image.asset(
                'assets/forget.png',
                width: 230.0,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          RectangularInputField(
            hintText: 'Enter Email',
            icon: Icons.email_rounded,
            obscureText: false,
            textEditingController: _emailTextController,
          ),
          SizedBox(height: 30.0 / 2),
          RectangularButton(
            text: 'Send Link',
            press: () async {
              try {
                await _auth.sendPasswordResetEmail(
                  email: _emailTextController.text,
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LoginScreen(),
                  ),
                );
              } catch (error) {
                Fluttertoast.showToast(
                  msg: error.toString(),
                );
              }
            },
            color1: Colors.red,
            color2: Colors.redAccent,
          ),
          AccountCheck(
            login: false,
            press: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => LoginScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
