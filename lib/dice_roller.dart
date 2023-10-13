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
    setState(() {
      disabled = true;
    });
    int lastRand = random.nextInt(6) + 1;
    for (int i = 1; i <= 5; i++) {
      int randNumber = random.nextInt(6) + 1;
      String myText = "Rolled $randNumber";
      int dur = (i > 4 || i < 3) ? 700 : 300;
      setState(() {
        if (i == 5) {
          while (randNumber == lastRand) {
            randNumber = random.nextInt(6) + 1;
          }
          lastRand = randNumber;
          myText = "Rolled $randNumber";
        }
        _controller.duration = Duration(milliseconds: dur);
        assetsStr = "assets/images/dice-$randNumber.png";
        changableText = myText;
        _controller.forward();
      });

      await Future.delayed(const Duration(milliseconds: 100), () {
        setState(() {
          disabled = false;
        });
      });
    }
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
