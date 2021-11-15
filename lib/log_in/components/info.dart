import 'package:flutter/material.dart';
import 'package:my_pinterest/widgets/account_check.dart';
import 'package:my_pinterest/widgets/rectangular_button.dart';
import 'package:my_pinterest/widgets/rectangular_input_field.dart';

class Credentials extends StatelessWidget {
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
            child: CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("asset/logo1.png"),
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
          RectangularInputField(
            hintText: 'Enter Password',
            icon: Icons.lock,
            obscureText: true,
            textEditingController: _passTextController,
          ),
          SizedBox(height: 30.0 / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {},
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          RectangularButton(
            text: 'Login',
            press: () {},
            color1: Colors.red,
            color2: Colors.redAccent,
          ),
          AccountCheck(
            login: true,
            press: () {},
          ),
        ],
      ),
    );
  }
}
