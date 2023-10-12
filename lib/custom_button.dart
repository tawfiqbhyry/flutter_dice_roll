import 'package:flutter/material.dart';
import 'package:flutter_application_1/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      this.onPressFunction, this.bgColor, this.width, this.text, this.disabled,
      {super.key});
  final String text;
  final Color bgColor;
  final double width;
  final Function onPressFunction;
  final bool disabled;
  final double timing = 20;

  @override
  Widget build(context) {
    return SizedBox(
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: disabled?Colors.black45 : bgColor,
            padding: const EdgeInsets.all(13),
            foregroundColor: Colors.white,
            elevation: 15,
          ),
          onPressed: disabled
              ? null
              : () {
                  onPressFunction();
                },
          child: CustomText(text),
        ),
      ),
    );
  }
}
