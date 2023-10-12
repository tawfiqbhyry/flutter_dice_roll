import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(this.text, {super.key});
  final String text;

  @override
  Widget build(context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontStyle: FontStyle.italic,
          fontFamily: "Courier",
        ),
      ),
    );
  }
}
