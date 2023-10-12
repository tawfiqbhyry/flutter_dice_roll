import 'package:flutter/material.dart';
import 'package:flutter_application_1/dice_roller.dart';


class GradientContainer extends StatelessWidget{
  const GradientContainer(this.colors, {super.key});
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: const Center(
        child: DiceRoller(),
      ),
    );
  }
}
