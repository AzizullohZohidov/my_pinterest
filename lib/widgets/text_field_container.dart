import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30.0 / 2),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.redAccent,
            Colors.red,
          ],
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            offset: const Offset(-2, -2),
            spreadRadius: 1,
            blurRadius: 4,
            color: Colors.red,
          ),
          BoxShadow(
            offset: const Offset(2, 2),
            spreadRadius: 1,
            blurRadius: 4,
            color: Colors.redAccent,
          ),
        ],
      ),
      child: child,
    );
  }
}
