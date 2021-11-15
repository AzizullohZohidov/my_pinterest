import 'package:flutter/material.dart';

class RectangularButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color1;
  final Color color2;
  const RectangularButton({
    Key? key,
    required this.text,
    required this.press,
    required this.color1,
    required this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.only(top: 6.0, bottom: 6.0),
        child: Container(
          width: double.infinity,
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                Colors.redAccent,
                Colors.red,
              ],
            ),
            boxShadow: [
              BoxShadow(
                offset: const Offset(3, 3),
                spreadRadius: 1,
                blurRadius: 4,
                color: Colors.red,
              ),
              BoxShadow(
                offset: const Offset(-5, -5),
                spreadRadius: 1,
                blurRadius: 4,
                color: Colors.redAccent,
              ),
            ],
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
