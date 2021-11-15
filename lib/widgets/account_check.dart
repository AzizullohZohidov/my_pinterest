import 'package:flutter/material.dart';

class AccountCheck extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  const AccountCheck({Key? key, required this.login, required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? 'Do not have an account?' : 'Already have an account',
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? 'Create account' : 'Log in',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
        const SizedBox(height: 50.0),
      ],
    );
  }
}
