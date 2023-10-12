import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

import 'package:flutter_application_1/custom_text.dart';
import 'package:flutter_application_1/custom_button.dart';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
  @override
  DiceRollerState createState() {
    return DiceRollerState();
  }
}

class DiceRollerState extends State<DiceRoller>
    with SingleTickerProviderStateMixin {
  final Color bgColor = Colors.blue;
  final String text = "Roll";

  String changableText = "";
  bool disabled = false;
  String assetsStr = "assets/images/dice-1.png";

  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void rollDice() async {
    _controller.reset();
    Random random = Random();
    int randNumber = random.nextInt(6) + 1;
    String myText = "Rolled $randNumber";
    setState(() {
      disabled = true;
      _controller.forward();
      changableText = myText;
    });

    await Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        assetsStr = "assets/images/dice-$randNumber.png";
        disabled = false;
      });
    });
  }

  @override
  Widget build(context) {
    final double mainWidth = MediaQuery.of(context).size.width / 2;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CustomText("Roll the dice!"),
        RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
          child: Image.asset(
            assetsStr,
            width: mainWidth,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        CustomButton(
          rollDice,
          bgColor,
          mainWidth,
          text,
          disabled,
        ),
        CustomText(changableText),
      ],
    );
  }
}
